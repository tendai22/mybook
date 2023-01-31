# vivliostyle document template

vivliostyle の node_modules なしのテンプレート

# vivliostyle ビルド可能環境を作る

本リポジトリを`git clone`した上に、
```
$ git clone https://github.com/tendai22/mybook.git
$ mv mybook targetdir
```

別の場所(例えば、`mybook`)にvivliostyleをインストールしておき、
```
$ npm create book mybook
```
そこから
* `./node_modules`
* `./themes`
* `package.json`  

を`targetdir`にコピー
```
$ cd mybook
$ tar cf - ./node_modules |(cd ../targetdir; tar xvfp -)
$ tar cf - ./themes |(cd ../targetdir; tar xvfp -)
$ tar cf - ./package.json |(cd ../targetdir; tar xvfp -)
```

# vivliostyle のインストール

> install-lib.shを参照ください。

### nvm のインストール
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh |bash
```

### nodejsのインストール

nodejs ver14以上が必要。Ubuntuについてくるnodejsはv10なので、apt-getで入れずにnvmで入れる。

```
$ nvm list-remote (これで利用できるバージョンを調べる)
$ nvm install v18.13.0
```

### vivliostyleのインストール

```
npm create book mybook
npm install -g npm@9.4.0
npm install -g @vivliostyle/cli
```
レンダリングエンジン(browser)に必要なライブラリを手で追加する。

```
# installing additional libraries for vivliostyle
sudo apt-get install -y libatk1.0-0 libatk-bridge2.0-0 libcups2
sudo apt-get install -y libxdamage-dev libgpm-dev libgbm-dev
sudo apt-get install -y libxkbcommon-dev libpango-1.0 libcairo-dev
```
### 日本語フォントのインストール

* いくつかあるらしい(https://qiita.com/nanbuwks/items/611bf7392c3b8f0dd4ea)
> fonts-noto-cjk  
fonts-mplus  
fonts-ipafont-gothic fonts-ipafont-mincho  
fonts-ipaexfont-gothic fonts-ipaexfont-mincho  
fonts-vlgothic  
ttf-kochi-gothic ttf-kochi-mincho  
ttf-sazanami-gothic ttf-sazanami-mincho  

とりあえず IPAfontをインストールした
```
$ sudo apt-get install -y fonts-ipafont-gothic fonts-ipafont-mincho
```



## References

- VFM <https://vivliostyle.github.io/vfm/#/vfm>
- Vivliostyle CLI <https://github.com/vivliostyle/vivliostyle-cli#readme>
- Vivliostyle Themes <https://github.com/vivliostyle/themes#readme>
- Awesome Vivliostyle <https://github.com/vivliostyle/awesome-vivliostyle#readme>
- Vivliostyle (GitHub) <https://github.com/vivliostyle>
- Vivliostyle <https://vivliostyle.org>
