#!/bin/bash
# Bootstrap a fresh Mac. Safe to re-run.
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/Flyingdot/Dotfiles/master/.macos-install/install.sh)"
set -euo pipefail
cd "$HOME"

step() { printf '\n==> %s\n' "$*"; }

step "Homebrew (also installs the Xcode Command Line Tools)"
if [ ! -x /opt/homebrew/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

step "Dotfiles (bare repo in ~/.cfg)"
# credits to https://www.atlassian.com/git/tutorials/dotfiles
config() { /usr/bin/git --git-dir="$HOME/.cfg" --work-tree="$HOME" "$@"; }
if [ ! -d "$HOME/.cfg" ]; then
  git clone --bare https://github.com/Flyingdot/Dotfiles.git "$HOME/.cfg"
  config config status.showUntrackedFiles no
  if ! config checkout 2>/dev/null; then
    echo "Backing up pre-existing dotfiles to ~/.config-backup"
    config checkout 2>&1 | awk '/^\t/ {print $1}' | while read -r f; do
      mkdir -p "$HOME/.config-backup/$(dirname "$f")"
      mv "$HOME/$f" "$HOME/.config-backup/$f"
    done
    config checkout
  fi
fi

step "Apps (Brewfile)"
echo "Sign in to the App Store now if you haven't, otherwise the mas entries fail."
brew bundle --file="$HOME/.macos-install/Brewfile" || echo "!! Some Brewfile entries failed, see above. Re-run this script after fixing."

step "fish as login shell + plugins"
FISH=/opt/homebrew/bin/fish
grep -qx "$FISH" /etc/shells || echo "$FISH" | sudo tee -a /etc/shells >/dev/null
[ "$(dscl . -read "$HOME" UserShell | awk '{print $2}')" = "$FISH" ] || chsh -s "$FISH"
"$FISH" --no-config -c 'curl -fsSL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; and fisher update'

step "Node via nvm (config.fish runs 'nvm use default')"
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
set +u
. "$(brew --prefix nvm)/nvm.sh"
nvm install 24
nvm alias default 24
set -u

step "Neovim plugins (pinned by lazy-lock.json)"
nvim --headless "+Lazy! restore" +qa

step "Yazi plugins"
ya pkg install

step "macOS defaults"
"$HOME/.macos-install/macos-defaults.sh"

step "Done. Manual steps left:"
cat <<'EOF'
  - 1Password: sign in, enable the SSH agent (commit signing uses op-ssh-sign)
  - gh auth login / glab auth login / atuin login
  - Private configs not in this repo: ~/.gitconfig-sb*, ~/.config/tmuxinator, ~/.config/zed
  - Log out and back in (login shell, dark mode)
EOF
