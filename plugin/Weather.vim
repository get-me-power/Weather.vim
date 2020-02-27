if exists('g:loaded_Weather')
  finish
elseif v:version < 800
  echoerr "This plugin don't run under Vim8."
  finish
endif
let g:loaded_Weather = 1

let s:save_cpo = &cpo
set cpo&vim

" command! Weather call Weather#Getdata() 
command! Weather call Weather#open()

let &cpo = s:save_cpo
unlet s:save_cpo
