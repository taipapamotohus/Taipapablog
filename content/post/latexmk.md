+++
title = "texファイルが変更されると，自動的にcompileしてskimでのpdfも自動で更新されるようにする．"
author = ["taipapa"]
date = 2018-08-19
lastmod = 2018-08-19T21:32:46+09:00
tags = ["emac", "latex", "skim", "pdf", "beamer"]
type = "post"
draft = false
weight = 1
[header]
  image = "headers/琵琶湖.jpg"
  caption = "琵琶湖"
+++

Emacsでbeamerを使って，スライド原稿などを作成していると，C-c C-cするたびにtex文書がcompileされてpdf原稿が出来上がるのを待たなければならず，この待ち時間が結構辛い．そこで，tex ファイルの変更が保存されるたびに自動で裏でlatexmkがcompileしてくれるようにする．latexmkを使う．


## latexmk {#latexmk}

-   参考サイト：[TeX Wiki Latexmk](https://texwiki.texjp.org/?Latexmk)
-   texlive2018, MacTeXに入っているので，これらを入れていれば別途インストールする必要なし．
-   ~/.latexmkrcの中に以下のように記述する

    ```lisp
    $pdflatex = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';
    $pdf_mode = 1;
    $postscript_mode = $dvi_mode = 0;
    $pdf_previewer  = 'open -a Skim';
    $preview_continuous_mode = 1;  # equivalent to -pvc
    ```


## 実際の作業 {#実際の作業}

-   上記のようにセットアップしていることとする．
-   ターミナルで，texファイルが有るdirectoryに移動し，

    ```shell
    latexmk -pvc -pdf -view=none document.tex
    ```
-   これで，texファイルへの変更を保存すると自動でコンパイルされて，設定にもよるが，skimで開いているpdfファイルも更新される．
