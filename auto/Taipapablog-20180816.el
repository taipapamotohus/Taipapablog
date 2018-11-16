(TeX-add-style-hook
 "Taipapablog-20180816"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("bxjsarticle" "autodetect-engine" "dvipdfmx" "12pt" "a4paper" "ja=standard") ("tufte-handout" "twoside" "nobib") ("tufte-book" "twoside" "nobib")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("zxjafont" "hiragino-dx") ("natbib" "sort" "compress" "super" "comma")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "bxjsarticle"
    "bxjsarticle12"
    "amsmath"
    "newtxtext"
    "newtxmath"
    "graphicx"
    "hyperref"
    "pxjahyper"
    "tufte-handout"
    "tufte-handout10"
    "zxjatype"
    "zxjafont"
    "tufte-book"
    "tufte-book10"
    "geometry"
    "natbib")
   (LaTeX-add-labels
    "sec:orgedaf247"
    "sec:org6946cfa"
    "sec:org39be922"
    "sec:orge4894ad"
    "sec:org659607a"
    "sec:org332f546"
    "sec:org68363cd"
    "sec:orgbb4edee"
    "sec:org1c627cc"))
 :latex)

