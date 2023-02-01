# vivliostyle document template

vivliostyle の node_modules なしのテンプレートです。  
以下の「vivliostyleビルド可能環境を作る」に従って Markdown編集git projectをvivliostyle化してください。

本テンプレートは
* 自前スタイルファイル(`./mytheme`)

## vivliostyle ビルド可能環境を作る

> すでに Markdownファイルを作成し、git管理下に置いていることを想定しています(以下の例では`markdown`という名前としています)。

本リポジトリを`git clone`して、そこから、既存プロジェクトに`vivlistyle.config.js`ファイルと`mytheme`フォルダ直下をコピーする
```
$ git clone https://github.com/tendai22/mybook.git
$ mv mybook template
$ cd template
$ tar cf - ./vivliostyle.config.js |(cd ../markdown| tar xvfp -)
$ tar cf - ./mytheme |(cd ../markdown| tar xvfp -)
```
npm create bookしておき、そこから`./node_modules`, `package.json` を既存プロジェクトにコピーする。
```
$ npm create book mybook
$ cd mybook
$ tar cf - ./node_modules |(cd ../targetdir; tar xvfp -)
$ tar cf - ./package.json |(cd ../targetdir; tar xvfp -)
```
既存プロジェクトで、以下のファイル・フォルダを`git add`する。
```
$ cd ../markdown
$ git add vivliostyle.config.js mytheme/
$ git add node_modules/ package.json
$ git commit -m 'Add vivlistyle files/folders.'
```

結局、既存プロジェクトに
* vivliostyle.config.js, 
* mytheme/, 
* package.json, 
* node_modules/,

をコピーすることになる。これで、`npm run build`でPDFファイルがビルドできるようになっているはず。

## mythemeの作成

* themesの下に、theme-techbookをコピーして、mythemeにリネーム
```
$ cd themes/packages/@vivliostyle/
$ tar cf - ./theme-teckbook |(cd ../..; tar xvfp -)
$ cd ../..
$ mv theme-techbook mytheme
```
* theme/mythemeをvivliostyle.config.jsに登録
```
  theme: 'themes/mytheme',
```
* スタイルファイルの更新は、themes/mytheme/scssの下のtheme_common.scssを編集する。
* 編集後、npm run watch:scssする
```
$ cd themes/mytheme
$ npm run watch:scss
```

# vivliostyle のインストール

> install-lib.shを参照ください。

### nvm のインストール(初回のみ)
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh |bash
```

### nodejsのインストール(初回のみ)

nodejs ver14以上が必要。Ubuntuについてくるnodejsはv10なので、apt-getで入れずにnvmで入れる。

```
$ nvm list-remote (これで利用できるバージョンを調べる)
$ nvm install v18.13.0
```

### vivliostyleのインストール(初回のみ)

```
npm create book mybook
# npmをバージョンアップする旨アドバイスされるのでそれに従う
npm install -g npm@9.4.0
# シェルコマンドラインから`vivliostyle`コマンドを使えるようにする。
npm install -g @vivliostyle/cli
```
レンダリングエンジン(browser)に必要なライブラリを手で追加する。

```
# installing additional libraries for vivliostyle
sudo apt-get install -y libatk1.0-0 libatk-bridge2.0-0 libcups2
sudo apt-get install -y libxdamage-dev libgpm-dev libgbm-dev
sudo apt-get install -y libxkbcommon-dev libpango-1.0 libcairo-dev
```
### 日本語フォントのインストール(初回のみ)

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

以後は、書籍を新たに起こすときに`npm run build mybook`を行うだけでよい。

## References

- VFM <https://vivliostyle.github.io/vfm/#/vfm>
- Vivliostyle CLI <https://github.com/vivliostyle/vivliostyle-cli#readme>
- Vivliostyle Themes <https://github.com/vivliostyle/themes#readme>
- Awesome Vivliostyle <https://github.com/vivliostyle/awesome-vivliostyle#readme>
- Vivliostyle (GitHub) <https://github.com/vivliostyle>
- Vivliostyle <https://vivliostyle.org>
