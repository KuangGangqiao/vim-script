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
    \ "Sun": "summerfruit256",
\ }

call GetTodayColor()

map \r :colo random-color<CR>
