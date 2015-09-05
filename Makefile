
DATE=$(shell date +%Y%m%d%H%M%S)
BDIR=backups-${DATE}

backup:
	mkdir -p ${BDIR}
	cp -r ${HOME}/.vim* ${BDIR}/ 
	touch ${HOME}/.tmux.conf
	cp ${HOME}/.tmux.conf ${BDIR}/ 

install: backup
	cp tmux.conf ${HOME}/.tmux.conf
	cp vimrc ${HOME}/.vimrc
	mkdir -p ${HOME}/.vim
	cp -r vim/* ${HOME}/.vim/

