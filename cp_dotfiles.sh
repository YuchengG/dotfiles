#!/bin/bash
# Used to cp dotfiles to current dir.
# Songpeng Zu
# 2016-02-18

# cp init-local.el and custom.el files based on Purcell config.
#cp ~/.emacs.d/lisp/init-local.el ./
#cp ~/.emacs.d/custom.el ./

# cp dotspacemacs based spacemacs config
cp ~/.spacemacs ./

# cp private configures.
cp -r ~/.emacs.d/private/ ./dotspacemacsPrivate/

# cp .bashrc and .bash_profile
cp ~/.bashrc ./
cp ~/.bash_profile ./

# cp gnus
cp ~/.gnus ./

# cp zshrc
cp ~/.zshrc  ./

# cp .pydistutils.cfg 
cp ~/.pydistutils.cfg ./

