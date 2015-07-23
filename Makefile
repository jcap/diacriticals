
DATE=$(shell date +%Y%m%d%H%M%S)

backup:
	mkdir -p .dotbackups-${DATE}
	cp -r ${HOME}/.vim* .dotbackups-${DATE}/
	cp ${HOME}/.tmux.conf .dotbackups-${DATE}/

install: backup
	cp tmux.conf ${HOME}/.tmux.conf
	cp vimrc ${HOME}/.vimrc
	mkdir -p ${HOME}/.vim
	cp -r vim/* ${HOME}/.vim/

