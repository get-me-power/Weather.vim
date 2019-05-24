if !exists('g:loaded_Weather')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! Weather#Getdata()
    let city= input("where? ")
    let id = Weather#returncity#return(city)
    " 都市が対応していない場合，idに0が入る
    if id != 0
        let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city='.id)
        call s:post(res)
    endif
endfunction

function s:post(res)
    let content = webapi#json#decode(a:res.content)
    echo "\n"
    echo '発表日: '.content['publicTime']
    echo "\n"
    echo content['title']
    for weather in content['forecasts']
        echo weather['dateLabel'] weather['telop']
    endfor
    echo "\n"
    echo content['description']['text']
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
