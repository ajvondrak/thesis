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

%\setlrmarginsandblock{1.5in}{1in}{*}
%\setulmarginsandblock{1in}{1in}{*}
%\setlength{\marginparwidth}{64pt}
%\checkandfixthelayout

    %Paper size
    \setlength{\paperheight}{11in}
    \setlength{\paperwidth}{8.5in}
    
    %Left margin
    \setlength{\marginparwidth}{0in}
    \setlength{\marginparsep}{0in}
    \setlength{\oddsidemargin}{0.5in}
    \setlength{\evensidemargin}{0in}
    
    %Right margin
    \setlength{\textwidth}{5.85in} 
    
    %Top margin
    \setlength{\voffset}{0in}
    \setlength{\topmargin}{0in}

    %Bottom margin
    \setlength{\headheight}{0.125in}
    \setlength{\headsep}{0.25in}
    \setlength{\textheight}{8.375in}
    \setlength{\footskip}{0.50in}
    
    \raggedbottom

% XXX the library didn't give two shits about this

%\setlrmarginsandblock{1.5in}{1in}{*}
%
%% Adjust upper / lower margins based on the header & footer spaces, so that the
%% headers & footers fall within the 1in boundary
%
%\setlength{\textheight}{\paperheight}
%
%\setlength{\headheight}{\onelineskip}
%\setlength{\headsep}{\onelineskip}
%\addtolength{\headsep}{-\topskip}
%
%\setlength{\footskip}{\onelineskip}
%\addtolength{\footskip}{\topskip}
%\setlength{\footnotesep}{\onelineskip}
%
%\addtolength{\marginparwidth}{-\marginparsep}
%
%\setlength{\uppermargin}{1in}
%\addtolength{\uppermargin}{\headheight}
%\addtolength{\uppermargin}{\headsep}
%\addtolength{\textheight}{-\uppermargin}
%
%\setlength{\lowermargin}{1in}
%\addtolength{\lowermargin}{\footskip}
%\addtolength{\lowermargin}{\footnotesep}
%\addtolength{\textheight}{-\lowermargin}
%
%\checkandfixthelayout

%--- Pages ---------------------------------------------------------------------

% Options for signature lines

\newlength{\siglinewidth}
\newlength{\sigcaptionwidth}

% Cover sheet is blank

\newcommand{\coversheet}{\newpage\null\thispagestyle{empty}}

% \maketitle customization for thesis

\setlength{\sigcaptionwidth}{0.3\textwidth}
\setlength{\siglinewidth}{0.6\textwidth}

\pretitle{\begin{center}\Huge\scshape\bfseries}
\posttitle{\par\end{center}\par\vfill}
\preauthor{\begin{center} \large By \par}
\postauthor{\par\the\year\par\end{center}}
%\predate{\begin{phantom}}
%\postdate{\end{phantom}}

\renewcommand{\maketitlehookb}{
  \begin{center}
    A Thesis\\ % class is called ``cpp-thesis'', not ``cpp-project''
    Presented to the\\
    Faculty of\\
    California State Polytechnic University, Pomona

    \vfill

    In Partial Fulfillment\\
    Of the Requirements for the Degree\\
    \thedegree\\
    In\\
    \thefield
  \end{center}
  \vfill
}

\newcommand{\titlepage}{
  \date{}
  \setcounter{page}{1}
  \begin{titlingpage}
    \changepage{-1in} % text height
               {}     % text width
               {}     % even side margin
               {}     % odd side margin
               {}     % column sep
               {   }  % top margin --- apparently not a factor in titlingpage
               {}     % head height
               {}     % head sep
               {}     % foot skip
    \maketitle
  \end{titlingpage}
  \addtocounter{page}{1}
  %\changepage{1in}{}{}{}{}{-1in}{}{}{}
}

\newcommand{\signaturepage}{
  \addcontentsline{toc}{chapter}{Signature Page}
  %\newpage
  % breaks in \titlepage, but not here; what the fuck?
  \changepage{-1in}{}{}{}{}{1in}{}{}{}
  \begin{center}
    \textbf{\textsc{\Huge Signature Page}}
    \vfill
    \begin{tabular}{p{\sigcaptionwidth}p{\siglinewidth}}
      \textbf{Thesis:}         & \textsc{\thetitle} \\
      \textbf{Author:}         & Alex Vondrak       \\
                                %^^^^^^^^^^^^
                                %well, something's making this 0 for some
                                %fucking reason
      \textbf{Date Submitted:} & \thequarter        \\
                               & \thedepartment
    \end{tabular}
  \end{center}
  \vfill
  \begin{SingleSpace}
    \begin{tabular}{p{\sigcaptionwidth}p{\siglinewidth}}
      \thechair              & \hrulefill \\
      Thesis Committee Chair &            \\
      \thechairdept          &            \\ \\[2\onelineskip]
      \thememberA            & \hrulefill \\
      \thememberAdept        &            \\ \\[2\onelineskip]
      \thememberB            & \hrulefill \\
      \thememberBdept        &
    \end{tabular}
  \end{SingleSpace}

  \newpage
  \changepage{1in}{}{}{}{}{-1in}{}{}{}
}

%--- Environments --------------------------------------------------------------

\newenvironment{acknowledgments}%
  {\newpage\addcontentsline{toc}{chapter}{Acknowledgments}}%
  {\newpage}
\newenvironment{ack}{\begin{acknowledgments}}{\end{acknowledgments}}

\abstractnum

\makeatother
