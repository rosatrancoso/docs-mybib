\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{styles/msl}
              [2015/06/18 v1.4h Standard LaTeX document class]
\LoadClass{article}
\RequirePackage{float}
\RequirePackage{etoolbox}% http://ctan.org/pkg/etoolbox
\RequirePackage[breaklinks=true,colorlinks=false,linkcolor=blue,hidelinks,final]{hyperref}
\RequirePackage[a4paper, top=2.5cm, bottom=2.5cm, left=3.17cm, right=2.0cm]{geometry}

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{\@latex@warning@no@line{No \noexpand\subtitle given}}

\def\client#1{\gdef\@client{#1}}
\def\@client{\@latex@warning@no@line{No \noexpand\client given}}

\def\reportnumber#1{\gdef\@reportnumber{#1}}
\def\@reportnumber{\@latex@warning@no@line{No \noexpand\reportnumber given}}

% Define revision table macro and \addrevision command
\let\TableofhistBody\relax
\newcommand{\tableofhist}{
    \begin{table}[h!]
        \centering
        \label{tab:status}
        \begin{tabularx}{\textwidth}{|l|l|X|l|}
            \hline 
            Version & Date & Status & Approved by \\ \hline
            \TableofhistBody
        \end{tabularx}
    \end{table}}

\newcommand{\addrevision}[4]{%
  \gappto\TableofhistBody{#1 & #2 & #3 & #4 \\ \hline}%
}

% Make title persist after \maketitle
\RequirePackage{titling}

\def\@maketitle{%
    \begin{titlepage}
        \centering
        \vspace*{2.0cm}
        {\bfseries\Huge\MakeUppercase
            \@title \\
        }
        \vspace{6cm}
        {\huge
            \@subtitle \\
        }
        \vfill
        \LARGE
        Report prepared for\\ \@client\\
        \vspace{2cm}
%         \includegraphics[width=8cm]{styles/msllogo}\\ 
%         {\small\color{gray}\emph{PO Box 441, New Plymouth, New Zealand \\
%         T: 64-7-7585035 E: enquiries@metocean.co.nz \\
%         www.metocean.co.nz
%         }}
    \end{titlepage}
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Styling to match MSL word template
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Reduce hypenation of small words (requires minimum of 4 letters on each line
% of hyphenated word (default 2).
\lefthyphenmin5
\righthyphenmin5
\emergencystretch=10pt % Allow some extra whitespace to prevent overflows

% Use fancy header
% Relevant headers defined in front and mainmatter below
\RequirePackage{fancyhdr}

% Define tables with taller rows
\renewcommand{\arraystretch}{1.5}

% Capitalize toc, lof and lot
\renewcommand*{\contentsname}{\MakeUppercase{Table of Contents}}
\renewcommand*{\listfigurename}{\MakeUppercase{List of Figures}}
\renewcommand*{\listtablename}{\MakeUppercase{List of Tables}}

% Add 'Figure' and 'Table' prefix to references to these in the lof and lot
\RequirePackage{tocloft}
\cftsetindents{figure}{0em}{6em}
\cftsetindents{table}{0em}{6em}
\renewcommand*{\cftfigpresnum}{Figure }
\renewcommand*{\cfttabpresnum}{Table }

%=========================================
% Setting  parameters for toc, lof and lot
%=========================================
% Set variables 
\newcommand\tskip{\vskip6pt\par}
\newcommand\lskip{\vskip20pt\par}
\newcommand\fsize{\fontsize{11}{5cm}\selectfont}
% Spacing between items
\renewcommand\cftsecafterpnum{\tskip}
\renewcommand\cftsubsecafterpnum{\tskip}
\renewcommand\cftsubsubsecafterpnum{\tskip}
\renewcommand\cftfigafterpnum{\lskip}
\renewcommand\cfttabafterpnum{\lskip}
\setlength\cftbeforepartskip{12pt}
% Stop bolding sections
\renewcommand\cftsecfont{\mdseries}
\renewcommand\cftsecpagefont{\mdseries}
\renewcommand\cftpartfont{\mdseries}
\renewcommand\cftpartpagefont{\mdseries}
% Font sizes
\renewcommand{\cfttoctitlefont}{\fsize\bfseries}
\renewcommand{\cftloftitlefont}{\fsize\bfseries}
\renewcommand{\cftlottitlefont}{\fsize\bfseries}
\renewcommand\cftsecfont{\fsize}
\renewcommand\cftsubsecfont{\fsize}
\renewcommand\cftsubsubsecfont{\fsize}
\renewcommand\cftpartfont{\fsize}
\renewcommand\cftfigfont{\fsize}
\renewcommand\cfttabfont{\fsize}

% Force new page and clear floats with each new section
% Relevant section definitions in mainmatter setup
\RequirePackage{titlesec}
\RequirePackage{placeins}

% Use to increase list indent, see mainmatter setup below
\RequirePackage{enumitem}

% Change figure and table reference counters to be local to each section
\RequirePackage{chngcntr}
\counterwithin{figure}{section}
\counterwithin{table}{section}

% % Turn off paragraph indentation
\setlength\parindent{0pt}

% Increase header height
\setlength{\headheight}{20pt} 

% Captions 
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{msl}{\hspace{0.9cm}}
\captionsetup{%
    justification=justified,   % right justify
    singlelinecheck=off,       % don't center short captions
    format=hang,               % set second line to hang
    labelsep=msl,              % set space between label and caption
    font=small,                % set font size to 10pt
} 
% Equation numbering
\RequirePackage{amsmath}
\numberwithin{equation}{section}

% arial font
% Installation instructions here: http://www.tug.org/fonts/getnonfreefonts/
\RequirePackage[scaled]{uarial}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp} % Fix for missing bullet definiations


% Set font size to 10pt in tables
\let\oldtabular\tabular
\renewcommand*{\tabular}{\footnotesize\oldtabular}
\RequirePackage{tabularx}
\let\oldtabularx\tabularx
\renewcommand*{\tabularx}{\footnotesize\oldtabularx}

% For show fontsize command for testing
% \newcommand*{\showfontsize}{\f@size{} pt}

% Floating figures at top of page
\setlength{\@fptop}{0pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ------------------------------------------
% Front Matter 
% ------------------------------------------



\newcommand\frontmatter{

% Set frontmatter numbering to roman
\pagenumbering{Roman}

% Background cover image 
\ThisTileWallPaper{1.0\paperwidth}{1.0\paperheight}{figures/report_cover.pdf}

% Shifting text right
\newgeometry{top=2.5cm, bottom=4.0cm, left=7.0cm, right=0.6cm}

% Make titlepage
\maketitle

% Adjust margin back for reminder of document
\restoregeometry

% set back to fancy header and foooter
\pagestyle{fancy}

% Set up header and footer
\newcommand\clr{darkgray}
\pagestyle{fancy}
\fancyhf{}
\lhead{{\color{\clr}\small\emph{\@title}}}
\rfoot{{\color{\clr}\small\thepage}}
\lfoot{{\color{\clr}\small\emph{MetOcean Solutions Ltd}}}
\renewcommand{\headrule}{{\color{\clr}%
        \hrule width\linewidth}}
\renewcommand{\footrule}{{\color{\clr}%
        \hrule width\linewidth height\headrulewidth \vskip-\headrulewidth}}

% Suppress page number from first page after cover
\pagenumbering{gobble}

MetOcean Solutions Ltd: Report \@reportnumber
\vspace{0.2cm}

November 2016
\vspace{0.5cm}

Report status

\tableofhist

\vspace{1cm}

It is the responsibility of the reader to verify the currency of the version number of this report.  

\vspace{1cm}

The information, including the intellectual property, contained in this report
is confidential and proprietary to MetOcean Solutions Ltd.  It may be used by
the persons to whom it is provided for the stated purpose for which it is
provided, and must not be imparted to any third person without the prior
written approval of MetOcean Solutions Ltd. MetOcean Solutions Ltd reserves all
legal rights and remedies in relation to any infringement of its rights in
respect of its confidential information.

% This should be a footer but for some reason head/foot are not working for this page
\vfill
\begin{center}
\small\color{darkgray}\emph{PO Box 441, New Plymouth, New Zealand \\
T: 64-7-7585035 E: \href{mailto:enquiries@metocean.co.nz}{\color{blue}\underline{enquiries@metocean.co.nz}} \\
www.metocean.co.nz
}
\vspace{-1.5cm}
\end{center}
\newpage

% Reset numbering and artificially increment to account for previous page
\pagenumbering{Roman}
\setcounter{page}{2}

% Table of contents 
\setlength{\parskip}{0em}
\tableofcontents\thispagestyle{fancy}
\newpage

% List of figures 
\listoffigures\thispagestyle{fancy}
\newpage

% List of tables 
\listoftables\thispagestyle{fancy}
\newpage
}


% ------------------------------------------
% Main Matter Setup
% ------------------------------------------

\newcommand\mainmatter{

% Set up paragraph style
%\setlinespace{1.3}
\setlength{\parskip}{1em}

% Switch to arabic page numbering for main matter
\cleardoublepage\pagenumbering{arabic}
 

% Set up titles and text indent
% http://tex.stackexchange.com/questions/200871/tab-stops-and-consistent-indentation-in-headings
\newlength\extramargin
\setlength\extramargin{2.1cm} % Regular text indent
\setlength\leftskip{\extramargin}

\titleformat{\section}[hang]
    {\Large\bfseries}
    {\thesection.\hspace{1.6cm}} % incorrect indent if chapter > 9
    {0pt}
    {\uppercase}
\titlespacing{\section}{0pt}{1pt}{1pt}


\titleformat{\subsection}[hang]
    {\Large\bfseries}
    {\thesubsection\hspace{1.4cm}} % incorrect indent if section > 9
    {0pt}
    {}

\titleformat{\subsubsection}[hang]
    {\normalfont\sffamily\bfseries}
    {\thesubsubsection\hspace{1.4cm}} % incorrect indent if section > 9
    {0pt}
    {}

% Increase list environment indents to compensate for text indent
\setlist[0]{leftmargin=2.9cm,labelindent=*}
\setlist[1]{leftmargin=2.9cm,labelindent=*}
\setlist[2]{leftmargin=0.5cm,labelindent=*}


% new page and clear floats with each new section
\newcommand{\subsectionbreak}{\FloatBarrier}
% just clear floats with each new subsection
\newcommand{\sectionbreak}{\clearpage}

}
