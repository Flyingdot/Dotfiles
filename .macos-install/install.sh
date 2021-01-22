# Apps
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core fetch --unshallow
git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask fetch --unshallow

curl -L https://raw.githubusercontent.com/flyingdot/dotfiles/master/.macos-install/install-apps.sh | sh
curl -L https://raw.githubusercontent.com/flyingdot/dotfiles/master/.macos-install/install-appstore-apps.sh | sh

