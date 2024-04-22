help:
	@echo 'Usage:'
	@echo '    make install - Installs the config files by copy to ${HOME}'
	@echo '    make save - Loads the modified config files to ${PWD}'

install:
	cp -f ./.bashrc* ./.bash_profile ./.emacs ./.tmux.conf ./.psqlrc ${HOME}
	cp -fR ./.emacs.d ${HOME}

save:
	cp -f ~/.bashrc* ~/.bash_profile ~/.emacs ~/.tmux.conf ~/.psqlrc .
	cp -fR ~/.emacs.d .

.PHONY: help install save 
