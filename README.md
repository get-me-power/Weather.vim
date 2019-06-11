# weather-vim

コマンド一つで今日の天気を知ることができるプラグインです．

#usage

Vim 8.1.1391以上

**Neovim非対応**

**注意**: weather-vimには別プラグインである
[webapi-vim](https://github.com/mattn/webapi-vim)が必要です．

インストールされていない場合は以下を参照してください．

> https://github.com/mattn/webapi-vim

---

# install

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

# 対応都市
|北海道|東北地方|関東地方|中部地方|近畿地方|中国地方|四国地方|九州・沖縄地方|
|------|--------|--------|--------|--------|--------|--------|--------------|
|札幌|仙台|東京|名古屋|滋賀|広島|hoge|那覇|
|fuga|fuga|ffaa|aaaa|大阪|
|hoge|fuga|ffaa|aaaa|京都|

# スクリーンショット

![例](./weather-vim.png)

# 使用したapi
http://weather.livedoor.com/weather_hacks/webservice

# Todo

- Neovimに対応させる

