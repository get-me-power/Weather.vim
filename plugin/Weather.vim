if exists('g:loaded_Weather')
  finish
endif
let g:loaded_Weather = 1

let s:save_cpo = &cpo
set cpo&vim

" command! Weather call Weather#Getdata() 
command! Weather call Weather#open()

let &cpo = s:save_cpo
unlet s:save_cpo
