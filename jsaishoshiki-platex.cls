%
%  JSAI 農業情報学会大会発表要旨スタイルファイル
%     堀本　正文 <horimoto.masafumi.470@s.kyushu-u.ac.jp>
%     1st  Mar. 2025
%     19th Mar. 2026
%
%  UbuntuでpLaTeXを使うためのインストール
%      sudo apt install texlive-science
%      sudo apt install texlive-lang-japanese
%      sudo apt install texlive-latex-extra
%      sudo apt install texlive-luatex
%      sudo apt install texlive-lang-cjk
%      sudo apt install texlive-latex-extra
%      sudo apt install fonts-noto-cjk
%
%  PDF化するまでのコンパイル手順
%  $ rm main.aux; platex main.tex; dvipdfmx main.dvi
%

\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jsaishoshiki}
\LoadClass{jarticle}

% 余白の設定
\usepackage[left=25truemm, right=25truemm, top=30truemm, bottom=30truemm]{geometry} % 左右マージンを25mmに設定

% パッケージの読み込み
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
\usepackage[utf8]{inputenc}
\usepackage{booktabs}
\usepackage{siunitx}
\usepackage{mwe}
\usepackage[noto-otc]{pxchfon}

% フォントの設定
\renewcommand{\rmdefault}{min} % 明朝体をデフォルトに設定
\renewcommand{\sfdefault}{gt} % ゴシック体をデフォルトに設定
\renewcommand{\normalsize}{\fontsize{9pt}{13pt}\selectfont} % 本文のフォントサイズを9ptに設定

% タイトルの設定
\renewcommand{\maketitle}{
  \begin{center}
    {\fontsize{15}{18}\selectfont\sffamily\bfseries\gtfamily \@title \par}
    \vspace{9pt}
    {\fontsize{13}{16}\selectfont \@author \par}
    \vspace{9pt}
    {\fontsize{9}{11}\selectfont \@affiliation \par}
  \end{center}
}

% 要旨の開始と終了を定義
\newcommand{\abstractbegin}{\noindent\rule{\textwidth}{0.4pt}\vspace{2mm}}
\newcommand{\abstractend}{\par \vspace{0mm}\noindent\rule{\textwidth}{0.4pt}}

% 要旨の設定
\renewcommand{\abstractname}{要旨} % \renewcommandを使用
\renewenvironment{abstract}{
  \abstractbegin
    {\fontsize{11}{9} \selectfont\bfseries \par \noindent \abstractname \par}
    {\fontsize{9}{9}\selectfont}
}{
  \abstractend
}

% 引用文献
\newenvironment{references}{%
  \fontsize{8pt}{9pt}\selectfont\fontfamily{min} % 8pt, 行間9pt, 明朝体
}{%
  \normalsize\fontfamily{min} % 通常サイズに戻す
}

% キーワードの設定
\newcommand{\keywords}[1]{\fontsize{11}{13}\textbf{キーワード}\par {\fontsize{9}{11}\selectfont #1}}

%% 見出しの設定

\titleformat{\section}
  %{\normalfont\fontsize{11}{0}\selectfont\bfseries} % フォントサイズ、太字、
  {\normalfont\fontsize{11}{13}\selectfont\sffamily\bfseries} % ゴシック・太字・サイズ指定、
  {} % 番号を削除
  {0em} % 番号と見出しの間のスペースを0emに設定
  {} % 見出しのテキストの前に何も追加しない
\titlespacing{\section}{0pt}{1em}{0pt} % 見出しの上に1行のスペース,下のスペースなし

\titleformat{\subsection}
  {\normalfont\fontsize{9}{0}\selectfont\sffamily\bfseries}
  {}{1em}{}
\titlespacing{\subsection}{-1em}{3pt}{0pt} % 見出しの左(インデント無し)上(3pt)下(0pt)のスペースを追加
  
% 図表のキャプション設定
\captionsetup{font={footnotesize}, skip=2pt}

\setlist[itemize]{
  leftmargin=*,    % 左側の余白をラベル幅に合わせる（インデント消去）
  nosep,           % 上下および項目間の余白（vspace）をすべて0にする
  labelindent=0pt, % ラベル自体のインデントを0にする
  labelsep=0.5em   % ドットと本文の間の間隔
}
\setlist[enumerate]{
  leftmargin=*,    % 左側の余白をラベル幅に合わせる（インデント消去）
  nosep,           % 上下および項目間の余白（vspace）をすべて0にする
  labelindent=0pt, % ラベル自体のインデントを0にする
  labelsep=0.5em   % ドットと本文の間の間隔
}

% ページスタイルの設定
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{\thepage}

% カスタムコマンド
\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}} % \@affiliationを定義
\newcommand{\timesnum}[1]{{\timesroman #1}} % Times New Romanの数字
\newcommand{\supscript}[1]{\textsuperscript{#1}} % 上付き文字コマンドを追加
% UECSをゴシックにするための専用コマンド
\newcommand{\UECS}{{\usefont{T1}{cmss}{bx}{n}UECS}}

% captionパッケージの設定
\DeclareCaptionOption{jsaishoshiki}{
  \caption@setdefaults{jsaishoshiki}{
    figureposition=bottom,
    tableposition=top,
    font=footnotesize
  }
}

\setlength{\parskip}{0pt}
\pagestyle{empty}

