
# added by Anaconda2 2.4.1 installer
#export PATH="//anaconda/bin:$PATH"

# added by Anaconda2 2.4.1 installer
#export PATH="/Users/wangchao/home/songpeng/software/Anaconda/anaconda/bin:$PATH"
# added by szu, load tex binary path.
export PATH="/Library/TeX/texbin/:$PATH"

# added by szu, boost library.
# What is the different between local/lib and lcoal/Cellular/boost?
export PATH="/usr/local/lib:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/Cellar/boost/1.60.0_1/:$PATH"
export DYLD_LIBRARY_PATH=/usr/local/Cellar/boost/1.60.0_1/lib/:$DYLD_LIBRARY_PATH
export CLASSPATH=".;/Library/Java/Extensions/mysql-connector-java-5.1.40-bin.jar"
# added by szu, load .bashrc
[[ -s ~/.bashrc ]] && source ~/.bashrc

# added by szu
alias ls='ls -G'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias git='/usr/local/bin/git'

# added by szu, pythonpath.
export PYTHONPATH="/Library/Python/2.7/site-packages/"
