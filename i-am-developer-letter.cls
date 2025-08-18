\ProvidesClass{i-am-developer-letter}[2025/08/01 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{i-am-developer}
}

% Load the article class
\ProcessOptions\relax
\LoadClass{i-am-developer}

% Increase line spacing
\RequirePackage{setspace}

\def \letterHeaderFont {Inter-Regular}
\def \letterMainFont {\mainFont}

% Variables
\newcommand{\companyName}[1]{\def\@companyName{#1}}
\newcommand{\companyAddress}[1]{\def\@companyAddress{#1}}

% Cover Letter
\newcommand{\companyHeader}{%
  % Check if ALL are defined
  \ifdefined\@companyName
  \ifdefined\@companyAddress
  % ok, do nothing
  \else
  \PackageError{i-am-developer-letter}{%
    \string\@companyAddress\space is not defined%
  }{%
    You must define \string\@companyAddress\space before using
    \string\companyHeader.%
  }%
  \fi
  \else
  \PackageError{i-am-developer-letter}{%
    \string\@companyName\space is not defined%
  }{%
    You must define \string\@companyName\space before using
    \string\companyHeader.%
  }%
  \fi

  % Rendering
  \noindent
  \begin{minipage}[t]{0.65\linewidth}
    \fontspec[Path =
    \mainFontPath]{\letterHeaderFont}\selectfont \Large \@companyName
    \\ \large \@companyAddress \normalfont
    % 1 line between the header and the rest of the content.
    \vspace{0.5 em}
  \end{minipage}%
  \hfill
  \begin{minipage}[t]{0.3\linewidth}
    \raggedleft \fontspec[Path =
    \mainFontPath]{\letterHeaderFont}\selectfont \@date \normalfont
  \end{minipage}%
}

% Letter content command
\newcommand{\letterContent}[1]{{\raggedright\fontspec[Path =
    \mainFontPath]{\letterMainFont}\selectfont \setstretch{1.0}{#1
\\}\mbox{}\\ \normalfont}}

% Closing
\newcommand{\closing}[1]{\raggedright\fontspec[Path =
  \mainFontPath]{\letterHeaderFont}\selectfont {#1
\\}\mbox{}\\\mbox{}\\ \normalfont}

\newcommand{\signature}[1]{\raggedright\fontspec[Path =
\mainFontPath]{\letterHeaderFont}\selectfont {#1} \normalfont}
