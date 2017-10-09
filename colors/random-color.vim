set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "random"

function! s:GetRandom()
    return and(str2nr(system("echo ${RANDOM}")), 0xff)
endfunction

function! GetRandomColor()
    let s:targetList = [
        \ "Normal",
        \ "LineNr", "CurosrLinNr",
        \ "Function", "Type", "Operator", "String", "Number", "Define",
        \ "Comment", "Label"
        \ ]
    for target in s:targetList
        execute "hi " . target . " ctermfg=" . s:GetRandom()
    endfor
endfunction
hi link Typedef Define
hi link Structure Type
hi link Union   Structure
hi link Character String
hi link Constant String
hi link Boolean String
hi link Float Number
hi link Boolean Number

hi link NonText Normal

call GetRandomColor()
