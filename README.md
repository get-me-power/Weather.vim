# Weather.vim [![CircleCI](https://circleci.com/gh/kazukazuinaina/Weather.vim/tree/master.svg?style=svg)](https://circleci.com/gh/kazukazuinaina/Weather.vim/tree/master)

A plug-in that lets you know the weather in Japan with a single command.

# Requirement

[webapi-vim](https://github.com/mattn/webapi-vim)

If it is not installed, see below.

> https://github.com/mattn/webapi-vim

---

# Install

## Use dein.vim

```viml
call dein#add('mattn/webapi-vim')
call dein#add('kazukazuinaina/Weather.vim')
```

## Use vim-plug

```viml
Plug 'mattn/webapi-vim'
Plug 'kazukazuinaina/Weather.vim'
```

# Usage

Simply run `:Weather` command

# Applicable cities

- **Hokkaido**
- **Sendai**
- **Tokyo**
- **Nagoya**
- **Shiga**
- **Kyoto**
- **Osaka**
- **Hiroshima**
- **Hukuoka**

More cities will be added later

# screenshot

![example](./Weather.gif)

# Used Web Api

> http://weather.livedoor.com/weather_hacks/webservice

# Pull Request

I hope to get your Pull Request! Please fork this project!

# Todo

- [x] Add more city in japan
- [ ] Adopt global city
- [ ] Add test
