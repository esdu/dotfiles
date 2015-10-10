DIRECTORY=~/dotfiles

install:
	ln -fs $(DIRECTORY)/vim ~/.vim
	ln -fs $(DIRECTORY)/vimrc ~/.vimrc
	ln -fs $(DIRECTORY)/screenrc ~/.screenrc
	ln -fs $(DIRECTORY)/gitconfig ~/.gitconfig
	ln -fs $(DIRECTORY)/pylintrc ~/.pylintrc

.PHONY: install
