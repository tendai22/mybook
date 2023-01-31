# vivliostyle document template

vivliostyle の node_modules なしのテンプレート

本リポジトリを`git clone`した上に、
```
$ git clone https://github.com/tendai22/mybook.git -d targetdir
```

別の場所(例えば、`../mybook` )にvivliostyleをインストールしておき、
```
$ npm create book mybook
```
そこから
* `./node_modules`
* `./themes`
* `package.json`
をコピー
```
$ cd mybook
$ tar cf - ./node_modules |(cd ../targetdir; tar xvfp -)
$ tar cf - ./themes |(cd ../targetdir; tar xvfp -)
$ tar cf - ./package.json |(cd ../targetdir; tar xvfp -)
```


## References

- VFM <https://vivliostyle.github.io/vfm/#/vfm>
- Vivliostyle CLI <https://github.com/vivliostyle/vivliostyle-cli#readme>
- Vivliostyle Themes <https://github.com/vivliostyle/themes#readme>
- Awesome Vivliostyle <https://github.com/vivliostyle/awesome-vivliostyle#readme>
- Vivliostyle (GitHub) <https://github.com/vivliostyle>
- Vivliostyle <https://vivliostyle.org>
