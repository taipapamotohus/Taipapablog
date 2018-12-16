+++
title = "Emacsのorg-modeで論文を書く（その5：htmlへのexportの際のフォントの色の変更，ハイライトなど）"
author = ["taipapa"]
date = 2018-12-10
lastmod = 2018-12-16T19:43:34+09:00
tags = ["emacs", "orgmode", "html", "export", "css", "color"]
type = "post"
draft = false
weight = 1
[header]
  image = "headers/Parthenon.jpg"
  caption = "Parthenon"
+++

学会発表や論文作成にあたっては，当然のことながら，その分野の他の研究者の論文を読んでまとめるなどの作業を行う．そこで，論文の要旨などをorg-modeにざっとまとめておくと，pdfにもhtmlにもtextにもexport出来て便利である．pdfは印刷に向いているが，htmlは多くの論文をいっぺんに見るのに向いており，また，compileの時間もpdfより圧倒的に速い．また，色を変えたり，ハイライトしたりするのもhtmlなら容易である．そこで，今回は，org-modeからhtmlへexportする際の有用な小技について書いてみたい．


## [Org Macros](https://github.com/fniessen/org-macros) {#org-macros}

フォントの色を変更する方法はいろいろあるが，ハイライトや背景の色の変更までできるこの [Org Macros](https://github.com/fniessen/org-macros)が一番便利である．内容は，org-modeの便利なマクロ集である．リンク先からダウンロードして，適当なところに保存し，解凍しておく．ここでは，/Users/taipapa/hoge/fuga/org-macros.setupに置くことにする．使い方は簡単で上記のwebsiteに書いてあるとおり，各org fileの先頭に以下のように記述してorg-macros.setupの場所を教えてやれば良い．

```lisp
#+INCLUDE: /Users/taipapa/hoge/fuga/org-macros.setup
```

これだけである．

-   注意事項としては，このブログはox-hugoで書いているが，ox-hugoの場合は文書の先頭に上記を書いても効かない．各ポストのpropertyのあとに書いておけば効く．各ポストごとに設定するようになっているらしい．．．．．（全国15人？ぐらいの人にしか意味のない注意書きである）
-   残念ながら，LaTeXへのexportでは，この方法による色の変更などは（現在のところ）効かない．

いくつか使い方の例をあげておく

```lisp
{{{color(blue, 青くなるかな？)}}}
*{{{color(blue, ボールドで青くなるかな？)}}}*
{{{highlight(yellow, 黄色にハイライトされるかな？)}}}
*{{{highlight(yellow, 黄色にハイライトされて文字はボールドになるかな？)}}}*
{{{bgcolor(cyan, 背景がシアンになるかな？)}}}
*{{{bgcolor(cyan, 背景がシアンになって文字はボールドになるかな？)}}}*
```

これが以下のように表示される．

-   <span style="color: blue"> 青くなるかな？</span>
-   **<span style="color: blue"> ボールドで青くなるかな？</span>**
-   <span style="background-color: yellow;"> 黄色にハイライトされるかな？</span>
-   **<span style="background-color: yellow;"> 黄色にハイライトされて文字はボールドになるかな？</span>**
-   <div style="background-color: cyan;"> 背景がシアンになるかな？</div>
-   **<div style="background-color: cyan;"> 背景がシアンになって文字はボールドになるかな？</div>**

上記以外にも多くのマクロが含まれており，そちらも人によっては有用かもしれない．少しだけ例をあげておく．以下はパネルの例．

```lisp
{{{begin_panel}}} Panel example This is a formatted block of text… {{{end_panel}}}
```

これが，
<div class="panel"><p> Panel example This is a formatted block of text… </p></div>
  となる．マニュアルでは以下の使い方を薦めている．

```lisp
#+begin_panel
*Panel example* \\
This is a formatted block of text...
#+end_panel
```

<div class="panel">
  <div></div>

**Panel example** <br />
 This is a formatted block of text...

</div>

なお，org-modeのマクロ自体に関しては，org-modeのマニュアルの **12.5 Macro replacement** を参考にしていただきたい．


## [Exporting org-mode to HTML: In-place coloring](https://stackoverflow.com/questions/21340380/exporting-org-mode-to-html-in-place-coloring) {#exporting-org-mode-to-html-in-place-coloring}

フォントの色を変える別の方法である．リンク先にある通り，

```html
     この文章は， *@@html:<font color = "blue">@@青のボールド@@html:</font>@@*になって欲しい！
```

これが以下のように表示される．<br />
この文章は， **<font color = "blue">青のボールド</font>** になって欲しい！

-   org-modeのマニュアルの **12.9.5 Quoting HTML tags** も参考のこと

こちらは設定を必要としないが，やはり，最初に説明したマクロの方がいろいろ出来て便利である．

次回は，htmlをexportする際のCSSについてまとめてみたい．
