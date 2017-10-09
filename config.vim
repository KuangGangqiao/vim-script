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
    \ "Sta": "summerfruit256",
    \ "Sun": "summerfruit256",
\ }

call GetTodayColor()
