%
%  JSAI 農業情報学会大会発表要旨スタイルファイル
%     堀本　正文 <horimoto.masafumi.470@s.kyushu-u.ac.jp>
%     1st  Mar. 2025
%     19th Mar. 2026
%
%  pLaTeX / LuaLaTeX 両対応の統合版
%  使用するエンジンを自動判別し、適切な日本語処理に切り替える。
%
%  【main.tex の書き方】（両エンジン共通）
%    \documentclass{jsaishoshiki}    % オプション不要
%    ...
%    \begin{multicols}{2}            % オプション不要
%    ...
%    \end{multicols}
%
%  【Ubuntu でのインストール】
%    sudo apt install texlive-luatex texlive-lang-japanese \
%                     texlive-latex-extra texlive-science  \
%                     texlive-lang-cjk fonts-noto-cjk
%
%  【コンパイル手順】
%    pLaTeX:   rm -f main.aux; platex main.tex; dvipdfmx main.dvi
%    LuaLaTeX: lualatex main.tex
%
%  【Overleaf 設定】
%    Menu > Compiler > LuaLaTeX
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jsaishoshiki}[2026/03/19 JSAI shoshiki (pLaTeX/LuaLaTeX unified)]

% ----------------------------------------------------------------------
% エンジン判別
% ----------------------------------------------------------------------
\RequirePackage{iftex}

\newif\if@jsai@luatex
\newif\if@jsai@ptex
\ifluatex
  \@jsai@luatextrue
\else\ifptex
  \@jsai@ptextrue
\else
  \ClassError{jsaishoshiki}%
    {This class requires pLaTeX or LuaLaTeX}%
    {Compile with `platex` or `lualatex`.}%
\fi\fi

% ----------------------------------------------------------------------
% pLaTeX のときは dvipdfmx をグローバルドライバとして指定
% （これにより main.tex で \documentclass[dvipdfmx]{jsaishoshiki} と書く必要がなくなる）
% ----------------------------------------------------------------------
\if@jsai@ptex
  \PassOptionsToPackage{dvipdfmx}{graphicx}
  \PassOptionsToPackage{dvipdfmx}{xcolor}
  \PassOptionsToPackage{dvipdfmx}{hyperref}
\fi

% ----------------------------------------------------------------------
% ベースクラス
% ----------------------------------------------------------------------
\if@jsai@ptex
  \LoadClass{jarticle}
\else
  \LoadClass{article}
\fi

% ----------------------------------------------------------------------
% 日本語処理（エンジン別）
% ----------------------------------------------------------------------
\if@jsai@luatex
  \RequirePackage[noto-otf,scale=1.0]{luatexja-preset}
  \AtBeginDocument{%
    \setlength{\parindent}{1\zw}%
    \ltjsetparameter{xkanjiskip=0pt, kanjiskip=0pt}%
    \mcfamily
    % 段組内で section 前のカラム破断ペナルティを下げる
    \clubpenalty=0
    \widowpenalty=0
    \displaywidowpenalty=0
    \interlinepenalty=0
    \predisplaypenalty=0
  }
  \renewcommand{\kanjifamilydefault}{\mcdefault}
  \newcommand{\minfamily}{\mcfamily}
  \newcommand{\gothicfont}{\sffamily\gtfamily}
  \renewcommand{\figurename}{図}
  \renewcommand{\tablename}{表}
\else
  \RequirePackage[noto-otc]{pxchfon}
  \renewcommand{\rmdefault}{min}
  \renewcommand{\sfdefault}{gt}
  \newcommand{\gothicfont}{\gtfamily}
\fi

% ----------------------------------------------------------------------
% 余白
% ----------------------------------------------------------------------
\if@jsai@luatex
  \RequirePackage[left=25mm, right=25mm, top=30mm, bottom=20mm]{geometry}
\else
  \RequirePackage[left=25truemm, right=25truemm, top=30truemm, bottom=30truemm]{geometry}
\fi

% ----------------------------------------------------------------------
% 共通パッケージ
% ----------------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{multicolrule}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{here}
\RequirePackage[labelsep=period]{caption}
\RequirePackage{float}
\RequirePackage{enumitem}
\RequirePackage{booktabs}
\RequirePackage{siunitx}
\RequirePackage{mwe}
\if@jsai@ptex
  \RequirePackage[utf8]{inputenc}
\fi

% ----------------------------------------------------------------------
% multicols のカラム間隔（エンジン別）
% main.tex 側で \begin{multicols}{2} と書くだけで適切な間隔になるよう設定
% ----------------------------------------------------------------------
\if@jsai@luatex
  \setlength{\columnsep}{10mm}
\else
  \setlength{\columnsep}{30pt}
\fi

% ----------------------------------------------------------------------
% 本文フォントサイズ
% ----------------------------------------------------------------------
\renewcommand{\normalsize}{\fontsize{9pt}{13pt}\selectfont}

% ----------------------------------------------------------------------
% タイトル
% ----------------------------------------------------------------------
\if@jsai@luatex
  \renewcommand{\maketitle}{%
    \begin{center}
      {\fontsize{15}{18}\selectfont\gothicfont\bfseries \@title \par}
      \vspace{9pt}
      {\fontsize{13}{16}\selectfont\mcfamily \@author \par}
      \vspace{9pt}
      {\fontsize{9}{11}\selectfont\mcfamily \@affiliation \par}
    \end{center}
    \mcfamily
  }
\else
  \renewcommand{\maketitle}{%
    \begin{center}
      {\fontsize{15}{18}\selectfont\sffamily\bfseries\gtfamily \@title \par}
      \vspace{9pt}
      {\fontsize{13}{16}\selectfont \@author \par}
      \vspace{9pt}
      {\fontsize{9}{11}\selectfont \@affiliation \par}
    \end{center}
  }
\fi

% ----------------------------------------------------------------------
% 要旨
% ----------------------------------------------------------------------
\newcommand{\abstractbegin}{\noindent\rule{\textwidth}{0.4pt}\vspace{2mm}}
\newcommand{\abstractend}{\par\vspace{0mm}\noindent\rule{\textwidth}{0.4pt}}

\renewcommand{\abstractname}{要旨}
\if@jsai@luatex
  \renewenvironment{abstract}{%
    \abstractbegin
    {\fontsize{11}{9}\selectfont\gothicfont\bfseries\par\noindent\abstractname\par}%
    \fontsize{9}{11}\selectfont\mcfamily
  }{%
    \abstractend
    \mcfamily
  }
\else
  \renewenvironment{abstract}{%
    \abstractbegin
    {\fontsize{11}{9}\selectfont\bfseries\par\noindent\abstractname\par}%
    \fontsize{9}{12}\selectfont
  }{%
    \abstractend
  }
\fi

% ----------------------------------------------------------------------
% 引用文献
% ----------------------------------------------------------------------
\if@jsai@luatex
  \newenvironment{references}{%
    \fontsize{8pt}{9pt}\selectfont\mcfamily
  }{%
    \normalsize\mcfamily
  }
\else
  \newenvironment{references}{%
    \fontsize{8pt}{9pt}\selectfont\fontfamily{min}
  }{%
    \normalsize\fontfamily{min}
  }
\fi

% ----------------------------------------------------------------------
% キーワード
% ----------------------------------------------------------------------
\if@jsai@luatex
  \newcommand{\keywords}[1]{%
    {\fontsize{11}{13}\selectfont\gothicfont\bfseries キーワード\par}%
    {\fontsize{9}{11}\selectfont\mcfamily #1}%
    \par\mcfamily
  }
\else
  \newcommand{\keywords}[1]{%
    \fontsize{11}{13}\textbf{キーワード}\par
    {\fontsize{9}{11}\selectfont #1}%
  }
\fi

% ----------------------------------------------------------------------
% 見出し
% ----------------------------------------------------------------------
\if@jsai@luatex
  \titleformat{\section}
    {\normalfont\fontsize{11}{13}\selectfont\gothicfont\bfseries}
    {}{0em}{}[\mcfamily]
  \titleformat{\subsection}
    {\normalfont\fontsize{9}{0}\selectfont\gothicfont\bfseries}
    {}{1em}{}[\mcfamily]
\else
  \titleformat{\section}
    {\normalfont\fontsize{11}{13}\selectfont\sffamily\bfseries}
    {}{0em}{}
  \titleformat{\subsection}
    {\normalfont\fontsize{9}{0}\selectfont\sffamily\bfseries}
    {}{1em}{}
\fi
\titlespacing{\section}{0pt}{1em}{0pt}
\titlespacing{\subsection}{-1em}{3pt}{0pt}

% ----------------------------------------------------------------------
% キャプション・リスト・ページスタイル
% ----------------------------------------------------------------------
\captionsetup{font={footnotesize}, skip=2pt}
\setlist[itemize]{leftmargin=*,nosep,labelindent=0pt,labelsep=0.5em}
\setlist[enumerate]{leftmargin=*,nosep,labelindent=0pt,labelsep=0.5em}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{\thepage}

% ----------------------------------------------------------------------
% カスタムコマンド
% ----------------------------------------------------------------------
\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\newcommand{\supscript}[1]{\textsuperscript{#1}}

\if@jsai@luatex
  \newcommand{\timesnum}[1]{{\rmfamily #1}}
  \newcommand{\UECS}{{\gothicfont\bfseries UECS}}
\else
  \newcommand{\timesnum}[1]{{\timesroman #1}}
  \newcommand{\UECS}{{\usefont{T1}{cmss}{bx}{n}UECS}}
\fi

% ----------------------------------------------------------------------
% captionパッケージの設定
% ----------------------------------------------------------------------
\DeclareCaptionOption{jsaishoshiki}{
  \caption@setdefaults{jsaishoshiki}{
    figureposition=bottom,
    tableposition=top,
    font=footnotesize
  }
}

\setlength{\parskip}{0pt}
\pagestyle{empty}
