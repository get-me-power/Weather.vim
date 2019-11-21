scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! Weather#test#run()
  let v:errors = []
  try
    call s:test_case()
  catch
    if len(v:errors) >= 1
      echo v:errors
      " error exit
      execute 'cq!'
    endif
  endtry
  echo 'test success'
  execute 'qall!'
endfunction


function! s:test_case() abort
  let l:id = Weather#returncity#return('Tokyo')
  let l:res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city='.id)
  call assert_equal(webapi#json#decode(l:res.status), 200, 'test fail!')
  echo v:errors
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
