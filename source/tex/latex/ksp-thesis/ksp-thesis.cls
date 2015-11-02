%%% ===========================================================================
%%% <ksp-thesis>
%%% A LaTeX class for theses published with KIT Scientific Publishing
%%% ===========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ksp-thesis}[2015/11/02 LaTeX class for theses published with KIT Scientific Publishing]

%%% ===========================================================================
%%% OPTION DECLARATION AND PROCESSING
%%% ===========================================================================
%%% pass unknown options on to the base class
\DeclareOption*{%
   \PassOptionsToClass{\CurrentOption}{scrbook}%
}
%%% process options
\ProcessOptions\relax

%%% ===========================================================================
%%% LOAD BASE CLASS <scrbook>
%%% =========================================================================== 
\LoadClass{scrbook}