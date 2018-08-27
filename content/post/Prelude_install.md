+++
title = "Emacsの設定（その1）Preludeの導入"
author = ["taipapa"]
date = 2018-08-15
lastmod = 2018-08-27T22:12:54+09:00
tags = ["emacs", "prelude"]
type = "post"
draft = false
weight = 1
[header]
  image = "headers/Istanbul-long.jpg"
  caption = "Istanbul"
+++

昔はいろいろイチからinit.elを設定したものだけど，今は最初からほぼ全部やってくれる設定集がある．


## Preludeとは {#preludeとは}

-   Emacs初期設定集の一種．他にもいろいろあるようだが，これしか使ったことがないので．．．
-   [Prelude](https://github.com/bbatsov/prelude) Githubはこちら


## Preludeのインストール {#preludeのインストール}

-   上記のGithubのFast Forwardに書いてあるように，macOSで既にgitとcurlとEmacsをインストールしていれば，下記のコマンドを打てば，Preludeがインストールされる．念のために，古い.emacs.dはどこかに退避させておく（名前を変えて保存されるようになって入るが心配性なもんで）．

    ```shell
    $ curl -L https://git.io/epre | sh
    ```
-   インストール終了後にEmacsを再起動すると，勝手にもの凄い勢いでどんどん各種パッケージをダウンロードしてインストールしてくれる．auctexなどもインストールされるので，LaTeXも使えるようになる．素晴らしい！
-   prelude-modules.elを見て必要なmodulesがロードされるようにコメントアウトを外す．

    ```lisp
    (require 'prelude-helm) ;; Interface for narrowing and search
    (require 'prelude-helm-everywhere) ;; Enable Helm everywhere
    ```

    helmにすっかり慣らされてしまったのでこのあたりは外している．
-   preludeのdefaultの設定は，ほぼ満足すべきものだが，ひとつだけ，prelude-auto-saveが邪魔である．これは，他のbufferに移動したり，他のアプリを使用したりするたびに自動で保存される機能であるが，非常に鬱陶しい．M-x customize からprelude-auto-saveを検索し，offにする．custom.elに書き込まれる．
-   個人の設定は，~/.emacs.d/personal/init.elに書き込む．これは，org-modeを使って設定するのが良い．まずorg-modeについての記事を書いたあとにinit.orgについて書く予定．
