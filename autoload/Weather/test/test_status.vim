scriptencoding utf-8
let s:dir = expand('<sfile>:h:h') . '/city'
let s:city_data = map(glob(expand(s:dir) . '/*.vim', 1, 1), 'fnamemodify(v:val, ":t:r")')

" vital.vim 's init
let s:H = vital#Weather#import('Web.HTTP')

function! Weather#test#test_status#run()
  for i in s:city_data
    let l:id = Weather#returncity#return(i)
    let l:res = s:H.get('http://weather.livedoor.com/forecast/webservice/json/v1?city='.id)
    call assert_equal(200, str2nr(l:res.status, 10))
    echomsg i . " status " . l:res.status . "\n"
  endfor
endfunction
