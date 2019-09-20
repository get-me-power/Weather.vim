function! Weather#returncity#return(city)
  let funcname = printf(
        \ 'Weather#city#%s#id',
        \  a:city,
        \)
  try
    let Fn = function(funcname)
    return Fn()
    " 都市が対応していない場合の例外処理
  catch /^Vim\%((\a\+)\)\=:E117:/
    echo "\n"
    echomsg 'その都市の情報はありません'
  endtry
endfunction
