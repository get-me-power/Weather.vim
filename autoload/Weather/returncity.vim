function! Weather#returncity#return(city)
    let funcname = printf(
                \ 'Weather#city#%s#id',
                \  a:city,
                \)
    let Fn = function(funcname)
    return Fn()
endfunction
