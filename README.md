# PrDE Emacs Config

## Installing Emacs on Mac OS X

Here is the comprehensive solution:

    brew cask install emacs
    xattr -rd com.apple.quarantine /Applications/Emacs.app/
    mkdir ~/projects/prde/; cd ~/projects/prde/
    git clone https://github.com/prde/prde-emacs-config.git
    ln -s ~/projects/prde/prde-emacs-config ~/.emacs.d

Then you can run your Emacs application - it is already pre-configured for you.

## Credits

Configuration is originated from "Clojure-friendly emacs config" here: https://github.com/flyingmachine/emacs-for-clojure

All product names, logos, and brands are property of their respective owners.
