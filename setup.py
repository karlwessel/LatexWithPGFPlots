from setuptools import setup

setup(name='LatexWithPGFPlots',
      version='0.1',
      description='Jupyter notebook latex exporter with pgf plots support.',
      url='TODO',
      author='Karl Royen',
      author_email='wessel.karl@googlemail.com',
      license='MIT',
      packages=['latexwithpgf'],
      zip_safe=False,
      entry_points = {
            'nbconvert.exporters': [
                'latexwithpgf = latexwithpgf:LatexWithPGF',
            ],
        }
     )
