
%%%%%%%% Identification

\RequirePackage{expl3}
\ProvidesExplPackage {mynotes} {2020-01-26} {0.0.1} {
  A custom class for my notetaking
}

%%%%%%%% Preliminary

\RequirePackage { xparse }
\RequirePackage { etoolbox }

%%%%%%%% Options

\newtoggle { ref }
\newtoggle { code }
\newtoggle { report }

\DeclareOption { ref } {
  \toggletrue { ref }
}
\DeclareOption { code } {
  \toggletrue { code }
}
\DeclareOption { report } {
  \toggletrue { report }
}

\ProcessOptions

%%%%%%%% Declarations

\iftoggle { report } {
  \LoadClass { report }
} {
  \LoadClass { article }
}

\ProvideDocumentCommand \csdefd { m }
{
    \ifcsdef{#1}{command~#1~is~defined.}{command~#1~is~not~defined.}
}


% Layout

\RequirePackage { geometry }
\RequirePackage { fancyhdr }
\RequirePackage { marginnote }
\RequirePackage { parskip }
\RequirePackage { enumitem }

\geometry {
  a4paper,
  top=2cm,
  bottom=1.5cm,
  outer=5.5cm,
  inner=2cm,
  heightrounded,
  marginparwidth=3.5cm,
  marginparsep=1cm,
}


\pagestyle { fancy }
\fancyhf {}
\fancyhead [ L ] { \leftmark }
\fancyhead [ R ] { \thepage }


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
