" ----------------------------------------------------------
" Edit Mode Change(Tab-8 or Space-4 or Space-2)
" ----------------------------------------------------------
let s:mode = {}
let s:mode["list"] = []
let s:mode["dict"] = {}
let s:mode["current"] = ""

function s:mode.add(name, func)
    call add(self.list, a:name)
    let self.dict[a:name] = function(a:func)
endfunction

function s:mode.set_mode(name)
    let F = get(self.dict, a:name, v:none)
    if type(F) != type(function("tr"))
        echo "Error edit mode input"
        return
    endif
    let self.current=a:name
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

call s:mode.set_mode("Tab") " Tab on default
function! EditWithAnother()
    if s:mode.current == "Tab"
        call s:mode.set_mode("Space")
    else
        call s:mode.set_mode("Tab")
    endif
    call s:mode.format()
endfunction

let s:space_list = [
    \'vim',
    \'yaml',
    \'scheme',
    \'python',
    \'markdown',
    \'gitcommit',
    \'matlab',
\]

let s:FiletypeConfig = {}
function s:FiletypeConfig.get_edit_mode(type) dict
    return get(self, a:type, "Tab")
endfunction

for key in s:space_list
    let s:FiletypeConfig[key] = "Space"
endfor

function! EditWithNextMode()
    call s:mode.next_mode()
    call s:mode.format()
endfunction

function! EditMode()
    echo "CurrentEditMode: " . s:mode.current
endfunction


function! EditWithFiletype()
    if s:mode.current != s:FiletypeConfig.get_edit_mode(&filetype)
        call EditWithAnother()
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
