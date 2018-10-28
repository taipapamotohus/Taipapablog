+++
title = "RをMac OSX (Sierra)にbrewでinstallしていて，upgradeしてハマったときの対処法"
author = ["taipapa"]
date = 2018-10-27
lastmod = 2018-10-28T16:56:08+09:00
tags = ["R", "Rstudio", "homebrew", "install", "update", "error"]
type = "post"
draft = false
weight = 1
[header]
  image = "headers/GrandPlace.jpg"
  caption = "Grand Place"
+++

[R](https://www.r-project.org)とは，オープンソース・フリーソフトウェアの統計解析向けのプログラミング言語及びその開発実行環境である（Wikipediaより）．org-modeと同じくらい必要不可欠なRではあるが，定期的にupdateする必要がある．いや，まぁ，したほうが良い，というか，しないと新しいパッケージが試せなかったりするので，しないではいられない．しかし，updateすると，たいていどこかでハマる．そこで，今回は，ハマったときの対処法を自分のためにまとめておくことにする．ハマるのはbioconductorの方が多いような気がする．ちなみに当方の環境は，MacBook Pro (15-inch, Late 2016) macOS Sierra 10.12.6である．先日もRを3.5.1にupdateしてハマったばかりである.....(^^;;;


## gccのリンク絡みのトラブル {#gccのリンク絡みのトラブル}

-   大体は以下で直ることが多い（[r has dependency on gcc@6, but only lists gcc (which has updated to 7) #5587](https://github.com/Homebrew/homebrew-science/issues/5587)）

    ```shell
    $ brew link --overwrite gcc
    ```


## XMLが入らない {#xmlが入らない}

-   XMLを入れるのが目的ではなく，なにか別のパッケージをインストールしようとして，それがXMLに依存しており，XMLを入れようとしてハマることが多いと思う．エラーメッセージは，configure: error: “libxml not found”である．しかし，homebrewで，brew listしてみると，libxml2はインストールされている．このあたりは，[Installing R package XML on MacOS 10.13.6](https://medium.com/biosyntax/installing-r-package-xml-on-macos-10-13-6-1738146d4ee0)と同じである．対処法は，同サイトや引用元の[Cannot install XML package in r](https://stackoverflow.com/questions/40682615/cannot-install-xml-package-in-r)にある通り，以下のようにコンパイラーに正しいxml2-configの場所を教えてやれば良い．

    ```shell
    Sys.setenv(XML_CONFIG = "/usr/local/Cellar/libxml2/2.9.7/bin/xml2-config")
    ```

    なお，上記を入力するのはRのコンソールである．通常のterminalにexportで入力しても効かないので注意すること！（これでどれだけ時間を無駄にしたことか．．．(ToT)）


## Cairoなどのインストール時に，#include &lt;X11/Xlib.h&gt; でハマる． {#cairoなどのインストール時に-include-and-lt-x11-xlib-dot-h-and-gt-でハマる}

-   'X11/Xlib.h' file not found, #include &lt;X11/Xlib.h&gt; のようなエラーが出てコンパイルできないことがある（例えば，"Cairo" packageなど）．要するにXlib.hの在り処が分からんということである．mdfind（Mac版のlocate）で探してみると，以下のような結果が得られる．

    ```shell
    $ mdfind -name Xlib.h | grep X11
    /opt/X11/include/cairo/cairo-xlib.h
    /opt/X11/include/X11/Xlib.h
    /System/Library/Frameworks/Tk.framework/Versions/8.4/Headers/X11/Xlib.h
    /System/Library/Frameworks/Tk.framework/Versions/8.5/Headers/X11/Xlib.h
    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers/X11/Xlib.h
    ```

    そこで，目的のXlib.hは，/opt/X11/include/X11/Xlib.hと分かるので，include directoryにこれを含めるように指示すれば良い．これも，前項と同じく，Rのコンソールに入力すること！（これでどれだけ．．．以下同文）

    ```shell
    Sys.setenv(C_INCLUDE_PATH = "/opt/X11/include")
    ```

    これで，コンパイルできるようになるはずである．
-   どこにX11/Xlib.hが入っているかは，インストールの仕方により色々であろうから，場所を確認してから上記の操作を行うようにする．
-   なお，ネットのあちこちに，Xquartzをdowngradeすればコンパイルできる，みたいなことが書いてあったが，あれはなんなのだろうか．．．？

今回はいきなりのRネタになってしまった．
