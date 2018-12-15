(TeX-add-style-hook
 "Taipapablog-20180816"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("bxjsarticle" "autodetect-engine" "dvipdfmx" "12pt" "a4paper" "ja=standard")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
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
    "pxjahyper")
   (LaTeX-add-labels
    "sec:org713ac34"
    "sec:org31add9a"
    "sec:org89e68a3"
    "sec:orged7a6b9"))
 :latex)

