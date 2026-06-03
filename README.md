# JSAI 農業情報学会発表要旨スタイルファイル

作者：堀本　正文 　<horimoto.masafumi.470@s.kyushu-u.ac.jp>

## 概要
このスタイルファイルは、JSAI 農業情報学会大会発表要旨をLaTeXで記述する際に使うことを目的としたものです。  
A4版で2ページを前提にしています。（実際は何ページでも書けます）

## インストール

作者の個人的環境でのインストール方法を記します。各自の環境に合せてインストールしてください。  
私は、Ubuntu 22.04-LTS と Ubuntu 24.04-LTS で使っています。

### LaTeXのインストール
```bash
sudo apt update
sudo apt install -y texlive-full
```
非常に大きくなりますが、アレコレ悩まないでLaTeX Lifeを楽しめます。  
それに、他の学会の要旨や論文記述もLaTeXで行う場合も気にする事が減ります。

### パッケージ群
上のインストールでほぼ基本的なことはできます。  
でも、基本的じゃないことでエラーが出てしまうこともありました。  
そこで以下のパッケージ群もインストールしましょう。

```bash
sudo apt install texlive-science
sudo apt install texlive-lang-japanese
sudo apt install texlive-latex-extra
sudo apt install texlive-luatex
sudo apt install texlive-lang-cjk
sudo apt install texlive-latex-extra
sudo apt install fonts-noto-cjk
```

### このスタイルファイルをインストール
インストールするディレクトリには、3種の方法があります。
どこにインストールされているかを調べるコマンドは
```bash
$ kpsewhich jarticle.cls
/usr/share/texlive/texmf-dist/tex/platex/base/jarticle.cls
```

#### (1) この要旨だけで使う
texファイルの存在する同じディレクトリにjsaishoshiki.clsファルを置いておきます。  

#### (2) 自分の環境だけで使う
自分のホームディレクトリ配下のサブディレクトリに配置します。

```bash
~/texmf/tex/latex/jsaishoshiki.cls
```

#### (3) システム全体で使う
システムで約束されているディレクトリに配置します。

```bash
sudo cp jsaishoshiki.cls /usr/share/texlive/texmf-dist/tex/latex/
sudo mktexlsr
```
## 応用
### make による一括コンパイル
makeコマンドにより必要なファイルの変更が有った際に的確なLaTeXコンパイルをさせる。  
```makefile
all: main.pdf

main.pdf: main.dvi
	dvipdfmx main.dvi

main.dvi: main.tex jsaishoshiki.cls 
	platex main.tex
	platex main.tex

clean:
	@rm main.dvi

dist:
	zip -9 ../JSAI_Template.zip main.tex jsaishoshiki.cls Makefile README.md LICENSE.txt
```
2回コンパイルしているのは \ref{} を使用した場合の保険です。

## ライセンス
MIT License

## 更新履歴
* 2025/03/01: [初版]
* 2026/03/19: [字下げ、行間微調整]
* 2026/06/03: [公開用更新]

