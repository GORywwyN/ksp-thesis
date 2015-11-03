%%% ===========================================================================
%%% <ksp-thesis>
%%% A LaTeX class for theses published with KIT Scientific Publishing
%%% ===========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ksp-thesis}[2015/11/02 LaTeX class for theses published with KIT Scientific Publishing]

%%% ===========================================================================
%%% PRELIMINARY DECLARATIONS
%%% ===========================================================================
%%% Page layout options
%%% ---------------------------------------------------------------------------
%%% draft layout (for private print and correction prints)
\newcommand{\kspths@setlayout@draft}{%
   \KOMAoptions{paper=a4,twoside=off,DIV=12,fontsize=12pt,BCOR=0.0mm,parskip=half,headsepline}%
   \setheadsepline{0.5pt}%
   \raggedbottom%
}
%%% official layout (for faculty and thesis committee)
\newcommand{\kspths@setlayout@official}{%
   \KOMAoptions{paper=a4,twoside=on,DIV=13,fontsize=12pt,BCOR=15.0mm,parskip=half,cleardoublepage=empty,headsepline}%
   \setheadsepline{0.5pt}%
   \raggedbottom%
}
%%% KIT Scientific Report layout (for publication release, A4 paper size)
\newcommand{\kspths@setlayout@report}{\kspths@setlayout@official}
%%% KIT Scientific Publishing book layout (for publication release, 17cm x 24cm paper size)
\newcommand{\kspths@setlayout@seventeentwentyfour}{%
   \KOMAoptions{paper=17cm:24cm,twoside=on,DIV=14,fontsize=10pt,BCOR=15.0mm,parskip=half,cleardoublepage=empty,headinclude,pagesize,headsepline}%
   \setheadsepline{0.5pt}%
   \raggedbottom%
}
%%% default layout (if not set in class options)
\newcommand{\kspths@setlayout}{%
   \ClassWarning{ksp-thesis}{You have not selected a page layout, the default option 'report' will be used.}
   \kspths@setlayout@report%
}


%%% ===========================================================================
%%% OPTION DECLARATION AND PROCESSING
%%% ===========================================================================
\RequirePackage{xkeyval}
%%% BEGIN PATCH
%%% to avoid endless loop when using bad presetkey settings
%%% http://tex.stackexchange.com/a/94006
\def\XKV@badsetkeys{%
  \@latex@error{You can't nest \noexpand\setkeys in preset keys.
    \MessageBreak That could cause an endless loop}\@ehd
}
\let\XKV@savsetkeys\setkeys
\def\XKV@usepresetkeys#1#2{%
  \XKV@presettrue
  \let\setkeys\XKV@badsetkeys
  \XKV@for@eo\XKV@fams\XKV@tfam{%
    \XKV@makehd\XKV@tfam
    \XKV@ifundefined{XKV@\XKV@header#2}{}{%
      \XKV@toks\expandafter\expandafter\expandafter
        {\csname XKV@\XKV@header#2\endcsname}%
      \@expandtwoargs\XKV@s@tkeys{\the\XKV@toks}%
        {\XKV@naa\ifx\XKV@naa\@empty\else,\fi#1}%
    }%
  }%
  \let\setkeys\XKV@savsetkeys
  \XKV@presetfalse
}
%%% END PATCH

%%% main page layout options
%%% ---------------------------------------------------------------------------
\define@choicekey*+{ksp-thesis.cls}{layout}[\val\nr]{draft,official,report,17x24}{%
   \ifcase\nr\relax
      \renewcommand{\kspths@setlayout}{\kspths@setlayout@draft}
   \or
      \renewcommand{\kspths@setlayout}{\kspths@setlayout@official}
   \or
      \renewcommand{\kspths@setlayout}{\kspths@setlayout@report}
   \or
      \renewcommand{\kspths@setlayout}{\kspths@setlayout@seventeentwentyfour}
   \fi
}{%
   \ClassWarning{ksp-thesis}{Value '#1' is unknown for key 'layout' and will %
      be ignored.}%
}
%%% TOC style options
%%% ---------------------------------------------------------------------------
%%% dotted TOC
\define@boolkey+{ksp-thesis.cls}[kspths@]{dottedtoc}[true]{%
   \ifkspths@dottedtoc
   \else
      \@ifpackagewith{classicthesis}{dottedtoc}{%
         \ClassWarning{ksp-thesis}{'dottedtoc=#1': The option 'dottedtoc' of %
            the <classicthesis> package has been previously set and cannot be %
            overridden anymore. %
            Please remove the earlier setting}
      }{%
         \ClassWarning{ksp-thesis}{The default setting for 'dottedtoc' has %
            been changed to '#1'.}
      }
   \fi
}{%
   \ClassError{ksp-thesis}{Invalid value '#1' for 'dottedtoc' key, assuming 'true'}%
      {Please use 'true' or 'false'}%
   \setkeys{ksp-thesis.cls}{dottedtoc=true}
}
%%% bold TOC part entries
\define@boolkey+{ksp-thesis.cls}[kspths@]{tocpartentriesbold}[true]{%
   \ifkspths@tocpartentriesbold
   \else
      \ClassWarning{ksp-thesis}{The default setting for 'tocpartentriesbold' has been %
         changed to '#1'.}
   \fi
}{%
   \ClassError{ksp-thesis}{Invalid value '#1' for 'tocpartentriesbold' key, assuming 'true'}%
      {Please use 'true' or 'false'}%
   \setkeys{ksp-thesis.cls}{tocpartentriesbold=true}
}
%%% bold TOC chapter entries
\define@boolkey+{ksp-thesis.cls}[kspths@]{tocchapterentriesbold}[true]{%
   \ifkspths@tocchapterentriesbold
   \else
      \ClassWarning{ksp-thesis}{The default setting for 'tocchapterentriesbold' has been %
         changed to '#1'.}
   \fi
}{%
   \ClassError{ksp-thesis}{Invalid value '#1' for 'tocchapterentriesbold' key, assuming 'true'}%
      {Please use 'true' or 'false'}%
   \setkeys{ksp-thesis.cls}{tocchapterentriesbold=true}
}
%%% bold TOC entries
\define@boolkey+{ksp-thesis.cls}[kspths@]{tocentriesbold}[true]{%
   \setkeys{ksp-thesis.cls}{tocpartentriesbold=#1,tocchapterentriesbold=#1}
   \ifkspths@tocentriesbold
   \else
      \ClassWarning{ksp-thesis}{The default setting for 'tocentriesbold' has been %
         changed to '#1'.}
   \fi
}{%
   \ClassError{ksp-thesis}{Invalid value '#1' for 'tocentriesbold' key, assuming 'true'}%
      {Please use 'true' or 'false'}%
   \setkeys{ksp-thesis.cls}{tocentriesbold=true}
}

%%% pass unknown options on to the base class
%%% ---------------------------------------------------------------------------
\DeclareOptionX*{%
   \PassOptionsToClass{\CurrentOption}{scrbook}%
}
%%% default settings
%%% ---------------------------------------------------------------------------
\presetkeys{ksp-thesis.cls}{%
   dottedtoc,
   %tocentriesbold, % cannot be set within \presetkeys
   %layout=report, % default behavoir is set above with \newcommand{\kspths@setlayout}
}{}
\setkeys{ksp-thesis.cls}{tocentriesbold} % cannot be set within \presetkeys
%%% process options
%%% ---------------------------------------------------------------------------
\ProcessOptionsX

%%% ===========================================================================
%%% LOAD BASE CLASS <scrbook>
%%% =========================================================================== 
\LoadClass{scrbook}
\RequirePackage{scrpage2}  % change header and footer

%%% ===========================================================================
%%% MAIN DECLARATIONS
%%% ===========================================================================
%%% set package options
%%% ---------------------------------------------------------------------------
\ifkspths@dottedtoc
   \PassOptionsToPackage{dottedtoc}{classicthesis} % sets pagenumbers flushed right in the table of contents
\fi
%%% <classicthesis> and <arsclassica> for layout, font and typography settings
%%% ---------------------------------------------------------------------------
\RequirePackage{classicthesis}
\RequirePackage{arsclassica}
%%% reset page and typearea settings according to KSP requirements
%%% ---------------------------------------------------------------------------
\kspths@setlayout
\recalctypearea
%%% modify <arsclassica> definitions for headings
%%% ---------------------------------------------------------------------------
%%% color definitions
\definecolor{parttitlecolor}{named}{Maroon}
\definecolor{chapternumbercolor}{named}{halfgray}
%%% use font definitions that are compatible with KOMA script
\setkomafont{part}{\normalfont\centering\large}
\newkomafont{parttitle}{\color{parttitlecolor}\spacedallcaps}
\setkomafont{chapter}{\normalfont\Large\sffamily}
\newkomafont{chaptertitle}{\raggedright\spacedallcaps}
\setkomafont{section}{\normalfont\Large\sffamily\raggedright}
\newkomafont{sectiontitle}{\spacedlowsmallcaps}
\setkomafont{subsection}{\normalfont\large\sffamily\raggedright}
\newkomafont{subsectiontitle}{\relax}
\setkomafont{subsubsection}{\normalfont\sffamily\itshape\raggedright}
\newkomafont{subsubsectiontitle}{\normalsize\itshape}
\setkomafont{paragraph}{\normalfont\normalsize\sffamily}
\newkomafont{paragraphtitle}{\spacedlowsmallcaps}
\setkomafont{descriptionlabel}{\bfseries\spacedlowsmallcaps}
%%% command to make a box with the width of the current chapter number
%%% (this allows to use equal width for chapter, ..., subsubsection numbers)
\newlength{\secnumwidth}%
\newcommand{\kspths@secnumbox}[1]{%
\settowidth{\secnumwidth}{\usekomafont{chapter}{\chapterNumber\thechapter\hspace{10pt}\vline}  }%
\makebox[\secnumwidth][l]{#1}%
}
%%% reformat parts
\ifthenelse{\boolean{@parts}}%
{%
   \titleformat{\part}[display]
      {\usekomafont{part}}%
      {\thispagestyle{empty}\partname~\MakeTextUppercase{\thepart}}{1em}%
      {\usekomafont{parttitle}}
}{\relax}
%%% reformat chapters
\ifthenelse{\boolean{@linedheaders}}{%
   \ClassWarning{ksp-thesis}{%
      The 'linedheaders' option of the <classicthesis> package is incompatible and %
      will be ignored.}%
}{}
\renewcommand\formatchapter[1]{% 
   \vbox to \ht\strutbox{ 
   \setbox0=\hbox{\chapterNumber\thechapter\hspace{10pt}\vline\ } 
   \advance\hsize-\wd0 \advance\hsize-10pt
   \usekomafont{chaptertitle}{#1}\vss}} 
\titleformat{\chapter}[block] 
   {\usekomafont{chapter}} 
   {\textcolor{chapternumbercolor}{\chapterNumber\thechapter} 
   \hspace{10pt}\vline\ }{10pt} 
   {\formatchapter}
%%% reformat sections
\titleformat{\section} 
   {\usekomafont{section}}{\kspths@secnumbox{\textsc%
   {\MakeTextLowercase{\thesection}}}}%
   {10pt}{\usekomafont{sectiontitle}}
%%% reformat subsections
\titleformat{\subsection}
   {\usekomafont{subsection}}{\kspths@secnumbox{\textsc{\MakeTextLowercase%
   {\thesubsection}}}}{10pt}{\usekomafont{subsectiontitle}}
%%% reformat subsubsections
\titleformat{\subsubsection}
   {\usekomafont{subsubsection}}{\kspths@secnumbox{\textsc%
   {\MakeTextLowercase{\thesubsubsection}}}}%
   {10pt}{\usekomafont{subsubsectiontitle}}        
%%% reformat paragraphs
\titleformat{\paragraph}[runin]
   {\usekomafont{paragraph}}{\textsc%
   {\MakeTextLowercase{\theparagraph}}}%
   {0pt}{\usekomafont{paragraphtitle}}    
%%% reformat descriptionlabels
\renewcommand{\descriptionlabel}[1]{\hspace*{\labelsep}%
\usekomafont{descriptionlabel}{#1}}
%%% modify <classicthesis> definitions for TOC style
%%% ---------------------------------------------------------------------------
%%% use correct format of parts in TOC
%%% http://tex.stackexchange.com/a/140053
\def\ttl@tocpart{\def\ttl@a{\protect\numberline{\thepart}\@gobble{}}}
%%% use equal width for part numbers and chapter numbers
\setlength{\cftpartnumwidth}{\cftchapnumwidth}
%%% use bold parts instead of smallcaps if specified in the options
\ifkspths@tocpartentriesbold
   \renewcommand{\thepart}{\Roman{part}}%
   \renewcommand{\cftpartpresnum}{\normalfont\bfseries}%  \scshape
   \let\cftpartfontoriginal\cftpartfont
   \renewcommand{\cftpartfont}{%
\let\spacedlowsmallcapstemp\spacedlowsmallcaps%
\let\spacedlowsmallcaps\relax%
\cftpartfontoriginal\bfseries}%
   \renewcommand{\cftpartafterpnum}{\let\spacedlowsmallcaps\spacedlowsmallcapstemp}
   \renewcommand{\cftpartpagefont}{\normalfont\bfseries}%
\fi
%%% use bold chapters instead of smallcaps if specified in the options
\ifkspths@tocchapterentriesbold
   \renewcommand{\cftchappresnum}{\normalfont\bfseries}%
   \renewcommand{\cftchapfont}{%
\let\spacedlowsmallcapstemp\spacedlowsmallcaps%
\let\spacedlowsmallcaps\relax%
\normalfont\bfseries}%
   \renewcommand{\cftchapafterpnum}{\let\spacedlowsmallcaps\spacedlowsmallcapstemp}
   \renewcommand{\cftchappagefont}{\normalfont\bfseries}%
\fi