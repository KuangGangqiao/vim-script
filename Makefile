vimrc:
	cat $^ > $@
	cat config.vim >> $@

vimrc: default.vim
vimrc: edit-mode.vim
vimrc: daily-color.vim

clean:
	rm vimrc
