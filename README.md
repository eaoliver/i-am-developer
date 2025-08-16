# I Am Developer: CV and Cover Letter LaTeX Classes

The `i-am-developer` curriculum vitae (CV) package consists of two LaTeX classes: `i-am-developer.cls` and `i-am-developer-letter.cls`.  The cover letter class extends from the `i-am-developer` class, which extends from the LaTeX `extarticle` class.  The `extarticle` class is used purely to extend the range of the default font sizes supported by `article`.

## Design

The goal of this LaTeX class is to demonstrate both technical acumen and some design expression.  I wanted a CV that stood out in a crowded field and showcased both my extensive experience as well as my publications.

## Requirements

You can find the LaTeX build tools at [TeX Users Group](https://tug.org/).  The default installation of [MacTeX](https://tug.org/mactex/mactex-download.html) includes all the required packages to successfully compile the `i-am-developer` and `i-am-developer-letter` LaTeX classes. 

## Usage

The `curriculum_vitae.tex` and `coverletter.tex` files are the starting point for editing.  The sample CV contains several sections from [@eaoliver](https://github.com/eaoliver/)'s  CV.  The cover letter sample contains lorem ipsum content.

## Compilation 

The package includes a standard **makefile** for command line compilation.  Those familiar with LaTeX know that LaTeX often requires multiple compilation passes to produce a final, correct document due to its multi-pass typesetting process and the way it handles cross-referencing and dynamic content.  The makefile invokes ```xelatex``` 3 times.  I'm sure there are smarter ways to compile LaTeX, but this is what I've been doing for 20 years.

## Limitations

I chose not to integrate LaTeX's bibliography functionality into the class.  Instead I hand format my publications. Those actively publishing and adding new entries may wish to invest the time to incorporate [BibTeX](https://www.bibtex.org/) support. 

## Contribute

I'll do my best to accept pull requests of interesting changes anyone cares to make.

📫 Connect with me.

[![X](https://img.shields.io/badge/X-000000?style=for-the-badge&logo=x&logoColor=white)](https://x.com/eaoliver) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/eaoliver/)
