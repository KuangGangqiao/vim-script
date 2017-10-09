" ----------------------------------------------------------
" Edit Mode Change(Tab-8 or Space-4 or Space-2)
" ----------------------------------------------------------
let s:mode = {}
let s:mode["list"] = []
let s:mode["dict"] = {}
let s:mode["current"] = ""
let s:mode["default"] = ""

function s:mode.add(name, func)
    call add(self.list, a:name)
    let self.dict[a:name] = function(a:func)
endfunction

function s:mode.set_mode(name)
    let F = get(self.dict, a:name, v:none)
    if type(F) != type(function("tr"))
        echo "Error edit mode input"
        return v:false
    endif
    let self.current=a:name
    return v:true
endfunction

function s:mode.next_mode()
    if empty(self.list)
        return v:none
    endif
    let cur = self.current
    let size = len(self.list)
    let next_idx = index(self.list, cur) + 1
    if size == next_idx
        let next_idx = 0
    endif
    let self.current = self.list[next_idx]
endfunction

function s:mode.format()
    call self.dict[self.current]()
endfunction

function! s:Indent(size)
    execute "set ts=" . a:size
    execute "set st=" . a:size
    execute "set shiftwidth=" . a:size
    execute "set softtabstop=" . a:size
endfunction

function s:EditWithTab()
    call s:Indent(8)
    set noexpandtab
endfunction
call s:mode.add("Tab", "s:EditWithTab")

function s:EditWithSpace()
    call s:Indent(4)
    set expandtab
endfunction
call s:mode.add("Space", "s:EditWithSpace")

function s:EditWithSpace2()
    call s:Indent(2)
    set expandtab
endfunction
call s:mode.add("Space2", "s:EditWithSpace2")

function! EditWithAnother()
    if s:mode.current == "Tab"
        call s:mode.set_mode("Space")
    else
        call s:mode.set_mode("Tab")
    endif
    call s:mode.format()
endfunction

function! EditWithNextMode()
    call s:mode.next_mode()
    call s:mode.format()
endfunction

function! EditMode()
    echo "CurrentEditMode: " . s:mode.current
endfunction

let s:FiletypeConfig = {}
let s:FiletypeConfig.default = ""
function s:FiletypeConfig.get_edit_mode(type) dict
    return get(self, a:type, self.default)
endfunction

function! EditWithFiletype()
    call s:mode.set_mode(s:FiletypeConfig.get_edit_mode(&filetype))
    call s:mode.format()
endfunction

function! ConfigFiletype(mode, list)
    for key in a:list
        let s:FiletypeConfig[key] = a:mode
    endfor
endfunction

function! DefaultEditMode(mode)
    if s:mode.set_mode(a:mode)
        let s:mode.default = a:mode
        let s:FiletypeConfig.default = s:mode.default
    endif
endfunction

" --------------------------------------
set autoindent
set smartindent
" auto detection & key map
auto BufNew,BufNewFile,BufRead * call EditWithFiletype()

map \\ :call EditWithAnother()<CR>:call EditMode()<CR>
map \n :call EditWithNextMode()<CR>:call EditMode()<CR>
map \? :call EditMode()<CR>
