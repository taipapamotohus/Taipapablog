(TeX-add-style-hook
 "Taipapablog-20180816"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("bxjsarticle" "autodetect-engine" "dvipdfmx" "12pt" "a4paper" "ja=standard")))
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
    "pxjahyper")
   (LaTeX-add-labels
    "sec:org85fdb33"
    "sec:org9af93a1"
    "sec:org2305e8f"
    "sec:org791cf7e"
    "sec:orga649958"))
 :latex)

