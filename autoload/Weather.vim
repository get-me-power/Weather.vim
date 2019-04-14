function! Weather#Getdata()
    let city= input("where? ")
    "urlを名古屋に指定"
    if city == "名古屋"
        let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city=230010')
        let content = webapi#json#decode(res.content)
        echo "\n"
        echo '発表日: '.content['publicTime']
        echo "\n"
        echo content['title']
        for weather in content['forecasts']
            echo weather['dateLabel'] weather['telop']
        endfor
        echo "\n"
        echo content['description']['text']

    elseif city == "東京都"
        let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
        let content = webapi#json#decode(res.content)
        echo "\n"
        echo '発表日: '.content['publicTime']
        echo "\n"
        echo content['title']
        for weather in content['forecasts']
            echo weather['dateLabel'] weather['telop']
        endfor
        echo "\n"
        echo content['description']['text']

    else
        echo '\n'
        echo 'その場所の情報はありません'

    endif
endfunction
