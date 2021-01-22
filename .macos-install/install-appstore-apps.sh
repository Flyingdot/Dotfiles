#!/bin/sh

# get Apple ID
echo ""
echo "Enter AppleID to signin to Mac App Store:"
read -p "  AppleID (john@foo.com): " APPLEID

# make sure signed into Mac App Store
mas signin $APPLEID

# install macos apps
mas install 882812218 # Owly 
mas install 1284863847 # Unsplash Wallpapers 
mas install 409183694 # Keynote 
mas install 1319778037 # iStat Menus 
mas install 409222199 # Cyberduck 
mas install 441258766 # Magnet 
mas install 1436953057 # Ghostery Lite 
mas install 1333542190 # 1Password 7 
mas install 425424353 # The Unarchiver 
mas install 407963104 # Pixelmator 
mas install 411643860 # DaisyDisk 
mas install 1462114288 # Grammarly for Safari 
mas install 1384080005 # Tweetbot 
mas install 1449412482 # Reeder 
mas install 497799835 # Xcode 
mas install 406056744 # Evernote 
mas install 1480933944 # Vimari 
mas install 1052074952 # Aurora HDR 
mas install 1274495053 # Microsoft To Do 
mas install 1295203466 # Microsoft Remote Desktop 
mas install 1477385213 # Save to Pocket 
mas install 1225570693 # Ulysses 
mas install 470158793 # Keka 
