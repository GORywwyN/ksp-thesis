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
   \PackageWarning{ksp-thesis}{You have not selected a page layout, the default option 'report' will be used.}
   \kspths@setlayout@report%
}


%%% ===========================================================================
%%% OPTION DECLARATION AND PROCESSING
%%% ===========================================================================
\RequirePackage{xkeyval}
%%% set layout according to document stage
\define@choicekey*+{kspths}{layout}[\val\nr]{draft,official,report,17x24}{%
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
   \PackageWarning{ksp-thesis}{Value '#1' is unknown for key 'layout' and will be ignored.}
}

%%% pass unknown options on to the base class
\DeclareOptionX*{%
   \PassOptionsToClass{\CurrentOption}{scrbook}%
}
%%% process options
\ProcessOptionsX<kspths>\relax

%%% ===========================================================================
%%% LOAD BASE CLASS <scrbook>
%%% =========================================================================== 
\LoadClass{scrbook}
\RequirePackage{scrpage2}  % change header and footer

%%% ===========================================================================
%%% MAIN DECLARATIONS
%%% ===========================================================================
%%% <classicthesis> for layout, font and typography settings
%%% ---------------------------------------------------------------------------
\PassOptionsToPackage{dottedtoc}{classicthesis} % sets pagenumbers flushed right in the table of contents
\RequirePackage{classicthesis}
%%% reset page and typearea settings according to KSP requirements
%%% ---------------------------------------------------------------------------
\kspths@setlayout
\recalctypearea