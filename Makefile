help:
	@echo 'Usage:'
	@echo '    make install  Installs the .bashrc* files by copy to $HOME'
	@echo '    make load     Loads the modified .bashrc* files to $PWD'

install:
	cp ./.bashrc* .emacs ${HOME}

load:
	cp -f ${HOME}/.bashrc* ${HOME}/.emacs .

