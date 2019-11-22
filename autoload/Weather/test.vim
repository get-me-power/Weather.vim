scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! Weather#test#run()
  let v:errors = []
  call Weather#test#test_status#run()
  if len(v:errors) >= 1
    echo v:errors
    " error exit
    execute 'cq!'
  endif
echo 'test success'
execute 'qall!'
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
