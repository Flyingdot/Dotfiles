#!/bin/bash
# Bootstrap a fresh Mac. Safe to re-run.
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/Flyingdot/Dotfiles/master/.macos-install/install.sh)"
#
# All questions come in the first few minutes (password, App Store, GitHub login).
# After that it runs unattended: core tools first, then the large apps.
set -euo pipefail
cd "$HOME"

LOG="$HOME/macos-install.log"
exec > >(tee -a "$LOG") 2>&1
echo "=== $(date) ==="

FAILED=()
step() { printf '\n==> %s\n' "$*"; }
# try <label> <command...>: run, remember failures, keep going
try() { local label=$1; shift; "$@" || FAILED+=("$label"); }

bundle() {
  local file="$HOME/.macos-install/$1" out
  out=$(mktemp)
  brew bundle --file="$file" 2>&1 | tee "$out" || true
  while read -r line; do FAILED+=("$line"); done < <(grep -E 'has failed' "$out")
  rm -f "$out"
}

checkout_bare() { # <git-dir> <url>
  local dir=$1 url=$2
  [ -d "$dir" ] && return 0
  git clone --bare "$url" "$dir"
  local g=(/usr/bin/git --git-dir="$dir" --work-tree="$HOME")
  "${g[@]}" config status.showUntrackedFiles no
  if ! "${g[@]}" checkout 2>/dev/null; then
    echo "Backing up conflicting files to ~/.config-backup"
    # the checkout is expected to fail here; we only want its list of conflicting files
    { "${g[@]}" checkout 2>&1 || true; } | awk '/^\t/ {print $1}' | while read -r f; do
      mkdir -p "$HOME/.config-backup/$(dirname "$f")"
      mv "$HOME/$f" "$HOME/.config-backup/$f"
    done
    "${g[@]}" checkout
  fi
}

# ---------------------------------------------------------------- questions
step "Administrator password (asked once)"
sudo -v
while true; do sudo -n true; sleep 50; kill -0 "$$" 2>/dev/null || exit; done 2>/dev/null &
SUDO_KEEPALIVE=$!
trap 'kill "$SUDO_KEEPALIVE" 2>/dev/null' EXIT

step "Touch ID for sudo"
if ! grep -qs '^auth.*pam_tid.so' /etc/pam.d/sudo_local; then
  echo "auth       sufficient     pam_tid.so" | sudo tee -a /etc/pam.d/sudo_local >/dev/null
fi

step "App Store sign-in"
open -a "App Store"
read -r -p "Sign in to the App Store (needed for the App Store apps), then press Enter... " </dev/tty

step "Homebrew (also installs the Xcode Command Line Tools)"
if [ ! -x /opt/homebrew/bin/brew ]; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

step "GitHub login (for private dotfiles)"
brew list gh >/dev/null 2>&1 || brew install gh
if ! gh auth status >/dev/null 2>&1; then
  # Non-interactive device flow: gh's interactive prompts break on some terminals
  # ("could not prompt: unexpected escape sequence from terminal").
  echo "Paste the one-time code below into the GitHub page that opens (it's already in your clipboard)."
  open "https://github.com/login/device"
  gh auth login --hostname github.com --git-protocol https --web --clipboard </dev/null
fi

echo
echo "No more questions. The rest runs on its own; log: $LOG"

# ---------------------------------------------------------------- stage 1: core
step "Dotfiles (bare repo in ~/.cfg)"
# credits to https://www.atlassian.com/git/tutorials/dotfiles
checkout_bare "$HOME/.cfg" https://github.com/Flyingdot/Dotfiles.git

step "Private dotfiles (bare repo in ~/.cfg-secret)"
# authenticates through gh, via the credential helper in the .gitconfig checked out above
try "private dotfiles" checkout_bare "$HOME/.cfg-secret" https://github.com/Flyingdot/Dotfiles-Secret.git

step "Core tools (Brewfile.core)"
bundle Brewfile.core

step "fish as login shell + plugins"
FISH=/opt/homebrew/bin/fish
grep -qx "$FISH" /etc/shells || echo "$FISH" | sudo tee -a /etc/shells >/dev/null
[ "$(dscl . -read "$HOME" UserShell | awk '{print $2}')" = "$FISH" ] || sudo chsh -s "$FISH" "$USER"
try "fisher plugins" "$FISH" --no-config -c 'curl -fsSL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; and fisher update'

step "Node via nvm (config.fish runs 'nvm use default')"
install_node() {
  export NVM_DIR="$HOME/.nvm"
  mkdir -p "$NVM_DIR"
  set +u
  . "$(brew --prefix nvm)/nvm.sh"
  nvm install 24 && nvm alias default 24
  local rc=$?
  set -u
  return $rc
}
try "node via nvm" install_node

step "Neovim plugins (pinned by lazy-lock.json)"
try "neovim plugins" nvim --headless "+Lazy! restore" +qa

step "Yazi plugins"
try "yazi plugins" ya pkg install

step "macOS defaults"
try "macOS defaults" "$HOME/.macos-install/macos-defaults.sh"

echo
echo "Core setup done: kitty, fish, Neovim, 1Password and Crest are ready to use."

# ---------------------------------------------------------------- stage 2: apps
step "Apps (Brewfile.apps). Large downloads, this takes a while"
bundle Brewfile.apps

# ---------------------------------------------------------------- summary
step "Summary"
if [ ${#FAILED[@]} -eq 0 ]; then
  echo "Everything installed."
else
  echo "${#FAILED[@]} step(s) failed. Fix them and re-run this script:"
  printf '  - %s\n' "${FAILED[@]}"
fi
cat <<'EOF'

Manual steps left:
  - 1Password: sign in, enable the SSH agent (commit signing uses op-ssh-sign)
  - glab auth login / atuin login
  - Log out and back in (login shell, dark mode)
EOF
echo "Full log: $LOG"
