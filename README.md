# LatexWithPGFPlots
Custom Jupyter notebook exporter that can use pgfplots instead of images for plots.

When using plotting libraries like `PGFPlotsX.jl` to create plots in a Jupyter notebook this package allows 
you to use the pgf source code instead of an image of the plot when exporting to LaTeX.

The package consists of two parts:
1. The julia module `LatexWithPGFPlots` that adds a custom MIME type `"text/pgf"` to plots created with 
`PGFPlotsX` in a notebook
2. and the python package `latexwithpdf` that adds a new exporter for notebooks that uses the pgf source in
the exported LaTeX document instead of the image.
You will need to install both.

## Installation
Install the exporter with pip by 
```
pip install git+https://github.com/karlwessel/LatexWithPGFPlots.git
```

Install the julia module from within the REPL with
```
]add https://github.com/karlwessel/LatexWithPGFPlots.git
```

## Testing
(Re)start jupyter-notebook, create a new julia notebook and add a new cell with
```
using LatexWithPGFPlots
using PGFPlotsX

p = @pgf Axis(
    {
        xlabel = "Cost",
        ylabel = "Error",
    },
    Plot(
        {
            color = "red",
            mark  = "x"
        },
        Coordinates(
            [
                (2, -2.8559703),
                (3, -3.5301677),
                (4, -4.3050655),
                (5, -5.1413136),
                (6, -6.0322865),
                (7, -6.9675052),
                (8, -7.9377747),
            ]
        ),
    ),
)
```

Which should show the plot as its used to be.

Now you can try the new exporter by chosing the "LaTeX with pgf plots" exporter
from the menue "File -> Download as". Extract the downloaded archive and open the LaTeX 
source file with your favorite LaTeX editor. You should see that it contains the pgfplots source 
instead of an includegraphics. You can build the created tex file with xelatex.

You can also use `nbconvert` from the command line to convert a notebook to LaTeX using
`jupyter-nbconvert --to=latexwithpgf mynotebook.ipynb`

## Still missing
- pdf exporter
- don't include not used images when exporting
- support Plots.jl
- support PGFPlots.jl
