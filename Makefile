vimrc:
	cat $^ > $@

vimrc: default.vim
vimrc: edit-mode.vim

clean:
	rm vimrc
