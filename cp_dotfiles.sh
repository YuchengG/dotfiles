#!/bin/bash
# Used to cp dotfiles to current dir.
# Songpeng Zu
# 2016-02-18

# cp init-local.el and custom.el files based on Purcell config.
#cp ~/.emacs.d/lisp/init-local.el ./
#cp ~/.emacs.d/custom.el ./

# cp dotspacemacs based spacemacs config
cp ~/.spacemacs ./emacs/
cp ~/.emacs.d/.emacs-custom.el ./emacs/
# cp private configures.
cp -r ~/.emacs.d/private/ ./emacs/dotspacemacsPrivate/

# cp .bashrc and .bash_profile
cp ~/.bashrc ./env/
cp ~/.bash_profile ./env/

# cp gnus
cp ~/.gnus ./emacs/

# cp zshrc
cp ~/.zshrc  ./env/

# cp .pydistutils.cfg 
cp ~/.pydistutils.cfg ./env/
