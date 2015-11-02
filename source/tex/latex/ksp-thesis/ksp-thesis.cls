%%% ===========================================================================
%%% <ksp-thesis>
%%% A LaTeX class for theses published with KIT Scientific Publishing
%%% ===========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ksp-thesis}[2015/11/02 LaTeX class for theses published with KIT Scientific Publishing]

%%% ===========================================================================
%%% OPTION DECLARATION AND PROCESSING
%%% ===========================================================================
\RequirePackage{xkeyval}
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