%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Response LaTeX Template - RESPONSE CLASS FILE
%
% This class file provides a template for writing a response to the examiners' comments on a thesis.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{Response}
[2014/26/04 v1.0
    LaTeX document class]


\def\baseclass{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\def\@checkoptions#1#2{
    \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
    \@tempswafalse
    \@tfor\@this:=#2\do{
        \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
        \ifin@ \@tempswatrue \@break@tfor \fi}
    \let\@this\@empty
    \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{11pt}{{10pt}{11pt}{12pt}}
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}

\RequirePackage{setspace}
\onehalfspacing
\setlength{\parskip}{1.0ex plus0.5ex minus0.2ex}

\RequirePackage{vmargin}
%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------
\setmarginsrb   { 1.0in}  % left margin      default: 1.5in
{ 0.8in}  % top margin       default: 0.6in
{ 1.0in}  % right margin     default: 1.0in
{ 0.8in}  % bottom margin    default: 0.8in
{  20pt}  % head height      default: 20pt
{0.25in}  % head sep         default: 0.25in
{   9pt}  % foot height      default: 9pt
{ 0.3in}  % foot sep         default: 0.3in
%----------------------------------------------------------------------------------------

\RequirePackage{amsmath,amssymb,amsfonts,amscd,amsthm,xspace}
\RequirePackage[centerlast,small,sc]{caption}
\RequirePackage{graphicx}
\RequirePackage{epstopdf}
\RequirePackage{booktabs}
\RequirePackage{rotating}
\RequirePackage{listings}
\RequirePackage{makecell}
\RequirePackage{tikz}
\RequirePackage{eso-pic}

\RequirePackage[pdfpagemode={UseOutlines},bookmarks=true,bookmarksopen=true,bookmarksopenlevel=1,bookmarksnumbered=true,hypertexnames=true,colorlinks,linkcolor={blue},citecolor={blue},urlcolor={black},pdfstartview={FitV},unicode,breaklinks=true,plainpages=false,backref=page]{hyperref}

\RequirePackage{Styles/lstpatch}

\newcommand*{\thesistitle}[1]{\def\ttitle{#1}}
\newcommand*{\degree}[1]{\def\degreename{#1}}
\newcommand*{\authors}[1]{\def\authornames{#1}}
\newcommand*{\dates}[1]{\def\dateofresponse{#1}}
\newcommand*{\signpath}[1]{\def\pathtosignature{#1}}

\newcounter{examiner}
\newcounter{question}[examiner]
\newcounter{answer}[examiner]

\RequirePackage{xparse}

\NewDocumentCommand{\makeResponseTitle}{O{\theexaminer}} {
    \refstepcounter{examiner}
    \setcounter{examiner}{#1}
    \begin{spacing}{1.1}
        \begin{center}
            \Large \underline{\bf  Reply to Thesis Examiner No.{#1}} \par
        \end{center}
        \renewcommand{\arraystretch}{1.6}
        \noindent
        \begin{tabular}{l !{\bf :} l }
            \textbf{Name of Candidate} & {\authornames}         \\
            \textbf{Degree}            & {\degreename}          \\
            \textbf{Thesis Title}      & \makecell[cl]{\ttitle} \\
        \end{tabular}
        \medskip\par
        \noindent\rule{\textwidth}{0.5pt}\par
    \end{spacing}
    \medskip
}

\newcommand\makeResponseEnd{
    \vspace{2.5cm}
    \begin{spacing}{1}
        \begin{center}
            \makebox[4cm]{\dateofresponse}  \hfill
            \tikz[remember picture,overlay]
            \node[opacity=0.9,inner sep=0pt]at (2.13, 0.5) {\includegraphics[width=4cm,height=1.527cm]{Styles/ntu-watermark.png}};
            \makebox[4cm]{\includegraphics[height=0.9cm]{\pathtosignature}}\\
        \end{center}
        \vspace{-1.3cm}
        \begin{center}
            \makebox[4cm]{\dotfill}  \hfill \makebox[4cm]{\dotfill}\\
            \makebox[4cm]{Date}    \hfill \makebox[4cm]{\authornames}
        \end{center}
    \end{spacing}
    \newpage
}

\NewDocumentCommand{\question}{O{\thequestion} O{\thequestion}}{
    \refstepcounter{question}
    \def\@currentlabel{#1} \setcounter{question}{#2}
    \par \medskip \textcolor{blue}{\textbf{Q.{#1}):}} %
}

\NewDocumentCommand{\answer}{O{\theanswer} O{\theanswer}}{
    \refstepcounter{answer}
    \def\@currentlabel{#1} \setcounter{answer}{#2}
    \par \textcolor{blue}{\textbf{A.{#1}):}} %
}
