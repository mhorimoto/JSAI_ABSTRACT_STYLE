\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jsaishoshiki}
\LoadClass{article}

% -------------------------------------------------------
% LuaLaTeX + luatexja
% -------------------------------------------------------
\usepackage[noto-otf,scale=1.0]{luatexja-preset}

\AtBeginDocument{%
  \setlength{\parindent}{1\zw}%
  \ltjsetparameter{xkanjiskip=0pt, kanjiskip=0pt}%
  \mcfamily  % ドキュメント開始時に和文を明朝に固定
  % 段組内で section 前のカラム破断ペナルティを下げる
  \clubpenalty=0
  \widowpenalty=0
  \displaywidowpenalty=0
  \interlinepenalty=0
  \predisplaypenalty=0
}

\renewcommand{\kanjifamilydefault}{\mcdefault}

% 欧文+和文を同時にゴシックにするコマンド
\newcommand{\gothicfont}{\sffamily\gtfamily}
% pLaTeX 互換
\newcommand{\minfamily}{\mcfamily}

\renewcommand{\figurename}{図}
\renewcommand{\tablename}{表}

% -------------------------------------------------------
\usepackage[left=25mm, right=25mm, top=30mm, bottom=20mm]{geometry}
\usepackage{amsmath}
\usepackage{graphicx}
\usepackage{multicol}
\usepackage{multicolrule}
\usepackage{titlesec}
\usepackage{fancyhdr}
\usepackage{here}
\usepackage[labelsep=period]{caption}
\usepackage{float}
\usepackage{enumitem}
\usepackage{booktabs}
\usepackage{siunitx}
\usepackage{mwe}

% -------------------------------------------------------
\renewcommand{\normalsize}{\fontsize{9pt}{13pt}\selectfont}

% -------------------------------------------------------
% タイトル（ゴシック）
% -------------------------------------------------------
\renewcommand{\maketitle}{
  \begin{center}
    {\fontsize{15}{18}\selectfont\gothicfont\bfseries \@title \par}
    \vspace{9pt}
    {\fontsize{13}{16}\selectfont\mcfamily \@author \par}
    \vspace{9pt}
    {\fontsize{9}{11}\selectfont\mcfamily \@affiliation \par}
  \end{center}
  \mcfamily  % タイトルブロック後に明朝に戻す
}

% -------------------------------------------------------
% 要旨
% -------------------------------------------------------
\newcommand{\abstractbegin}{\noindent\rule{\textwidth}{0.4pt}\vspace{2mm}}
\newcommand{\abstractend}{\par\vspace{0mm}\noindent\rule{\textwidth}{0.4pt}}

\renewcommand{\abstractname}{要旨}
\renewenvironment{abstract}{%
  \abstractbegin
  {\fontsize{11}{9}\selectfont\gothicfont\bfseries\par\noindent\abstractname\par}%
  \fontsize{9}{11}\selectfont\mcfamily
}{%
  \abstractend
  \mcfamily
}

% -------------------------------------------------------
% 引用文献
% -------------------------------------------------------
\newenvironment{references}{%
  \fontsize{8pt}{9pt}\selectfont\mcfamily
}{%
  \normalsize\mcfamily
}

% -------------------------------------------------------
% キーワード
% -------------------------------------------------------
\newcommand{\keywords}[1]{%
  {\fontsize{11}{13}\selectfont\gothicfont\bfseries キーワード\par}%
  {\fontsize{9}{11}\selectfont\mcfamily #1}%
  \par\mcfamily  % キーワード後に明朝に戻す
}

% -------------------------------------------------------
% 見出し（ゴシック、after-codeで明朝に戻す）
% -------------------------------------------------------
\titleformat{\section}
  {\normalfont\fontsize{11}{13}\selectfont\gothicfont\bfseries}
  {}{0em}{}[\mcfamily]   % ← after-code: 見出し後に明朝に戻す
\titlespacing{\section}{0pt}{1em}{0pt}

\titleformat{\subsection}
  {\normalfont\fontsize{9}{0}\selectfont\gothicfont\bfseries}
  {}{1em}{}[\mcfamily]   % ← after-code: 見出し後に明朝に戻す
\titlespacing{\subsection}{-1em}{3pt}{0pt}

% -------------------------------------------------------
\captionsetup{font={footnotesize}, skip=2pt}
\setlist[itemize]{leftmargin=*,nosep,labelindent=0pt,labelsep=0.5em}
\setlist[enumerate]{leftmargin=*,nosep,labelindent=0pt,labelsep=0.5em}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{\thepage}

\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\newcommand{\timesnum}[1]{{\rmfamily #1}}
\newcommand{\supscript}[1]{\textsuperscript{#1}}
\newcommand{\UECS}{{\gothicfont\bfseries UECS}}

\DeclareCaptionOption{jsaishoshiki}{
  \caption@setdefaults{jsaishoshiki}{
    figureposition=bottom, tableposition=top, font=footnotesize
  }
}

\setlength{\parskip}{0pt}
\pagestyle{empty}
