
DATE=$(shell date +%Y%m%d%H%M%S)
BDIR=backups-${DATE}
HOST=$(shell hostname -s)

ifeq ($(wildcard tmux.conf.${HOST}),)
TMUXFILE="tmux.conf"
else
TMUXFILE="tmux.conf.${HOST}"
endif

backup:
	mkdir -p ${BDIR}
	cp -R ${HOME}/.vim* ${BDIR}/ 
	touch ${HOME}/.tmux.conf
	cp ${HOME}/.tmux.conf ${BDIR}/ 
	cp ${HOME}/.gitconfig ${BDIR}/ 

install: backup
	cp ${TMUXFILE} ${HOME}/.tmux.conf
	cp vimrc ${HOME}/.vimrc
	rm -rf ${HOME}/.vim
	mkdir -p ${HOME}/.vim
	cp -R vim/* ${HOME}/.vim/
	cp gitconfig ${HOME}/.gitconfig

