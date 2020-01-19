((*- extends 'article.tplx' -*))
((* block packages *))
((( super() )))
    \usepackage{pgfplots}
    \usetikzlibrary{arrows.meta}
    \usetikzlibrary{backgrounds}
    \pgfkeys{/tikz/.cd,
        background color/.initial=white,
        background color/.get=\backcol,
        background color/.store in=\backcol,
    }
    \tikzset{background rectangle/.style={
            fill=\backcol,
        },
        use background/.style={
            show background rectangle
        }
    }
    \usepgfplotslibrary{patchplots}
    \usepgfplotslibrary{fillbetween}
    \usepgfplotslibrary{groupplots}
((* endblock packages *))

((* block data_other *))
((*- if output.data['text/pgf']: -*))
    ((( output.data['text/pgf'] )))
((*- endif *))
((* endblock data_other *))
