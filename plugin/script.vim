function! Getdata()
    "urlを名古屋に指定"
    let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city=230010')
    let content = webapi#json#decode(res.content)
    echo content['title']
    for weather in content['forecasts']
        echo weather['dateLabel'] weather['telop']
    endfor
endfunction

command! Weather call Getdata() 
