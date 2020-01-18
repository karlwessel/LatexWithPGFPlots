((*- extends 'article.tplx' -*))
((* block packages *))
((( super() )))
    \usepackage{pgfplots}
((* endblock packages *))

((* block data_other *))
((*- if output.data['text/pgf']: -*))
    ((( output.data['text/pgf'] )))
((*- endif *))
((* endblock data_other *))
