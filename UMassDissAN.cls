\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UMassDissAN}[2025/04/24 Custom Report Class]

\LoadClass[12pt]{report}

% Packages
\RequirePackage{fontspec}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{bookman}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{natbib}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{chngcntr}
\RequirePackage{appendix}
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage[letterpaper,left=1.5in,right=1in,top=1in,bottom=1in]{geometry}
    \setlength{\footskip}{0.5in}
\RequirePackage[normalem]{ulem}
\RequirePackage{soul}
    \setul{}{1pt}
\RequirePackage{etoc}
\RequirePackage{longfbox}
\RequirePackage{hyperref}
\RequirePackage{rotating}
\RequirePackage{amssymb}
\RequirePackage{setspace}
\hypersetup{hypertexnames=false}




%%Resetting the Titles to be ALL CAPS
\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\bibname}{BIBLIOGRAPHY}
\renewcommand{\contentsname}{TABLE OF CONTENTS\\\textnormal{\hfill Page}}
\renewcommand{\listtablename}{LIST OF TABLES\\\textnormal{Table \hfill Page}}
\renewcommand{\listfigurename}{LIST OF FIGURES\\\textnormal{Figure\hfill Page}}


%%Setting Font to Times New Roman
\setmainfont{Times New Roman}
\setmonofont{Courier New}[Scale=MatchLowercase]

%Turn Off Hyphenation
\righthyphenmin=100
\lefthyphenmin=100
\hbadness=10000
\hfuzz=0.5pt
\special{pdf:minorversion 7}
	
%%Numbering Subsections and Adding Subsections to TOC
\setcounter{secnumdepth}{4}		
    %Allow Numbered Subsubsections
\setcounter{tocdepth}{4}		
    %Include Subsubsections in Table of Contents

%%Edit Figure and Table Numbers to Not Depend on Section Numbers
\counterwithout{figure}{chapter}		
    %Remove Chapter No. from Figures
\counterwithout{table}{chapter}		
    %Remove Chapter No. from Tables
\counterwithout{equation}{chapter}		
    %Remove Chapter No. from Equations

%%Page style
\pagestyle{plain}
\onehalfspacing

%%Formatting Chapter Headings
\titleformat{\chapter}		%Format Chapter Heading
  [display]
  {\centering\normalfont\bfseries}
  {\chaptername\ \thechapter}  % "CHAPTER 1"
  {1ex}
  {\centering}


%%Removing bold from table of contents, adding periods behind chapter numbers/appendices letters, and aligning numbered and unnumbered (e.g. front matter pages, bibliography) chapters
\titlecontents{chapter}
    [0em]                      			% left margin
    {\addvspace{1em}} %add space between chapters
    {\thecontentslabel.\hspace{0.5em}} % numbered entries
    {}       % unnumbered entries
    {\titlerule*[0.4155em]{.}\contentspage} % filler and page number


%%Remove space before title to start at top of page
\titlespacing{\chapter}{0cm}{0pt}{15pt}


%% Adding Periods to Numbers in List of Tables and List of Figures
\titlecontents{figure}
    [0em]                      			
    {\normalfont}            			
    {\thecontentslabel.\hspace{0.5em}}     
    {}                 		
    {\titlerule*[0.4155em]{.}\contentspage}
    [\vspace{1em}]

\titlecontents{table}
    [0em]                      			
    {\normalfont}            			
    {\thecontentslabel.\hspace{0.5em}}     
    {}                 		
    {\titlerule*[0.4155em]{.}\contentspage}
    [\vspace{1em}]


%-----------------------------------------------------------------
%ALPHA-NUMERIC FORMATTING DETAILS
%-----------------------------------------------------------------
\renewcommand{\thechapter}{\Roman{chapter}}
    %Make chapter numbers capital roman numerals
\renewcommand{\thesection}{\Alph{section}.}
    %Make section numbers capital latin letters with period
\renewcommand{\thesubsection}{\arabic{subsection}.}
    %Make subsection numbers arabic numerals with period
\renewcommand{\thesubsubsection}{\alph{subsubsection}.}
    %Make subsubsection numbers lowercase latin letters with period
\renewcommand{\theparagraph}{\roman{paragraph}.}
    %Make paragraph numbers lowercase roman numerals with period


%Conditional Spacing of Level Headings in Table of Contents
\renewcommand{\section}{
    \ifnum \c@section=\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space for first section
    \else 
        \ifnum\c@subsection>\z@ 
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space if section is follows subsection (diff. level)
    \else 
        \addtocontents{toc}{\protect\addvspace{0ex}} %single space if section is follows section (same level)
\fi
\fi
\@startsection{section}
    {1}
    {0cm}
    {3.5ex plus 1ex minus 0.2ex}
    {1ex plus 0.2ex}
    {\bfseries\centering\cenund}}
\newcommand{\cenund}[1]{\uline{#1}\par} %bold, center, and underline section headings in main text



\renewcommand{\subsection}{
    \ifnum \c@subsection=\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space for first subsection
    \else
        \ifnum\c@subsubsection>\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space if subsection follows subsubsection (diff. level)
    \else

        \addtocontents{toc}{\protect\addvspace{0ex}} %single space if subsection follows another subsection (same level)
\fi
\fi
\@startsection{subsection}% name
    {2}% level
    {0cm}% indent
    {3.25ex plus 1ex minus 0.2ex}
    {0.2ex}
    {\centering\bfseries}}

\renewcommand{\subsubsection}{
    \ifnum \c@subsubsection=\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space for first subsubsection
    \else 
        \ifnum\c@paragraph>\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space if subsubsection follows paragraph (diff. level)
    \else
        \addtocontents{toc}{\protect\addvspace{0ex}} %single space if subsubsection follows another subsubsection (same level)
\fi
\fi
\@startsection{subsubsection}% name
    {3}% level
    {0cm}% indent
    {3.25ex plus 1ex minus .2ex}
    {0.2ex}
    {\centering\bfseries\uline}}


\renewcommand{\paragraph}{
    \ifnum \c@paragraph=\z@
        \addtocontents{toc}{\protect\addvspace{2ex}} %double space for first paragraph
    \else 
        \addtocontents{toc}{\protect\addvspace{0ex}} %single space if paragraph follows another paragraph

\fi
\@startsection{paragraph}% name
    {4}% level
    {0cm}% indent
    {3.25ex plus 1ex minus 0.2ex}
    {0.2ex}
    {\bf}}


%Fixing Table of Contents Formatting
\renewcommand{\@dotsep}{1.5001875}
\renewcommand{\l@section}[2]{
  \@dottedtocline{1}{2em}{1.5em}{#1}{#2}
}
\makeatother

\makeatletter
\renewcommand{\l@subsection}[2]{
  \@dottedtocline{2}{3.5em}{1.5em}{#1}{#2}
}
\makeatother

\makeatletter
\renewcommand{\l@subsubsection}[2]{
  \@dottedtocline{3}{5em}{1.5em}{#1}{#2}
}
\makeatother

\makeatletter
\renewcommand{\l@paragraph}[2]{
  \@dottedtocline{4}{6.5em}{1.5em}{#1}{#2}
}
\makeatother



%Fixing the spacing between entries in List of Tables
\makeatletter
\patchcmd{\@chapter}
  {\addtocontents{lot}{\protect\addvspace{10\p@}}}
  {}{}{}
\makeatother

%Fixing the spacing between entries in List of Figures
\makeatletter
\patchcmd{\@chapter}
  {\addtocontents{lof}{\protect\addvspace{10\p@}}}
  {}{}{}
\makeatother


%-----------------------------------------------------------------
%AASTEX FORMATING
%-----------------------------------------------------------------
\makeatletter
% AAS-specific commands

\newcommand\ion[2]{#1$\;${%
\ifx\@currsize\normalsize\small \else
\ifx\@currsize\small\footnotesize \else
\ifx\@currsize\footnotesize\scriptsize \else
\ifx\@currsize\scriptsize\tiny \else
\ifx\@currsize\large\normalsize \else
\ifx\@currsize\Large\large
\fi\fi\fi\fi\fi\fi
\rmfamily\@Roman{#2}}\relax}% 

% Journal Abbreviations


\let\jnl@style=\rmfamily 
\def\ref@jnl#1{{\jnl@style#1}}% 
\newcommand\aj{\ref@jnl{AJ}}%        % Astronomical Journal 
\newcommand\araa{\ref@jnl{ARA\&A}}%  % Annual Review of Astron and Astrophys 
\providecommand\apj{\ref@jnl{ApJ}}%    % Astrophysical Journal 
\newcommand\apjl{\ref@jnl{ApJL}}     % Astrophysical Journal, Letters 
\newcommand\apjs{\ref@jnl{ApJS}}%    % Astrophysical Journal, Supplement 
\providecommand\ao{\ref@jnl{ApOpt}}%   % Applied Optics 
\newcommand\apss{\ref@jnl{Ap\&SS}}%  % Astrophysics and Space Science 
\newcommand\aap{\ref@jnl{A\&A}}%     % Astronomy and Astrophysics 
\newcommand\aapr{\ref@jnl{A\&A~Rv}}%  % Astronomy and Astrophysics Reviews 
\newcommand\aaps{\ref@jnl{A\&AS}}%    % Astronomy and Astrophysics, Supplement 
\newcommand\azh{\ref@jnl{AZh}}%       % Astronomicheskii Zhurnal 
\newcommand\baas{\ref@jnl{BAAS}}%     % Bulletin of the AAS 
\newcommand\icarus{\ref@jnl{Icarus}}% % Icarus
\newcommand\jaavso{\ref@jnl{JAAVSO}}  % The Journal of the American Association of Variable Star Observers
\newcommand\jrasc{\ref@jnl{JRASC}}%   % Journal of the RAS of Canada 
\newcommand\memras{\ref@jnl{MmRAS}}%  % Memoirs of the RAS 
\newcommand\mnras{\ref@jnl{MNRAS}}%   % Monthly Notices of the RAS 
\providecommand\pra{\ref@jnl{PhRvA}}% % Physical Review A: General Physics 
\providecommand\prb{\ref@jnl{PhRvB}}% % Physical Review B: Solid State 
\providecommand\prc{\ref@jnl{PhRvC}}% % Physical Review C 
\providecommand\prd{\ref@jnl{PhRvD}}% % Physical Review D 
\providecommand\pre{\ref@jnl{PhRvE}}% % Physical Review E 
\providecommand\prl{\ref@jnl{PhRvL}}% % Physical Review Letters 
\newcommand\pasp{\ref@jnl{PASP}}%     % Publications of the ASP 
\newcommand\pasj{\ref@jnl{PASJ}}%     % Publications of the ASJ 
\newcommand\qjras{\ref@jnl{QJRAS}}%   % Quarterly Journal of the RAS 
\newcommand\skytel{\ref@jnl{S\&T}}%   % Sky and Telescope 
\newcommand\solphys{\ref@jnl{SoPh}}% % Solar Physics 
\newcommand\sovast{\ref@jnl{Soviet~Ast.}}% % Soviet Astronomy 
\newcommand\ssr{\ref@jnl{SSRv}}% % Space Science Reviews 
\newcommand\zap{\ref@jnl{ZA}}%       % Zeitschrift fuer Astrophysik 
\providecommand\nat{\ref@jnl{Nature}}%  % Nature 
\newcommand\iaucirc{\ref@jnl{IAUC}}% % IAU Cirulars 
\newcommand\aplett{\ref@jnl{Astrophys.~Lett.}}%  % Astrophysics Letters 
\newcommand\apspr{\ref@jnl{Astrophys.~Space~Phys.~Res.}}% % Astrophysics Space Physics Research 
\newcommand\bain{\ref@jnl{BAN}}% % Bulletin Astronomical Institute of the Netherlands 
\newcommand\fcp{\ref@jnl{FCPh}}%   % Fundamental Cosmic Physics 
\newcommand\gca{\ref@jnl{GeoCoA}}% % Geochimica Cosmochimica Acta 
\newcommand\grl{\ref@jnl{Geophys.~Res.~Lett.}}%  % Geophysics Research Letters 
\providecommand\jcp{\ref@jnl{JChPh}}%     % Journal of Chemical Physics 
\newcommand\jgr{\ref@jnl{J.~Geophys.~Res.}}%     % Journal of Geophysics Research 
\newcommand\jqsrt{\ref@jnl{JQSRT}}%   % Journal of Quantitiative Spectroscopy and Radiative Trasfer 
\newcommand\memsai{\ref@jnl{MmSAI}}% % Mem. Societa Astronomica Italiana 
\newcommand\nphysa{\ref@jnl{NuPhA}}%     % Nuclear Physics A 
\newcommand\physrep{\ref@jnl{PhR}}%       % Physics Reports 
\newcommand\physscr{\ref@jnl{PhyS}}%        % Physica Scripta 
\newcommand\planss{\ref@jnl{Planet.~Space~Sci.}}%  % Planetary Space Science 
\newcommand\procspie{\ref@jnl{Proc.~SPIE}}%      % Proceedings of the SPIE 

\newcommand\actaa{\ref@jnl{AcA}}%  % Acta Astronomica
\newcommand\caa{\ref@jnl{ChA\&A}}%  % Chinese Astronomy and Astrophysics
\newcommand\cjaa{\ref@jnl{ChJA\&A}}%  % Chinese Journal of Astronomy and Astrophysics
\newcommand\jcap{\ref@jnl{JCAP}}%  % Journal of Cosmology and Astroparticle Physics
\newcommand\na{\ref@jnl{NewA}}%  % New Astronomy
\newcommand\nar{\ref@jnl{NewAR}}%  % New Astronomy Review
\newcommand\pasa{\ref@jnl{PASA}}%  % Publications of the Astron. Soc. of Australia
\newcommand\rmxaa{\ref@jnl{RMxAA}}%  % Revista Mexicana de Astronomia y Astrofisica

%% added feb 9, 2016
\newcommand\maps{\ref@jnl{M\&PS}}% Meteoritics and Planetary Science
\newcommand\aas{\ref@jnl{AAS Meeting Abstracts}}% American Astronomical Society Meeting Abstracts
\newcommand\dps{\ref@jnl{AAS/DPS Meeting Abstracts}}% American Astronomical Society/Division for Planetary Sciences Meeting Abstracts

\makeatother
