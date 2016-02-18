#!/bin/bash
# Used to cp dotfiles to current dir.
# Songpeng Zu
# 2016-02-18

# cp init-local.el and custom.el files
cp ~/.emacs.d/lisp/init-local.el ./
cp ~/.emacs.d/custom.el ./

# cp .bashrc and .bash_profile
cp ~/.bashrc ./
cp ~/.bash_profile ./
