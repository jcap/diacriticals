
DATE=$(shell date +%Y%m%d%H%M%S)
BDIR=backups-${DATE}
HOST=$(shell ./gen_hostid)

ifeq ($(wildcard tmux.conf.${HOST}),)
TMUXFILE=$(shell echo "tmux.conf")
else
TMUXFILE=$(shell echo "tmux.conf tmux.conf.${HOST}")
endif

all: backup install-vim install-tmux install-git install-zsh

backup:
	mkdir -p ${BDIR}
	cp -r ${HOME}/.vim* ${BDIR}/ 
	touch ${HOME}/.tmux.conf
	cp ${HOME}/.tmux.conf ${BDIR}/ 
	cp ${HOME}/.gitconfig ${BDIR}/ 

install-vim:
	cp vimrc ${HOME}/.vimrc
	rm -rf ${HOME}/.vim
	mkdir -p ${HOME}/.vim
	cp -r vim/* ${HOME}/.vim/

install-tmux:
	cat ${TMUXFILE} > ${HOME}/.tmux.conf

install-git:
	cat gitconfig gitconfig-local > ${HOME}/.gitconfig

install-zsh:
	mkdir -p ${HOME}/.oh-my-zsh/themes
	cp jcap.zsh-theme ${HOME}/.oh-my-zsh/themes/jcap.zsh-theme
