# I Am Developer curriculum vitae LaTeX class

This is a custom implemented latex class that extends the LaTeX `extarticle` class.  The `extarticle` class is used purely to extend the range of the default font sizes supported by `article`.

## Design

The goal of this LaTeX class is to demonstrate both technical acumen and some design expression.

## Requirements

You can find the LaTeX build tools at [TeX Users Group](https://tug.org/).  The default installation of [MacTeX](https://tug.org/mactex/mactex-download.html) includes all the required packages to successfully compile the `i-am-developer` LaTeX class. 

## Usage
The `curriculum_vitae.tex` file is the starting point for editing.  It contains several sections from [@eaoliver](https://github.com/eaoliver/)'s  CV.  

## Compilation 

The package includes a standard **makefile** for command line compilation.  Those familiar with LaTeX know that LaTeX often requires multiple compilation passes to produce a final, correct document due to its multi-pass typesetting process and the way it handles cross-referencing and dynamic content.  The makefile invokes ```xelatex``` 3 times.

## Limitations

I chose not to integrate LaTeX's bibliography functionality into the class.  Instead I hand format my publications, which are no longer being expanded.  Those actively publishing and adding new entries may wish to invest the time to incorporate [BibTeX](https://www.bibtex.org/) support. 
