\ProvidesClass{i-am-developer}[2025/08/01 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{extarticle}
}

%%
%% OPTIONS
%%
\newif\ifextended
\extendedfalse
\DeclareOption{extended}{
  \extendedtrue
}

\newif\ifdebug
\extendedfalse
\DeclareOption{debug}{
  \debugtrue
}

% Load the article class
\ProcessOptions\relax
\LoadClass{extarticle} % For a wider range of default font sizes.

% The main github repo for this project.
\def \githubrepo {https://github.com/eaoliver/i-am-developer/}

% No hyphens to break lines.
\RequirePackage[none]{hyphenat}

% Use the lastpage package to get the total number of pages
\RequirePackage{lastpage}
\pagestyle{empty}

% We use the geometry package to adjust margins.
\newlength{\pageMargin}
\setlength{\pageMargin}{1in}
\RequirePackage[margin=\pageMargin]{geometry} % 1-inch margins all around

% Load fontawesome package for icons
\RequirePackage{fontawesome5}

% We use the ragged2e package for better text justification and wrapping.
\RequirePackage[document]{ragged2e}

\RequirePackage{tikz}
\usetikzlibrary{calc, chains, fit, positioning}

% Colour definitions, added redundant comments to turn on IDE colourization.
\definecolor{primaryColour}{HTML}{2b2b2b} % #2b2b2b
\definecolor{titleColour}{HTML}{1D76E2} % #1D76E2
\definecolor{loveColour}{HTML}{E21D1D} % #E21D1D
\colorlet{dateColour}{gray}
\colorlet{gridColour}{gray!25}
\colorlet{metadataColour}{gray!65}
\colorlet{roleMetadataColour}{gray}

%
% Font definitions
%
% Main font definitions
\def \mainFontPath {fonts/inter/}
\def \mainFont {Inter-Light}
\def \mainFontBold {Inter-SemiBold}
\def \mainSansFont {Inter-Light}
%\def \mainFontSize {2.5}

% Mono font definition
\def \monoFontPath {fonts/officecodeprod/}
\def \monoFont {OfficeCodeProD-Regular}
\def \monoItalicFont {OfficeCodeProD-RegularItalic}
\def \monoBoldFont {OfficeCodeProD-Bold}
\def \monoBoldItalicFont {OfficeCodeProD-BoldItalic}
%\def \monoFontSize {\mainFontSize}

% Title font definitions
\def \titleFontPath {fonts/sourcesanspro/}
\def \firstNameFont {SourceSansPro-SemiBold}
\def \secondNameFont {SourceSansPro-Light}
\def \nameFontSize {92pt}

\def \headlineFontPath {\titleFontPath}
\def \headlineFont {SourceSansPro-Regular}
\def \headlineFontSize {12pt}

\def \metadataFontPath {\titleFontPath}
\def \metadataFont {SourceSansPro-Light}
%\def \metadataFontSize {\mainFontSize pt}

% The boxes at the top and bottom of the screen are bounded by a
% multiple of the metadata font size.
\newlength{\metadataMinHeight}
%\setlength{\metadataMinHeight}{\metadataFontSize}
\begingroup\small
\global\setlength{\metadataMinHeight}{\f@size pt}%
\endgroup

% Section headlings
\def \sectionFontPath {\titleFontPath}
\def \sectionFont {\firstNameFont}
\def \sectionFontSize {14pt}
\def \subsectionFontPath {\titleFontPath}
\def \subsectionFont {SourceSansPro-Regular}
%\def \subsectionFontSize {12pt}

% Role title
\def \roleFontPath {\subsectionFontPath}
\def \roleFont {\subsectionFont}
%\def \roleFontSize {\subsectionFontSize}

% Role institution
\def \roleInstitutionFontPath {\subsectionFontPath}
\def \roleInstitutionFont {\metadataFont}
%\def \roleInstitutionFontSize {\mainFontSize}

% Role location
\def \roleLocationFontPath {\subsectionFontPath}
\def \roleLocationFont {\metadataFont}
%\def \roleLocationFontSize {\mainFontSize}

% Role date
\def \roleDateFontPath {\mainFontPath}
\def \roleDateFont {\mainFont}
%\def \roleDateFontSize {10pt}

\def \sectionVSpace {\baselineskip}
\def \roleVSpace {1em}
\def \roleDetailVSpace {0.5em}

%% Setup main fonts
\RequirePackage{fontspec}
\setmainfont[
  Path = \mainFontPath,
  Scale=0.90,
  BoldFont=\mainFontBold,
  ItalicFont = \mainFont,
  BoldItalicFont = \mainFontBold,
  %UprightFeatures = {SizeFeatures={Size=\mainFontSize}},
  % BoldFeatures={SizeFeatures={Size=\mainFontSize}},
  Color=primaryColour
]{\mainFont}
\setsansfont[
  Path = \mainFontPath,
  Scale=MatchLowercase,
  Mapping=tex-text,
  %UprightFeatures={SizeFeatures={Size=\mainFontSize}}
]{\mainSansFont}
\setmonofont[
  Path = \monoFontPath,
  BoldFont = \monoBoldFont,
  ItalicFont = \monoItalicFont,
  BoldItalicFont = \monoBoldItalicFont
]{\monoFont}

% We like to scale down icons
\def \iconScaleFactor {0.90}

% Grid constants
\newlength \gridLineWidth
\newlength \structureLineWidth
\newlength \markerSegmentWidth
\def \gridStep {0.5\pageMargin}
\setlength{\gridLineWidth}{0.25pt}
\setlength{\structureLineWidth}{0.5pt}
\setlength{\markerSegmentWidth}{0.0625in} % 1/16"

% Handle hyperlinks
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=false,
  linkbordercolor=white,
  urlbordercolor=white,
  pdfpagemode=FullScreen,
}

% Adding an 'extended' option for future use, such as a long version.
\ifextended
\AtBeginDocument{%
  \hypersetup{%
    pdfauthor={\firstName~\lastName},%
    pdftitle={\@title}%
  }%
}
\else
\AtBeginDocument{%
  \hypersetup{%
    pdfauthor={\firstName~\lastName},%
    pdftitle={\@title}%
  }%
}
\fi

%%
%% COMMANDS
%%

% Convert points to inches
\newcommand{\inchesToPoints}[1]{\the\dimexpr#1\relax}

% Define commands for storing contact information
\newcommand{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand{\github}[1]{\def\@github{#1}}
\newcommand{\xhandle}[1]{\def\@xhandle{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\phone}[1]{\def\@phone{#1}}
\newcommand{\web}[2]{%
  \if\relax\detokenize{#2}\relax
  \PackageError{i-am-developer}{Two arguments required for
  \string\web}{Please provide both a web URL and web text}
  \else
  \def\@weburl{#1}%
  \def\@webtext{#2}%
  \fi
}
\newcommand{\address}[4]{%
  \def\@city{#1}%
  \def\@province{#2}%
  \def\@country{#3}%
  \def\@postalcode{#4}%
  \@for\@field:={\@city,\@province,\@postalcode,\@country}\do{%
    \expandafter\ifx\@field\@empty
    \PackageError{i-am-developer}{All fields are required}{}%
    \fi
  }%
}

% Other metadata
\newcommand{\setDate}[1]{\def\@date{#1}}

\newcommand{\formatMetadata}[1]{{
    \fontspec[Path =
    \metadataFontPath]{\metadataFont}%
    \small
    \color{metadataColour}%
    #1\ignorespaces
}}

\newcommand{\formatDate}[1]{{
    \addfontfeatures{Color=dateColour}
    #1\ignorespaces
}}

\newcommand{\formatRole}[1]{{%
    \fontspec[Path = \roleFontPath]{\roleFont}%
    %\fontsize{\roleFontSize}{\roleFontSize}\selectfont
    \Large
    \color{loveColour}%
    #1\ignorespaces
}}
\newcommand{\formatRoleInstitution}[1]{{%
    \fontspec[Path = \roleInstitutionFontPath]{\roleInstitutionFont}%
    \large
    \color{roleMetadataColour}%
    #1\ignorespaces
}}
\newcommand{\formatRoleLocation}[1]{{%
    \fontspec[Path = \roleLocationFontPath]{\roleLocationFont}%
    \large
    \color{roleMetadataColour}%
    #1\ignorespaces
}}
\newcommand{\formatRoleExtras}[1]{{%
    \fontspec[Path = \metadataFontPath]{\metadataFont}%
    \small
    \color{roleMetadataColour}%
    #1\ignorespaces
}}

\newcommand{\formatSection}[1]{{%
    \fontspec[Path = \sectionFontPath]{\sectionFont}%
    \huge
    \color{titleColour}%
    #1\ignorespaces
}}
\newcommand{\formatSubsection}[1]{{%
    \fontspec[Path = \subsectionFontPath]{\subsectionFont}%
    \Large
    \color{titleColour}%
    #1\ignorespaces
}}

% Define a command to print the contact information box
\newcommand{\printContactInfo}{%
  \def \vspacing {0.2em}
  \def \metaspacing {0.5em}
  \ifdefined\@email
  \href{mailto:\@email}{\faEnvelope\ \@email}\hspace{\metaspacing}
  \fi
  \ifdefined\@phone
  \href{tel:\@phone}{\faPhone\ \@phone}\hspace{\metaspacing}
  \fi
  \ifdefined\@weburl
  \href{\@weburl}{\faGlobe\ \@webtext}\hspace{\metaspacing}
  \fi
  \ifdefined\@city
  \faMapMarker\ \@city, \@province, \@country\hspace{\metaspacing}
  \fi
  \ifdefined\@linkedin
  \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedin\ \@linkedin}\hspace{\metaspacing}
  \fi
  \ifdefined\@github
  \href{https://github.com/\@github}{\faGithub\ \@github}\hspace{\metaspacing}
  \fi
  \ifdefined\@xhandle
  \href{https://x.com/\@xhandle}{\faTwitter\ \@xhandle}
  \fi
  \ignorespaces
}

\newcommand{\name}[3]{%
  \ifx\relax#1\relax
  \PackageError{i-am-developer}{First name not set}{Please provide a first name}
  \else\ifx\relax#2\relax
  \PackageError{i-am-developer}{Last name not set}{Please provide a last name}
  \else
  \def\firstName{#1}
  \def\lastName{#2}
  \def\suffix{#3}
  \fi\fi
}

% Command to create the main name section.
\newcommand{\nameSection}[1]{
  % We need the first and last name to be defined.
  \ifdefined\firstName\ifdefined\lastName\else
  \GenericError{i-am-developer}{Name not fully defined}{Please define both
  \string\firstName\space and \string\lastName}{}
  \fi

  % This vertical offset is to pull the E of Earl up to the 1.5 inch grid
  % line.  As mentioned below, I can't figure out how to dynamically position
  % text, so I am manually bumping up the text to where I want it.
  % Fortunately the name of a person changes infrequently relative to the rest
  % of the CV content.
  \vspace*{\gridStep}
  \vspace{-22pt}
  \RaggedRight{
    \color{titleColour}
    \fontsize{\nameFontSize}{1.2\nameFontSize}
    \fontspec[Path = \titleFontPath]{\firstNameFont}\selectfont
    % I really wanted the left clipping or hspace offset to be dynamic, but
    % I can't for the life of me figure it out.  I am just hard coding in a
    % left shift, which makes the E on Earl line up with the left margin
    % precisely.  Sorry for the dirty hack.
    %\clipbox{0.12em 0pt 0pt 0pt}{\colorbox{red!10}{#1}}
    \hspace*{-0.08em}\firstName
    \fontspec[Path = \titleFontPath]{\secondNameFont}\selectfont \lastName
  } \\[18pt] % 0.25 inch spacer

  % Creates a separator
  % \noindent\makebox[\linewidth]{\color{titleColour}\rule{\paperwidth}{0pt}}

  \RaggedRight{
    \fontspec[Path = \headlineFontPath
    ]{\headlineFont}\fontsize{\headlineFontSize}{1.2\headlineFontSize}\selectfont#1
  }

  \vspace{-1.5pt}
}

\newcommand{\drawCrosshair}[1]{%
  % Draw horizontal line of the crosshair
  \draw[titleColour, line width=\structureLineWidth] ($ (#1) +
    (-\markerSegmentWidth,
  0)$) -- ($ (#1) + (\markerSegmentWidth, 0)$);
  % Draw vertical line of the crosshair
  \draw[titleColour, line width=\structureLineWidth] ($ (#1) + (0,
  -\markerSegmentWidth)$) -- ($ (#1) + (0, \markerSegmentWidth)$);
}

\newcommand{\drawCrosshairOnPage}[3]{%
  \coordinate (point) at ($ (current page.#1) + (#2, #3) $);
  \drawCrosshair{point}
}

\newcommand{\IfNotEmptyValueT}[2]{%
  \IfValueT{#1}{%
    \if\relax\detokenize{#1}\relax\else
    #2
    \fi
  }%
}

%%
%% RENEW COMMANDS
%%
\RequirePackage{titlesec}
\renewcommand{\section}[1]{\vspace{\sectionVSpace}{\formatSection{#1}}}
\renewcommand{\subsection}[1]{{\formatSubsection{#1}}}

\AddToHook{shipout/background}{%
  \begin{tikzpicture}[remember picture, overlay]
    \def\gridCoverageMargin{0.75in}

    % \draw[step=0.5in,gridColour,line width=\gridLineWidth] (current
    % page.south west)
    % grid (current page.north east);

    % Page corners
    \coordinate (sw) at (current page.south west);
    \coordinate (se) at (current page.south east);
    \coordinate (nw) at (current page.north west);
    \coordinate (ne) at (current page.north east);

    % Bottom band
    \draw[step=\gridStep, gridColour, line width=\gridLineWidth]
    (sw) grid ($(se) + (0, \gridCoverageMargin)$);

    % Top band
    \draw[step=\gridStep, gridColour, line width=\gridLineWidth]
    ($(nw) + (0, -\gridCoverageMargin)$) grid (ne);

    % Left band
    \draw[step=\gridStep, gridColour, line width=\gridLineWidth]
    ($(sw) + (0, \gridCoverageMargin)$) grid ($(nw) +
    (\gridCoverageMargin, -\gridCoverageMargin)$);

    % Right band
    \draw[step=\gridStep, gridColour, line width=\gridLineWidth]
    ($(se) + (0, \gridCoverageMargin)$) grid ($(ne) +
    (-\gridCoverageMargin, -\gridCoverageMargin)$);

    \ifnum\value{page}=1
    \drawCrosshairOnPage{north west}{1in}{-1in}
    \drawCrosshairOnPage{south east}{-1in}{1in}
    \else
    %\drawCrosshairOnPage{south west}{1in}{1in}
    %\drawCrosshairOnPage{north east}{-1in}{-1in}
    \drawCrosshairOnPage{south east}{-1in}{1in}
    \fi

    % Draw the header on the first page.
    \ifnum\value{page}=1
    \node[anchor=north east, xshift=-\pageMargin,
      yshift=-0.5\pageMargin + 0.5\metadataMinHeight, inner xsep=4pt,
      inner ysep=0pt, draw=none, fill=white, minimum
    height=2\metadataMinHeight, align=right] at (current
    page.north east) {
      \formatMetadata{\printContactInfo}\\[\metadataMinHeight]
    };
    \fi

    % Draw the date footer
    \ifnum\value{page}=1
    \node[fill=white, anchor=south west,
      xshift=\pageMargin +
      % add a tiny shift to clean up the painting over of the grid lines.
      0.25\gridLineWidth,
      yshift=0.5\pageMargin - 0.5\metadataMinHeight,
      inner xsep=4pt, inner ysep=0pt, minimum
    height=2\metadataMinHeight, align=left] at (current
    page.south west) {%
      \\[\metadataMinHeight]
      \formatMetadata{\scalebox{\iconScaleFactor}{\faCalendar}\ \@date}
    };
    \fi

    % Draw the footer with the page numbers.
    \node[fill=white, anchor=south east, xshift=-\pageMargin +
      % add a tiny shift to clean up the painting over of the grid lines.
      0.25\gridLineWidth,
      yshift=0.5\pageMargin - 0.5\metadataMinHeight,
      inner xsep=4pt, inner ysep=0pt, minimum
    height=2\metadataMinHeight, align=right] at (current
    page.south east) {%
      \\[\metadataMinHeight]
      \formatMetadata{%
        \ifnum\value{page}=1
        %\href{\githubrepo}{\faGithub\ Fork my i-am-developer CV
        \href{\githubrepo}{\scalebox{\iconScaleFactor}{\faCodeBranch}\ Fork
          my i-am-developer CV
        \LaTeX\ class on Github}
        \else
        \printContactInfo \quad Page \thepage\ / \pageref{LastPage}
        \fi
      }
    };
  \end{tikzpicture}%
}

%%
%% DEBUG
%%
\ifdebug
%\RequirePackage{showframe} % Shows layout frames
\RequirePackage{pgf}
\RequirePackage{layout} % for layout inspection? % TODO delete

% Add a colored rule to visualize the gap
\newcommand{\printSpacingLine}{
  \noindent\rule{\linewidth}{1pt}\color{red}\rule{\linewidth}{1pt}\color{black}
}

% Print the coordinate given relative to the bottom left (south west) of the
% page.
\newcommand{\printcoord}[2]{%
  \path (current page.south west);
  \pgfgetlastxy{\swx}{\swy}
  \path (#2);
  \pgfgetlastxy{\x}{\y}
  \pgfmathparse{\x - \swx}\let\relx\pgfmathresult
  \pgfmathparse{\y - \swy}\let\rely\pgfmathresult
  \typeout{#1: x = \relx, y = \rely}
}
% Command to log spacing and glue values to the console/log
\newcommand{\dumpSpacing}{%
  % Dimensions (fixed lengths)
  \typeout{=== Spacing Dimensions ===}
  \typeout{parindent = \the\parindent}
  \typeout{linewidth = \the\linewidth}
  \typeout{textwidth = \the\textwidth}
  \typeout{textheight = \the\textheight}
  \typeout{oddsidemargin = \the\oddsidemargin}
  \typeout{evensidemargin = \the\evensidemargin}
  \typeout{topmargin = \the\topmargin}
  \typeout{headheight = \the\headheight}
  \typeout{headsep = \the\headsep}
  \typeout{footskip = \the\footskip}
  \typeout{columnsep = \the\columnsep}
  \typeout{tabcolsep = \the\tabcolsep}
  % Glue (stretchable/shrinkable spacing)
  \typeout{=== Glue Values ===}
  \typeout{parskip = \the\parskip}
  \typeout{baselineskip = \the\baselineskip}
  \typeout{lineskip = \the\lineskip}
  \typeout{lineskiplimit = \the\lineskiplimit}
  \typeout{abovedisplayskip = \the\abovedisplayskip}
  \typeout{belowdisplayskip = \the\belowdisplayskip}
  \typeout{leftskip = \the\leftskip}
  \typeout{rightskip = \the\rightskip}
  \typeout{itemsep = \the\itemsep}
  \typeout{partopsep = \the\partopsep}
  \typeout{parsep = \the\parsep}
}

% Command to log itemize spacing properties
\newcommand{\dumpItemizeSpacing}{%
  \typeout{=== Itemize Spacing Properties ===}
  \typeout{topsep = \the\topsep}
  \typeout{partopsep = \the\partopsep}
  \typeout{itemsep = \the\itemsep}
  \typeout{parsep = \the\parsep}
  \typeout{leftmargini = \the\leftmargini}
  \typeout{leftmarginii = \the\leftmarginii}
  \typeout{leftmarginiii = \the\leftmarginiii}
  \typeout{labelsep = \the\labelsep}
  \typeout{labelwidth = \the\labelwidth}
  \typeout{listparindent = \the\listparindent}
  \typeout{parskip = \the\parskip}
  \typeout{baselineskip = \the\baselineskip}
  \typeout{lineskip = \the\lineskip}
}
\fi

%%
%% SECTIONS AND STRUCTURE
%%
% needspace package to indicate the need for spare, this keeps the section
% header with some of the content.
\RequirePackage{needspace}
\newenvironment{devCVSection}[2]{%
  \section{%
    \needspace{2\baselineskip} % Adjust the value as needed
    \tikz[baseline=(title.west), remember picture]%
  \node[anchor=north west, inner sep=0pt] (title) {#1};}\label{#2}%
  \begin{tikzpicture}[overlay, remember picture]
    % Get the coordinates of the title's top-left corner
    \pgfpointdiff{\pgfpointanchor{current page}{south
    west}}{\pgfpointanchor{title}{north west}}
    % Store the y-coordinate of the top of the title node relative to the
    % page origin
    \edef\topMarkerY{\the\pgf@y}

    % Get the coordinates of the title's bottom-left corner
    \pgfpointdiff{\pgfpointanchor{current page}{south
    west}}{\pgfpointanchor{title}{south west}}
    \edef\bottomMarkerY{\the\pgf@y}

    % Calculate the target y-coordinate as the nearest 0.5" increment.
    % Using 36.135pt for half an inch (72.27pt/inch)
    \pgfmathsetmacro{\topTargetY}{ceil(\topMarkerY /
    \inchesToPoints{\gridStep}) * \inchesToPoints{\gridStep}}
    \edef\topTargetY{\topTargetY pt}
    \pgfmathsetmacro{\bottomTargetY}{floor(\bottomMarkerY /
    \inchesToPoints{\gridStep}) * \inchesToPoints{\gridStep}}
    \edef\bottomTargetY{\bottomTargetY pt}

    \ifdebug
    \message{^^J DEBUGGING:^^J topMarkerY is \topMarkerY^^J
    topTargetY is \topTargetY^^J}
    \message{^^J DEBUGGING:^^J bottomMarkerY is \bottomMarkerY^^J
    bottomTargetY is \bottomTargetY^^J}
    \fi

    % Define the x-coordinate for the vertical line
    \coordinate (xline) at ([xshift=0.5\pageMargin]current page.west);

    % Draw a white box to hide any grid lines
    \draw[draw=none, fill=white] (xline |- title.north west) rectangle
    ($(title.south west) + (-2 * \markerSegmentWidth, 0)$);

    % Produce the coordinates for the two circles.  We draw them later to
    % paint over any lines that go into the circles.
    \coordinate (topCircleCoord) at ($(xline |- current page.south west) +(0,
    \topTargetY)$);
    \coordinate (bottomCircleCoord) at ($(xline |- current page.south
    west) +(0, \bottomTargetY)$);

    \draw[titleColour, line width=\structureLineWidth, shorten
    >=\markerSegmentWidth / 2, shorten <=\markerSegmentWidth / 2]
    (topCircleCoord) -- (bottomCircleCoord);

    \draw[titleColour, line width=\structureLineWidth] (xline |-
    title.north west) -- node[coordinate, pos=0.5] (leftMidLine) {}
    (xline |- title.south west);

    % Draw the new midline from the middle of the vertical line to
    % the title's middle,
    \coordinate (connectorLineEndCoord) at ($(title.west) + (-2 *
    \markerSegmentWidth, 0)$);
    \draw[titleColour] (leftMidLine) -- (connectorLineEndCoord);

    % Draw the vertical line next to the subject title.
    \draw[titleColour, line width=\structureLineWidth]
    (connectorLineEndCoord |-
    title.north west) -- (connectorLineEndCoord |- title.south west);

    % Draw the top circle
    \draw[titleColour, fill=white] (topCircleCoord) circle
    (\markerSegmentWidth / 2);

    % Draw the bottom circle
    \draw[titleColour, fill=white] (bottomCircleCoord) circle
    (\markerSegmentWidth / 2);

    % \drawCrosshair{topCircleCoord};
    % \drawCrosshair{bottomCircleCoord};
  \end{tikzpicture}
}{%
  %\vspace{1em}%
}

%%
%% TABLES
%%
\RequirePackage{longtable}
\RequirePackage{array} % Required for >{} syntax in column definitions
\RequirePackage{parskip}

% We don't want any extra spacing around our tables by default.
\setlength{\LTpre}{0em}
\setlength{\LTpost}{0em}
\setlength{\LTleft}{0em}
\setlength{\LTright}{0em}

\newlength\dev@generalColSep
\newlength\dev@leftCenterCol
\newlength\dev@rightCol

\setlength{\dev@generalColSep}{1em}
\setlength{\dev@leftCenterCol}{\textwidth}
\addtolength{\dev@leftCenterCol}{-\dev@rightCol}
\addtolength{\dev@leftCenterCol}{-\dev@generalColSep}
\setlength{\dev@rightCol}{1.1in}

\RequirePackage{xparse} % Needed to support the enhanced document environment.
%\RequirePackage{relsize} % Used for scaling down icons.

\ifdebug
\RequirePackage{colortbl} % Table colouring.
\fi

\NewDocumentEnvironment{devPublicationType}{o} {
  %\needspace{5\baselineskip}% Keep at least 5 rows together

  \setlength{\tabcolsep}{0pt} % eliminate default spacing in tabular
  \renewcommand{\arraystretch}{1.0} % optional: row height spacing
  \ifdebug
  \rowcolors{1}{purple!10}{purple!15} % Set the background color for the table
  \fi

  \vspace{\roleVSpace}

  \begin{longtable}[l]{
      @{}>{\raggedright}p{\dimexpr\linewidth -
      \dev@rightCol - \dev@generalColSep\relax}
      @{\hskip \dev@generalColSep}>{\raggedleft}p{\dev@rightCol}
    @{}}%

    \IfValueT{#1} {
      % Print the publication type heading (we treat it like a role)
      \devMultiColRow{\formatRole{#1}}
    }
  }{
  \end{longtable}%
}

\RequirePackage[most]{tcolorbox}
\tcbuselibrary{breakable}
\NewDocumentEnvironment{devRole}{m o o O{} o o o o}
{
  % Define macros for the colors depending on debug state
  \ifdebug
  \def\colourBackground{yellow!10}
  \def\colourFrame{yellow!40}
  \else
  \def\colourBackground{white!0}
  \def\colourFrame{white!0}
  \fi

  \begin{tcolorbox}[
      enhanced jigsaw,
      %breakable,
      colback=\colourBackground,
      colframe=\colourFrame,
      boxrule=0pt,
      boxsep=0pt,
      arc=0mm,
      left=0pt,
      right=0pt,
      top=0pt,
      bottom=0pt,
      sharp corners,
      before skip=0pt,
      % before upper={\needspace{4\baselineskip}},
      after skip=0pt,
    ]%
    \vspace{\roleVSpace}
    %\needspace{4\baselineskip} % Keep at least 5 rows together
    \setlength{\tabcolsep}{0pt} % eliminate default spacing in tabular
    \renewcommand{\arraystretch}{1.0} % optional: row height spacing
    \ifdebug
    \rowcolors{1}{blue!10}{blue!5} % Set the background color for the table
    \fi
    \begin{longtable}[l]{
        @{}>{\raggedright\nohyphens}p{\dimexpr\linewidth -
        \dev@rightCol - \dev@generalColSep\relax}
        @{\hskip \dev@generalColSep}>{\raggedleft}p{\dev@rightCol}
      @{}}%

      % Print the role heading
      \devMultiColRow{\formatRole{#1}\hfill\formatDate{#4}}\nopagebreak
      % Second row (conditional):
      % This row is created ONLY if BOTH optional arguments #2 and #3
      % are present.
      \IfValueT{#2}{%
        \IfValueT{#3}{%
          % Print the icon #5 and #6 if they are provided, scaled down.
          \devTwoColRow{\formatRoleInstitution{\IfValueT{#5}{\scalebox{\iconScaleFactor}{#5}~}#2}\hspace{1em}
          \formatRoleLocation{\IfValueT{#6}{\scalebox{\iconScaleFactor}{#6}~}#3}}{}%
        }%
      }%
    \end{longtable}\nopagebreak
    \vspace{\roleDetailVSpace}\nopagebreak
  }{
    \IfNotEmptyValueT{#7}{%
      \begin{flushleft}
        \formatRoleExtras{
          % The gap to the left of each node.
          \def\nodeLeftMargin{0.6em}
          \begin{tikzpicture}[baseline, start chain = going right,
            node distance = \nodeLeftMargin]
            \node[on chain, inner sep=0pt, outer sep=0pt, text
            depth=0.5ex, text height=1.5ex, anchor=base] {
              {\scalebox{\iconScaleFactor}{\faFileCode}}
            };
            \foreach
          \item [count=\i] in {#7} {%
              \node[on chain, inner sep=0pt, outer sep=0pt,
              text depth=0.5ex, text height=1.5ex]
              (node-\i) {%
            \item};%
            }%
          \end{tikzpicture}
        }%
      \end{flushleft}
    }%
    \IfNotEmptyValueT{#8}{%
      \begin{flushleft}
        \formatRoleExtras{
          % The gap to the left of each node.
          \def\nodeLeftMargin{0.6em}
          \begin{tikzpicture}[baseline, start chain = going right,
            node distance = \nodeLeftMargin]
            \node[on chain, inner sep=0pt, outer sep=0pt, text
            depth=0.5ex, text height=1.5ex, anchor=base] {
              {\scalebox{\iconScaleFactor}{\faLightbulb}}
            };
            % --- STEP 1: Draw all the red nodes and their lines first ---
            % We use \foreach to create each item in a vertical stack.
            % Each node is named uniquely (node-1, node-2, etc.).
            \foreach
          \item [count=\i] in {#8} {%
              \node[on chain, inner sep=0pt, outer sep=0pt,
              text depth=0.5ex, text height=1.5ex]
              (node-\i) {%
            \item};%
            }%
          \end{tikzpicture}
        }
      \end{flushleft}\par

      % --- End of the if block ---
    }
  \end{tcolorbox}
}

\newenvironment{devGenericTwoColTable}{
  \setlength{\tabcolsep}{0pt} % eliminate default spacing in tabular
  \renewcommand{\arraystretch}{1.0} % optional: row height spacing
  \ifdebug
  \rowcolors{1}{gray!10}{gray!5} % Set the background color for the table
  \fi
  \begin{longtable}[l]{
      @{}>{\raggedright}p{\dimexpr\linewidth -
      \dev@rightCol - \dev@generalColSep\relax}
      @{\hskip \dev@generalColSep}>{\raggedleft}p{\dev@rightCol}
    @{}}
  }{%
  \end{longtable}
}

\newcommand*{\devTwoColRow}[2]{#1 & \formatDate{#2}\tabularnewline}
\newcommand*{\devMultiColRow}[1]{\multicolumn{2}{@{}p{\textwidth}}{#1}\tabularnewline}
\newcommand*{\devRowSkip}{\tabularnewline[-\parskip]}

\RequirePackage{enumitem} % Added for spacing control
\newenvironment{devItemize}{%
  \begin{itemize}[nosep, noitemsep,  topsep=0.25em,
      ]
      % \setlength{\labelsep}{0.5em}
      \setlength{\parskip}{0pt}
      \setlength{\parsep}{0.5em}
      \setlength{\partopsep}{0pt}
      %\dumpItemizeSpacing

      %   \NewDocumentCommand{\noHyphenItem}{m}{
      % \item \nohyphens{##1}\ignorespaces}%
      \NewDocumentCommand{\dateItem}{O{\textbullet} m m}{
      \item[##1] ##2\hfill
      \formatDate{##3}\ignorespaces}%
    }{%
\end{itemize}}
