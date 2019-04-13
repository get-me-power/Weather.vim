function! Weather#Getdata()
    "urlを名古屋に指定"
    if input("どこの情報を知りたいんだい: ") == "名古屋"
        let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city=230010')
        let content = webapi#json#decode(res.content)
        echo '発表日: '.content['publicTime']
        echo "\n"
        echo content['title']
        for weather in content['forecasts']
            echo weather['dateLabel'] weather['telop']
        endfor
        echo "\n"
        echo content['description']['text']
    endif
endfunction
