# file __init__.py
import os
import os.path

from traitlets import default
from traitlets.config import Config
from nbconvert.exporters.latex import LatexExporter
from nbconvert.exporters.pdf import PDFExporter

#-----------------------------------------------------------------------------
# Classes
#-----------------------------------------------------------------------------

def extend_default_latex_config(c):
    c['NbConvertBase']['display_data_priority'] = [
            'text/latex',
            'text/pgf',
            'application/pdf',
            'image/png',
            'image/jpeg',
            'image/svg+xml',
            'text/markdown',
            'text/plain'
            ]
    c['ExtractOutputPreprocessor']['extract_output_types'].add('text/pgf')
    return c

class LatexWithPGF(LatexExporter):

    # If this custom exporter should add an entry to the
    # "File -> Download as" menu in the notebook, give it a name here in the
    # `export_from_notebook` class member
    export_from_notebook = "LaTeX with pgf plots"

    @default('template_data_paths')
    def _template_data_paths_default(self):
        return super(LatexWithPGF,self)._template_data_paths_default()+[os.path.join(os.path.dirname(__file__), "templates")]

    def _template_file_default(self):
        return 'pgfplots.tpl'

    @property
    def default_config(self):
        c = super(LatexWithPGF,self).default_config
        return extend_default_latex_config(c)

class PDFWithPGFExporter(PDFExporter):
    export_from_notebook = "PDF via LaTeX with PGF"

    @default('template_data_paths')
    def _template_data_paths_default(self):
        return super(PDFWithPGFExporter,self)._template_data_paths_default()+[os.path.join(os.path.dirname(__file__), "templates")]

    def _template_file_default(self):
        return 'pgfplots.tpl'

    @property
    def default_config(self):
        c = super(PDFWithPGFExporter,self).default_config
        return extend_default_latex_config(c)

