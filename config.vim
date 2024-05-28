" ----------------------------------------------------------
" Self Config
" ----------------------------------------------------------
call DefaultEditMode("Tab")

let s:space_list = [
    \'vim',
    \'yaml',
    \'scheme',
    \'python',
    \'markdown',
    \'gitcommit',
    \'matlab',
\]
call ConfigFiletype("Space", s:space_list)

let g:dailyColor = {
    \ "Mon": "asmanian",
    \ "Tue": "null",
    \ "Wed": "rainbow_neon",
    \ "Thu": "sea",
    \ "Fri": "pink",
    \ "Sta": "random-color",
    \ "Sun": "default",
\ }

call GetTodayColor()

map \r :colo random-color<CR>

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

