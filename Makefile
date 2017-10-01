vimrc:
	cat $^ > $@
	cat config.vim >> $@

vimrc: default.vim
vimrc: edit-mode.vim
vimrc: daily-color.vim

install:
	cp vimrc ~/.vimrc

clean:
	rm vimrc
