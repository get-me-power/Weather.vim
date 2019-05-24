function! Weather#returncity#return(city)
    let funcname = printf(
                \ 'Weather#city#%s#id',
                \  a:city,
                \)
    try
        let Fn = function(funcname)
        return Fn()
    catch /^Vim\%((\a\+)\)\=:E117:/
        echo "\n"
        echomsg 'その都市の情報はありません'
    endtry
endfunction
