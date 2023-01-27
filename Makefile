help:
	@echo 'Usage:'
	@echo '    make install  Installs the .bashrc* files by copy to $HOME'
	@echo '    make load     Loads the modified .bashrc* files to $PWD'

install:
	cp -f ~/.bashrc* ~/.bash_profile ${HOME}
	cp -f ~/.emacs ${HOME}
save:
	cp -f ~/.bashrc* ~/.bash_profile .
	cp -f ~/.emacs .

