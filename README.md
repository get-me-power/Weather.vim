# weather-vim

コマンド一つで今日の天気を知ることができるプラグインです．

# Install

**注意**: weather-vimには別プラグインである
[webapi-vim](https://github.com/mattn/webapi-vim)が必要です．

インストールされていない場合は以下を参照してください．

> https://github.com/mattn/webapi-vim

---

### dein.vimを使っている場合

```
call dein#add('kazukazuinaina/weather-vim')
```

### vim-plugを使っている場合

```
 Plug 'kazukazuinaina/weather-vim'
```

# 使い方

normalモードで

```
:Weather
```
でお天気を教えてくれます．

# スクリーンショット

![例](./weather-vim.png)

# 使用したapi
http://weather.livedoor.com/weather_hacks/webservice

