function! Weather#Getdata()
    let city= input("where? ")
    "urlを名古屋に指定"
    if city == "名古屋"
        let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city=230010')
        call s:post(res)

    elseif city == "札幌"
        let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city=016010')
        call s:post(res)

    elseif city == "仙台"
        let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city=040010')
        call s:post(res)

    elseif city == "東京都" || "東京"
        let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
        call s:post(res)

    elseif city == "大阪"
        let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city=270000')
        call s:post(res)

    elseif city == "福岡"
        let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1?city=400010')
        call s:post(res)
    else
        echo '\n'
        echo 'その場所の情報はありません'
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
