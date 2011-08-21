\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cpp-thesis}[2010/11/11 Cal Poly Pomona Thesis Format]
\RequirePackage{bold-extra}

\makeatletter

%--- memoir --------------------------------------------------------------------

\PassOptionsToClass{letterpaper,oneside}{memoir}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

\LoadClass{memoir}

\DoubleSpacing
\pagestyle{plain}

%--- Variables -----------------------------------------------------------------

\newcommand{\thefield}{}
\newcommand{\field}[1]{\renewcommand{\thefield}{#1}}

\newcommand{\thedegree}{}
\newcommand{\degree}[1]{\renewcommand{\thedegree}{#1}}

\newcommand{\thechair}{}
\newcommand{\thechairdept}{}
\newcommand{\chair}[2]{\renewcommand{\thechair}{#1}
                       \renewcommand{\thechairdept}{#2}}

\newcommand{\thememberA}{}
\newcommand{\thememberAdept}{}
\newcommand{\memberA}[2]{\renewcommand{\thememberA}{#1}
                         \renewcommand{\thememberAdept}{#2}}

\newcommand{\thememberB}{}
\newcommand{\thememberBdept}{}
\newcommand{\memberB}[2]{\renewcommand{\thememberB}{#1}
                         \renewcommand{\thememberBdept}{#2}}

\newcommand{\thedepartment}{\thefield}
\newcommand{\department}[1]{\renewcommand{\thedepartment}{#1}}

\newcommand{\thequarter}{}
\newcommand{\quarter}[1]{\renewcommand{\thequarter}{#1}}

%--- Margins -------------------------------------------------------------------

\setlrmarginsandblock{1.5in}{1in}{*}
\setulmarginsandblock{1in}{1in}{*}
\setlength{\marginparwidth}{64pt}
\checkandfixthelayout

%--- Pages ---------------------------------------------------------------------

% Cover sheet is blank

\newcommand{\coversheet}{\newpage\null\thispagestyle{empty}}

\newcommand{\titlepage}{
  \clearpage
  \setcounter{page}{1}
  \thispagestyle{empty}
  \begin{center}
    \textsc{\textbf{\@title}}
    \vfill
    A Thesis\\
    Presented to the\\
    Faculty of\\
    California State Polytechnic University, Pomona
    \vfill
    In Partial Fulfillment\\
    Of the Requirements for the Degree\\
    \thedegree\\
    In\\
    \thefield
    \vfill
    By\\
    \@author\\
    \the\year\\
  \end{center}
  \newpage
}

\newcommand{\signaturepage}{
  \addcontentsline{toc}{chapter}{Signature Page}
  \begin{SingleSpace}
    \begin{center}
      \textbf{\textsc{Signature Page}}
    \end{center}
    ~\\
    \begin{tabular}{ll}
      \textbf{\textsc{Thesis:}}          & \textsc{\thetitle} \\
                                                              \\\\
      \textbf{\textsc{Author:}}          & \@author           \\
                                                              \\\\
      \textbf{\textsc{Date Submitted:}}  & \thequarter        \\\\
                                         & \thedepartment     \\
                                                              \\\\
      \thechair                          & \hrulefill         \\
      Thesis Committee Chair             &                    \\
      \thechairdept                      &                    \\
                                                              \\\\
      \thememberA                        & \hrulefill         \\
      \thememberAdept                    &                    \\
                                                              \\\\
      \thememberB                        & \hrulefill         \\
      \thememberBdept                    &
    \end{tabular}
  \end{SingleSpace}
  \newpage
}

%\changepage{\textheight}
%           {\textwidth}
%           {\evensidemargin}
%           {\oddsidemargin}
%           {\columnsep}
%           {\topmargin}
%           {\headheight}
%           {\headsep}
%           {\footskip}

\addtodef{\frontmatter}{}{%
  \coversheet
  \changepage{-1in}{}{}{}{}{1in}{}{}{}
  \titlepage
  \signaturepage
  \changepage{1in}{}{}{}{}{-1in}{}{}{}
}

%--- Environments --------------------------------------------------------------

\newenvironment{acknowledgments}%
  {\newpage%
   \addcontentsline{toc}{chapter}{Acknowledgments}\chapter*{Acknowledgments}}%
  {\newpage}
\newenvironment{ack}{\begin{acknowledgments}}{\end{acknowledgments}}

\abstractnum

\makeatother
