
%%%%%%%% Identification

\RequirePackage{expl3}
\ProvidesExplPackage {myhw} {2020-01-26} {0.0.1} {
  A custom class for my homework
}

\LoadClass{article}

%%%%%%%% Preliminary

\RequirePackage { xparse }
\RequirePackage { etoolbox }

%%%%%%%% Options

\newtoggle { ref }
\newtoggle{ code }

\DeclareOption { ref } {
  \toggletrue { ref }
}
\DeclareOption { code } {
  \toggletrue { code }
}
\ProcessOptions

%%%%%%%% Declarations

\ProvideDocumentCommand \csdefd { m }
{
    \ifcsdef{#1}{command~#1~is~defined.}{command~#1~is~not~defined.}
}
 

% Layout

\RequirePackage { geometry }
\RequirePackage { fancyhdr }
\RequirePackage { parskip }
\RequirePackage { enumitem }

\geometry {
  a4paper,
  top=2cm,
  bottom=1.5cm,
  left=2cm,
  right=2cm,
  heightrounded
}


\pagestyle { fancy }
\fancyhf {}
\fancyhead [ L ] { \@author }
\fancyhead [ C ] { \@title }
\fancyhead [ R ] { \@date }


% Math

\RequirePackage { mathtools }
\RequirePackage { amssymb }
\RequirePackage { amsthm }
\RequirePackage { cases }
\RequirePackage { mymathdefs }

% Figures, Quotes and Code

\RequirePackage { booktabs }
\RequirePackage { graphicx }
\RequirePackage { subcaption }
\iftoggle { code } {
  \RequirePackage { minted }
} {}
\RequirePackage { csquotes }
\RequirePackage { tikz }

% References

\RequirePackage [ hidelinks, colorlinks=true, linkcolor=blue ] { hyperref }
\iftoggle { ref } {
  \RequirePackage { biblatex }
  \RequirePackage { tocbibind }
} {}

% Misc

\RequirePackage { lipsum }
\RequirePackage { todonotes }
