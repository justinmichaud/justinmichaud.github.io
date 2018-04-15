% Intro Options
\ProvidesClass{jmichaud-resume}[2017/09/01 Resume class]
\NeedsTeXFormat{LaTeX2e}
\LoadClass{article}

% Color definitions
\usepackage[usenames,dvipsnames]{xcolor} 
\definecolor{date}{HTML}{666666} 
\definecolor{primary}{HTML}{2b2b2b} 
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}
\definecolor{splash}{HTML}{37862A}

% Package Imports
\usepackage[hmargin=0.5in, vmargin=0.5in]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage{enumitem}
\AtBeginDocument{
	\hypersetup{
		colorlinks=false,
		urlbordercolor=date,
		pdfborderstyle={/S/U/W 0.5}
	}
}

% Set main fonts
\usepackage{fontspec}
\setmainfont[Color=primary, Path = fonts/,BoldItalicFont=SourceSansPro-SemiboldIt,BoldFont=SourceSansPro-Semibold,ItalicFont=SourceSansPro-LightIt]{SourceSansPro-Regular}

% Name command
\newcommand{\namesection}[3]{
\centering{
\fontsize{40pt}{60pt}
\fontspec[Path = fonts/]{SourceSansPro-Light}\selectfont\color{splash} #1 
\fontspec[Path = fonts/]{SourceSansPro-Light}\selectfont #2
} \\[5pt]
\centering{
\color{headings}
\fontspec[Path = fonts/]{SourceSansPro-Regular}\fontsize{11pt}{14pt}\selectfont #3}
}

% Section seperators 
\usepackage{titlesec}
\titlespacing{\section}{0pt}{0pt}{0pt} 
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{10pt}}
\newcommand{\sectionsepp}{\vspace{5pt}}

% Headings command
\titleformat{\section}{\color{splash}
\scshape\fontspec[Path = fonts/]{SourceSansPro-Regular}\fontsize{16pt}{26pt}\selectfont \raggedright\uppercase}{}{0em}{}

\newcommand{\runsection}[1]{
\color{splash}\scshape\fontspec[Path = fonts/]{SourceSansPro-Regular}\fontsize{16pt}{26pt}\selectfont \raggedright\uppercase {#1}\normalfont}

% Subeadings command
\titleformat{\subsection}{
\color{subheadings}\fontspec[Path = fonts/]{SourceSansPro-Semibold}\fontsize{13pt}{13pt}\selectfont\bfseries\uppercase}{}{0em}{}

\newcommand{\runsubsection}[1]{
\color{subheadings}\fontspec[Path = fonts/]{SourceSansPro-Semibold}\fontsize{13pt}{13pt}\selectfont\bfseries\uppercase {#1}\normalfont}

% Descriptors command
\newcommand{\descript}[1]{
\color{subheadings}\scshape\fontspec[Path = fonts/]{SourceSansPro-Semibold}\fontsize{13pt}{13pt}\selectfont {#1} \normalfont}

% Location command
\newcommand{\location}[1]{
\color{headings}\raggedright\fontspec[Path = fonts/]{SourceSansPro-Semibold}\fontsize{11pt}{12pt}\selectfont {#1} \normalfont}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
	\fontsize{10.5pt}{14pt}\selectfont
	\vspace{-\topsep}
	\begin{itemize}
		\itemsep2pt \parskip0pt \parsep0pt}
	{\end{itemize}\vspace{-\topsep}}
