+++
title = "beamerでスライド原稿用pdfを作成する（その2）動画が走るスライド原稿を作る"
author = ["taipapa"]
date = 2018-08-25
lastmod = 2018-08-25T16:40:47+09:00
tags = ["beamer", "movie", "latex", "pdf"]
type = "post"
draft = false
weight = 1
[header]
  image = "headers/Kojidai2.jpg"
  caption = "Kojidai"
+++

実は，同じような内容について2010年に，[TeX QA](https://oku.edu.mie-u.ac.jp/tex/mod/forum/discuss.php?d=399#p2100) に投稿しているが，その後現在に至るまで使い続けることができており，一応，こちらでもまとめておくことにした．


## beamerで動画が走るスライド原稿を作る {#beamerで動画が走るスライド原稿を作る}

-   前述した ，[TeX QA](https://oku.edu.mie-u.ac.jp/tex/mod/forum/discuss.php?d=399#p2100) に経緯は投稿してあるので，詳細はそちらを読んでいただきたい．
-   読んでいただければおわかりのように，非常にダサいベタ書きである．
-   最近の書き方は以下の通りで，もっぱら，mov形式の画像を使用している．コンテナがaviやwmvだと動かないが，Mac以外でどうなるのかは不明．そういえば，Windowsで試したことはなかった.....

    ```shell
    {
        \usebackgroundtemplate{\put(20, -265){\includegraphics[scale=0.45]{/Data/.../..../Figures/hogefuga.pdf}}}
        \begin{frame}
        \frametitle{hogefugaの対策}
        \special{pdf:ann bbox -10 -130 320 90 <<
                 /Subtype /Movie /Border [0 0 1]
                 /T (My Movie) /Movie <<
                 /F (/Data/.../hogefuga.mov)
                 %/Aspect [720 480]
                 /Aspect [640 480]
                 /Poster false >>
                 /A << /ShowControls true /Mode /Repeat >> >>}
        \end{frame}
    }
    ```
-   \usebackgroundtemplateの部分には動画のキャプチャー画像を貼り付けておく．なにもないと，動画が動き出す前の画面が空白になってしまう．
-   プレゼンテーションにskimを使うと動画が動かないので注意．
-   Adobe Acrobat Readerでプレゼンすれば，動画は動くし，音もでる．早送りなども可能．
