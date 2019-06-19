# Weather.vim

コマンド一つで今日の天気を知ることができるプラグインです．

# Requirement

Vim 8.1.1391以上

**Neovim非対応**

**注意**: weather-vimには別プラグインである
[webapi-vim](https://github.com/mattn/webapi-vim)が必要です．

インストールされていない場合は以下を参照してください．

> https://github.com/mattn/webapi-vim

---

# Install

## dein.vimを使っている場合

```
call dein#add('kazukazuinaina/Weather.vim')
```

## vim-plugを使っている場合

```
 Plug 'kazukazuinaina/Weather.vim'
```

# 使い方

```
:Weather
```
でお天気を教えてくれます．

# 対応都市

- **北海道**
- **仙台**
- **東京**
- **名古屋**
- **京都**
- **大阪**
- **広島**
- **福岡**

# スクリーンショット

![例](./Weather.gif)

# 使用したapi
http://weather.livedoor.com/weather_hacks/webservice

# Todo

- [ ] Neovimに対応させる
- [ ] Vimの旧バージョンに対応させる
- [ ] 都市を増やす
