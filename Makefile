code += default.vim
code += edit-mode.vim
code += daily-color.vim

config += config.vim

vimrc: $(code) $(config)
	cat $(code) > $@
	cat $(config) >> $@

install:
	cp vimrc ~/.vimrc

clean:
	rm vimrc
