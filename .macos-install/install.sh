# Apps
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
curl -L https://raw.githubusercontent.com/flyingdot/dotfiles/master/.macos-install/install-apps.sh | sh
curl -L https://raw.githubusercontent.com/flyingdot/dotfiles/master/.macos-install/install-appstore-apps.sh | sh
curl -L https://raw.githubusercontent.com/flyingdot/dotfiles/master/.macos-install/dotfiles.sh | sh
curl -L https://raw.githubusercontent.com/flyingdot/dotfiles/master/.macos-install/vim.sh | sh

# Configuration
# git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core fetch --unshallow
# git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask fetch --unshallow
