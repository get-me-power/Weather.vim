function! Weather#Getdata()
    let city= input("where? ")
    let id = Weather#returncity#return(city)
    let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city='.id)
    call s:post(res)
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
