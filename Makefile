vimrc:
	cat $^ > $@

vimrc: default.vim
vimrc: edit-mode.vim
vimrc: daily-color.vim

# Append config in the end
vimrc: config.vim

install:
	cp vimrc ~/.vimrc

clean:
	rm vimrc
