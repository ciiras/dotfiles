exec([[
augroup ObsessionGroup
  au!
  au VimEnter * nested if !&modified && empty(v:this_session) | Obsession | echo '' | endif
augroup END
]], false)
