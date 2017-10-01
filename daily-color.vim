" ----------------------------------------------------------
" GetDailyColor
" Config with g:dailyColor(dict),
" keys(Mon, Tue, Wed, Thu, Fri. Sta, Sun)
" values(colors, detail in :help colo)
" ----------------------------------------------------------
function s:GetWeek()
    let s:weeknames = [
        \ "Sun",
        \ "Mon",
        \ "Tue",
        \ "Wed",
        \ "Thu",
        \ "Fri",
        \ "Sta",
        \ "Sun"
    \ ]
    let dayOfWeek = str2nr(system("date +%u"))
    return s:weeknames[dayOfWeek]
endfunction

let g:dailyColor = { }

function GetTodayColor()
    let s:today = s:GetWeek()
    " let s:today = "Mon"
    let s:todayScheme = get(g:dailyColor, s:today, v:none)
    if type(v:none) == type(s:todayScheme)
        return
    else
        execute "colo " . s:todayScheme
    endif
endfunction
