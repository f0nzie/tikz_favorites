% MIT License
%
% Copyright (c) 2018 Jelle Spijker
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{draftdrawing}[2017/09/19 v0.1 Draft drawing]
\RequirePackage{xkeyval}
\usepackage{graphicx}
\usepackage{calc}

\newlength{\dd@border}
\newlength{\dd@paperheight}
\newlength{\dd@paperwidth}
\newlength{\dd@linewidthborder}
\newlength{\dd@linewidth}
\setlength{\dd@border}{5mm}
\setlength{\dd@paperheight}{420mm}
\setlength{\dd@paperwidth}{297mm}
\setlength{\dd@linewidth}{0.35mm}
\setlength{\dd@linewidthborder}{0.75mm}
\newcommand{\paperformat}[1]{\def\@paperformat{#1}}
\paperformat{A4}

\DeclareOptionX{linewidth}
{\setlength{\dd@linewidth}{#1}}
\DeclareOptionX{linewidthborder}
{\setlength{\dd@linewidthborder}{#1}}
\DeclareOptionX{a4paper}
{\setlength{\dd@paperheight}{297mm}%
 \setlength{\dd@paperwidth}{210mm}
 \paperformat{A4}}
\DeclareOptionX{a3paper}
{\setlength{\dd@paperheight}{420mm}%
 \setlength{\dd@paperwidth}{297mm}
 \paperformat{A3}}
\DeclareOptionX{a2paper}
{\setlength{\dd@paperheight}{594mm}%
 \setlength{\dd@paperwidth}{420mm}
 \paperformat{A2}}
\DeclareOptionX{a1paper}
{\setlength{\dd@paperheight}{841mm}%
 \setlength{\dd@paperwidth}{594mm}
 \paperformat{A1}}
\DeclareOptionX{a0paper}
{\setlength{\dd@paperheight}{1189mm}%
 \setlength{\dd@paperwidth}{841mm}
 \paperformat{A0}}
\DeclareOptionX{landscape}
{\setlength{\@tempdima}   {\dd@paperheight}%
 \setlength{\dd@paperheight} {\dd@paperwidth}%
 \setlength{\dd@paperwidth}  {\@tempdima}}
\DeclareOptionX{border}[5mm]{\setlength{\dd@border}{#1}}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{standalone}}
\ProcessOptionsX\relax

\LoadClass[tikz,border=\dd@border]{standalone}
\usetikzlibrary{calc, positioning,matrix,fit}
\usetikzlibrary{circuits}
\usetikzlibrary{circuits.pid.ISO14617}

\newcommand\leftborder{-0.5\dd@paperwidth+\dd@border}
\newcommand\rightborder{0.5\dd@paperwidth-\dd@border}
\newcommand\topborder{0.5\dd@paperheight-\dd@border}
\newcommand\bottomborder{-0.5\dd@paperheight+\dd@border}

\def\@titleblocklefttop{\rightborder-180mm,\bottomborder+37mm}

\newcommand{\designedby}[1]{\def\@designedby{#1}}
\newcommand{\checkedby}[1]{\def\@checkedby{#1}}
\newcommand{\approvedby}[1]{\def\@approvedby{#1}}
\newcommand{\draftnumber}[1]{\def\@draftnumber{#1}}
\newcommand{\revision}[1]{\def\@revision{#1}}
\newcommand{\remarks}[1]{\def\@remarks{#1}}
\newcommand{\logo}[1]{\def\@logo{#1}}
\newcommand{\scale}[1]{\def\@scale{#1}}
\newcommand{\unit}[1]{\def\@unit{#1}}
\newcommand{\draftdate}[1]{\def\@draftdate{#1}}

\renewcommand{\title}[1]{\def\@title{#1}}

\tikzset{
 titleblockcell/.style={
   minimum height=9mm,
   align=left,
   inner sep=0mm,
   draw
  }
}

\tikzset{
 titleblockformat/.pic = {
   \node [titleblockcell, anchor=north west, align=center,yshift=0.5\dd@linewidthborder,minimum height=37mm, inner sep=1pt] (logocell) at (0mm,0mm) {\includegraphics[width=37mm]{\@logo}};
   \node [titleblockcell, anchor=south west, minimum width=100mm, minimum height=10mm,xshift=-\dd@linewidthborder] (titlecell) at (logocell.south east) {\Huge \textbf{\@title}};
   \node [titleblockcell, anchor=south east, align=center, minimum height=10mm, minimum width=12mm, yshift=-0.5\dd@linewidthborder, xshift=0.5\dd@linewidthborder] (paperformatcell) at (180mm,-37mm) {\Huge \@paperformat};
   \node [titleblockcell, minimum height=10mm, anchor=north west, xshift=-\dd@linewidthborder, minimum width=30mm+\dd@linewidthborder, text width=30mm-2\dd@linewidthborder] (draftnumbercell) at (titlecell.north east) {\small{Number:}\\ \footnotesize{\@draftnumber - \@revision}};
   \node [titleblockcell, anchor=south west, minimum width=50mm,yshift=-\dd@linewidthborder, text width=50mm-2\dd@linewidthborder] (approvedbycell) at (titlecell.north west) {\small Approved by: \@approvedby};
   \node [titleblockcell, anchor=south west, minimum width=50mm,yshift=-\dd@linewidthborder, text width=50mm-2\dd@linewidthborder] (checkedbycell) at (approvedbycell.north west) {\small Checked by: \@checkedby};
   \node [titleblockcell, anchor=south west, minimum width=50mm,yshift=-\dd@linewidthborder, text width=50mm-2\dd@linewidthborder] (designedbycell) at (checkedbycell.north west) {\small Designed by: \@designedby};
   \node [titleblockcell, anchor=south west, minimum width=50mm,xshift=-\dd@linewidthborder, text width=50mm-2\dd@linewidthborder] (datecell) at (approvedbycell.south east) {\small Date: \@draftdate};
   \node [titleblockcell, anchor=south west, minimum width=50mm,xshift=-\dd@linewidthborder, text width=50mm-2\dd@linewidthborder] (unitcell) at (checkedbycell.south east) {\small Unit: \@unit};
   \node [titleblockcell, anchor=south west, minimum width=50mm,xshift=-\dd@linewidthborder, text width=50mm-2\dd@linewidthborder] (scalecell) at (designedbycell.south east) {\small Scale: \@scale};
   \node [titleblockcell, anchor=north west, minimum width=42mm+\dd@linewidthborder,xshift=-\dd@linewidthborder, minimum height=27mm] (remarkscell) at (scalecell.north east) {};
   \node [titleblockcell, anchor=north west, align=left, draw=none, xshift=\dd@linewidthborder] (remarkscelltext) at (remarkscell.north west) {\small{remarks:}\\ \footnotesize{\@remarks}};
  };
}


\newenvironment{tikzdraft}[1][]
{
 \begin{tikzpicture}[circuit pid ISO14617, #1]
  \pgfsetlinewidth{\dd@linewidthborder}
  \draw (\leftborder,\topborder) to (\rightborder,\topborder)
  to (\rightborder,\bottomborder)
  to (\leftborder, \bottomborder)
  to (\leftborder,\topborder);
  \pic at (\rightborder-180mm,\bottomborder+37mm) {titleblockformat};
  \pgfsetlinewidth{\dd@linewidth}
  }
  {
 \end{tikzpicture}
}
