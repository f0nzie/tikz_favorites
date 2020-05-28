---
title: "Tikz Gallery"
author: "Alfonso R. Reyes"
output:
  html_document:
    css: style.css
    keep_md: true
    toc: true
    number_sections: false
---

Implementing a tag system based of identifiers that are included in the filename. 

* Characters that pass this script: `@`, `!`, `=`, `+`.
* Character that do not pass: `#`.

**Selecting `=`.**









This is my collection, or gallery, of Tikz Art.  

There are 76 Tikz figures in this gallery. 

These are coming from ...


This repository is maintained in to Git Version Control and is hosted on `___` .


The figures are sorted by filename.


Some useful tutorials or galleries:

  * <https://tobiw.de/en/teotm/tikz-adventskalender>.
  * <http://math.et.info.free.fr/TikZ/bdd/TikZ-Impatient.pdf>.
  * <http://www.mat.ufpb.br/lenimar/introtikz.pdf>.
  

Source: https://github.com/walmes/Tikz
Web: http://leg.ufpr.br/~walmes/Tikz/  


****

![](./src/3d-cylinder-planes+3d.png)

  * [3d-cylinder-planes+3d.tex](https://github.com/walmes/Tikz/blob/master/src/3d-cylinder-planes+3d.pgf)

```tex
\documentclass[landscape]{article}
\usepackage{tikz}

%%%<
\usepackage{verbatim}
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{5pt}%
%%%>

\usepackage{tikz,tikz-3dplot}

\begin{document}

\begin{figure}
\centering
\tdplotsetmaincoords{70}{120}

\begin{tikzpicture}[tdplot_main_coords][scale=0.75]
	\tikzstyle{every node}=[font=\small]
	\draw[thick,-latex] (0,0,0) -- (6,0,0) node[anchor=north east]{$x$};
	\draw[thick,-latex] (0,0,0) -- (0,6,0) node[anchor=north west]{$y$};
	\draw[thick,-latex] (0,0,0) -- (0,0,6) node[anchor=south]{$z$};
	\draw [thick](0,0,0) circle (3);
	\draw [thick](0,0,4) circle (3);
	\draw [thick](1.9,-2.35,0) -- (1.9,-2.35,4) node[midway, left]{$r=r_1$ surface};
	\draw [thick](-1.9,2.35,0) -- (-1.9,2.35,4);
	\filldraw[fill=orange, nearly transparent] (-4,-4,4) -- (4,-4,4) --  (4,5,4) -- (-4,5,4) -- (-4,-4,4);
	\filldraw[fill=blue, nearly transparent] (0,0,4) -- (5.2,6,4) --  (5.2,6,0) -- (0,0,0) -- (0,0,4);
	\filldraw [color=blue](2,2.25,4) circle (0.075cm) ;
	\draw (-4,5,4) node[anchor=south]{$z=z_1$ plane};
	\draw (5.2,6,0) node[anchor=south west]{$\phi=\phi_1$ plane};
	\node at (1.8,1,4)  { $P_1(r_1,\phi_1,z_1)$};
	\draw[ultra thick,-latex](2,2.25,4) -- (3,3.45,4) node[anchor=north] {$\mathbf{a}_r$};
	\draw[ultra thick,-latex](2,2.25,4) -- (1,2.5,4) node[anchor=north west] {$\mathbf{a}_\phi$};
	\draw[ultra thick,-latex](2,2.25,4) -- (2,2.25,4.75) node[anchor=north west] {$\mathbf{a}_z$};
	\draw [thick,->](4,0,0) arc (0:45:4 and 4.5);
	\draw (3.6,2,0) node[anchor=north] {$\phi_1$};
	\draw[ultra thick,-latex](0,0,0) -- (2,2.35,0);
	\draw (1,1,0) node[anchor=north] {$r_1$};
	\draw [ultra thick] (2,2.25,4)--(1.95,2.25,0);
	
	\draw[ultra thick](0.1,0,4) -- (-0.1,0,4) node[anchor=south west] {$z_1$};
\end{tikzpicture}
\end{figure}
\end{document}
```
****

![](./src/3d-seismic_focal_mechanism+3d+set+foreach+eng.png)

  * [3d-seismic_focal_mechanism+3d+set+foreach+eng.tex](https://github.com/walmes/Tikz/blob/master/src/3d-seismic_focal_mechanism+3d+set+foreach+eng.pgf)

```tex
% http://www.texample.net/media/tikz/examples/TEX/seismic-focal-mechanism-in-3d-view.tex
% Title: Seismic focal mechanism in 3D view.
% Author: Cyril Langlois
% Source:  Jacques Duma
% Site: http://math.et.info.free.fr/TikZ/index.html
%
% Adaptation for LaTeX of a figure proposed in P. Shearer's book 'Introduction
% to Seismology'.
%
% It shows the focal sphere with the fault plane and auxiliary plane (which can
% not be discriminate), limiting compression and dilatation quadrants, the first
% movement of the rock through the sphere, and the Pression and Tension axis.
%
% The figure is based on the sphere drawing's code proposed by J. Dumas in is
% book 'Tikz pour l'impatient', available online.

\documentclass[11pt]{article}
\usepackage{tikz}
\usepackage{tikz-3dplot}
%%%<
\usepackage{verbatim}
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{5pt}%
%%%>

\begin{comment}
:Title: Seismic focal mechanism in 3D view.
:Tags: 3D; Earth Sciences ; Geophysics; Seismology
:Author: Cyril Langlois
:Source: http://math.et.info.free.fr/TikZ/index.html

Adaptation for LaTeX of a figure proposed in P. Shearer's book 'Introduction to Seismology'. 

It shows the focal sphere with the fault plane and auxiliary plane (which can
not be discriminate), limiting compression and dilatation quadrants, the first
movement of the rock through the sphere, and the Pression and Tension axis.

The figure is based on the sphere drawing's code proposed by J. Dumas in is
book `Tikz pour l'impatient <http://math.et.info.free.fr/TikZ/>`_, available online.

\end{comment}

%%%%%%%%%%%
%% helper macros
%: Styles for XYZ-Coordinate Systems
%: isometric  South West : X , South East : Y , North : Z
\tikzset{isometricXYZ/.style={x={(-0.866cm,-0.5cm)}, y={(0.866cm,-0.5cm)}, z={(0cm,1cm)}}}

%: isometric South West : Z , South East : X , North : Y
\tikzset{isometricZXY/.style={x={(0.866cm,-0.5cm)}, y={(0cm,1cm)}, z={(-0.866cm,-0.5cm)}}}

%: isometric South West : Y , South East : Z , North : X
\tikzset{isometricYZX/.style={x={(0cm,1cm)}, y={(-0.866cm,-0.5cm)}, z={(0.866cm,-0.5cm)}}}

%% document-wide tikz options and styles
\begin{document}
\begin{tikzpicture} [scale=4, isometricZXY, line join=round,
        opacity=.75, text opacity=1.0,%
        >=latex,
        inner sep=0pt,%
        outer sep=2pt,%
    ]
    \def\h{5}

    \newcommand{\quadrant}[2]{
        \foreach \t in {#1} \foreach \f in {175,165,...,5}
            \draw [fill=#2]
                  ({sin(\f - \h)*cos(\t - \h)}, {sin(\f - \h)*sin(\t - \h)}, {cos(\f - \h)})
               -- ({sin(\f - \h)*cos(\t + \h)}, {sin(\f - \h)*sin(\t + \h)}, {cos(\f - \h)})
               -- ({sin(\f + \h)*cos(\t + \h)}, {sin(\f + \h)*sin(\t + \h)}, {cos(\f + \h)})
               -- ({sin(\f + \h)*cos(\t - \h)}, {sin(\f + \h)*sin(\t - \h)}, {cos(\f + \h)})
               -- cycle;
    }

    %Quadrants
    \quadrant{220,230,...,300}{black}
    \quadrant{-60,-50,...,20}{white}
    \quadrant{30,40,...,120}{black}
    \quadrant{130,140,...,210}{none}

    %Movement arrows
    \foreach \t in {225,235,...,295}
        \foreach \f in {50,40,...,0}
            \draw [red, opacity=1.0, ->, thick]
                ({sin(\f - \h)*cos(\t - \h)}, {sin(\f - \h)*sin(\t - \h)}, {cos(\f - \h)})
                -- ({(1 + 0.2*cos(90 - \f))*sin(\f - \h)*cos(\t - \h)},
                    {(1 + 0.2*cos(90 - \f))*sin(\f - \h)*sin(\t - \h)},
                    {(1 + 0.2*cos(90 - \f))*cos(\f - \h)});

    \foreach \t in {125,135,...,205}
        \foreach \f in {110,100,...,0}
            \draw [black, ->, thick]
                ({(1 + 0.2*cos(90 - \f))*sin(\f - \h)*cos(\t - \h)},
                 {(1 + 0.2*cos(90 - \f))*sin(\f - \h)*sin(\t - \h)},
                 {(1 + 0.2*cos(90 - \f))*cos(\f - \h)})
                -- ({sin(\f - \h)*cos(\t - \h)},{sin(\f - \h)*sin(\t - \h)},{cos(\f - \h)});
    \foreach \t in {35,45,...,115}
        \foreach \f in {130,120,...,0}
            \draw [red, opacity=1.0 ,->, thick]
                ({sin(\f - \h)*cos(\t - \h)}, {sin(\f - \h)*sin(\t - \h)}, {cos(\f - \h)})
                -- ({(1 + 0.2*cos(90 - \f))*sin(\f - \h)*cos(\t - \h)},
                    {(1 + 0.2*cos(90 - \f))*sin(\f - \h)*sin(\t - \h)},
                    {(1 + 0.2*cos(90 - \f))*cos(\f - \h)});

    \foreach \t in {-55,-45,...,25}
        \foreach \f in {130,120,...,0}
            \draw [black, ->, thick]
                ({(1 + 0.2*cos(90 - \f))*sin(\f - \h)*cos(\t - \h)},
                 {(1 + 0.2*cos(90 - \f))*sin(\f - \h)*sin(\t - \h)},
                 {(1 + 0.2*cos(90 - \f))*cos(\f - \h)})
              -- ({sin(\f - \h)*cos(\t - \h)},{sin(\f - \h)*sin(\t - \h)},{cos(\f - \h)});

    %Annotations
    \path ({1.5*sin(100)*cos(75)}, {1.5*sin(100)*sin(75)}, {1.5*cos(100)}) node [right] {Compression};
    \path ({1.5*sin(70)*cos(-15)}, {1.5*sin(70)*sin(-15)}, {1.5*cos(70)})  node [right] {Dilatation};
    \path ({1.25*sin(50)*cos(165)},{1.25*sin(50)*sin(165)},{1.25*cos(50)}) node [left]  {Dilatation};
    \path ({1.25*sin(30)*cos(255)},{1.25*sin(30)*sin(255)},{1.25*cos(30)}) node [left]  {Compression};

    %P and T axis
    \begin{scope}[ultra thick]
        \draw[->] ({1.75*sin(90)*cos(75)}, {1.75*sin(90)*sin(75)}, {1.75*cos(90)})
            -- ({2*sin(90)*cos(75)},{2*sin(90)*sin(75)},{2*cos(90)}) node [above] {T-axis};
        \draw[->] ({1.75*sin(90)*cos(255)},{1.75*sin(90)*sin(255)},{1.75*cos(90)})
            -- ({2*sin(90)*cos(255)},{2*sin(90)*sin(255)},{2*cos(90)}) node [below] {T-axis};
        \draw[<-] ({1.5*sin(90)*cos(-15)}, {1.5*sin(90)*sin(-15)}, {1.5*cos(90)})
            -- ({1.75*sin(90)*cos(-15)},{1.75*sin(90)*sin(-15)},{1.75*cos(90)}) node [right] {P-axis};
        \draw[<-] ({1.5*sin(90)*cos(165)}, {1.5*sin(90)*sin(165)}, {1.5*cos(90)})
            -- ({1.75*sin(90)*cos(165)},{1.75*sin(90)*sin(165)},{1.75*cos(90)}) node [left] {P-axis};
    \end{scope}

    % Label
    \node [anchor=north, yshift=-2mm] at (current bounding box.south)
        {Seismic focal mechanism and Pression-Tension axis.};
\end{tikzpicture}
\end{document}
```
****

![](./src/box_arrows+diagram.png)

  * [box_arrows+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/box_arrows+diagram.pgf)

```tex
% https://tex.stackexchange.com/a/52766/173708
\documentclass{standalone}
\usepackage{tikz}
\usetikzlibrary{shapes,positioning,arrows,calc}

\begin{document}

\begin{tikzpicture}[stack/.style={
  rectangle split, rectangle split parts=5, draw, anchor=center},
  myarrow/.style={single arrow, draw=none}]

\node [stack] (ini)  {$a=0$\nodepart{two}$b=10$%
   \nodepart{three}$c=100$\nodepart{four}$d=-10$\nodepart{five}$\cdots$};

\node [draw,rectangle,align=left,right=of ini,label=above:{Computer Program}] (mid)
  {instruction 0;\\ instruction 1;\\$\ldots$\\instruction $n$;};

\node [stack,right=of mid] (fin) {$a=10$\nodepart{two}$b=100$%
  \nodepart{three}$c=-10$\nodepart{four}$d=110$\nodepart{five}$\cdots$};

\node [above=of ini,anchor=north,align=left] {Initial values of\\variables};
\node [above=of fin,anchor=north,align=left] {Final values of\\variables};

\node [myarrow,draw,anchor=west] at ($(ini.east)+(2.5pt,0)$) {\phantom{te}} ;
\node [myarrow,draw,anchor=west] at ($(mid.east)+(2.5pt,0)$) {\phantom{te}} ;

\end{tikzpicture}

\end{document}
```
****

![](./src/colorized_equation+equation.png)

  * [colorized_equation+equation.tex](https://github.com/walmes/Tikz/blob/master/src/colorized_equation+equation.pgf)

```tex
% https://www.overleaf.com/read/cvmtqywqgvvw#/43203532/
% https://betterexplained.com/articles/colorized-math-equations/

% \documentclass{article}
\documentclass[preview]{standalone}
\usepackage[utf8]{inputenc}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{color}

\newcommand{\plain}{\color{black}}
\newcommand{\Frac}[2]{\genfrac{}{}{1pt}{}{#1}{#2}}	% thicker fraction line

\definecolor{c1}{RGB}{114,0,172}   % primary
\definecolor{c2}{RGB}{45,177,93}   % true
\definecolor{c3}{RGB}{251,0,29}    % false
\definecolor{c4}{RGB}{18,110,213}  % secondary
\definecolor{c5}{RGB}{255,160,109} % tertiary
\definecolor{c6}{RGB}{219,78,158}  % alt-primary 

\renewcommand{\familydefault}{\sfdefault}

\begin{document}
\begin{center}

\newcommand{\growth}{\color{c1}}
\newcommand{\unitQuantity}{\color{c2}}
\newcommand{\unitInterest}{\color{c3}}
\newcommand{\unitTime}{\color{c4}}
\newcommand{\perfectly}{\color{c5}}
\newcommand{\compounded}{\color{c6}}

$$\growth e
\plain =
\perfectly \lim_{n\to\infty}
\plain \left(
\unitQuantity 1 + \unitInterest \frac{1}{\compounded n}
\plain \right)
\unitTime^{1 \cdot \compounded n}
$$

\growth       The base for continuous growth
\plain        is
\\
\unitQuantity the unit quantity 
\unitInterest earning unit interest
\unitTime     for unit time, 
\\
\compounded   compounded
\perfectly    as fast as possible

\end{center}
\end{document}
```
****

![](./src/cubes_factorials+physics+3d.png)

  * [cubes_factorials+physics+3d.tex](https://github.com/walmes/Tikz/blob/master/src/cubes_factorials+physics+3d.pgf)

```tex
% include TIKZ_PREAMBLE.pgs
\documentclass[parskip]{scrartcl}

\usepackage{tikz}
\usepackage{pgfplots}

\begin{document}

\tikzset{
  vertex/.style={
    circle, minimum size=20pt, inner sep=0pt, fill=gray!10},
  axial/.style={
    rectangle, minimum size=20pt, inner sep=0pt, fill=gray!30},
  edge/.style={draw,thick,-,black},
  rotu/.style={midway},
  sinal/.style={draw, circle, inner sep=0pt, thin}
}

\def\dist{0.4}
\begin{tikzpicture}[
  scale=2, ->, thick, z={(0.45,0.35)}, node distance=0.65cm]
  \node[vertex] (v0) at (0,0,0) {$(1)$};
  \node[vertex] (v1) at (0,1,0) {$b$};
  \node[vertex] (v2) at (1,0,0) {$a$};
  \node[vertex] (v3) at (1,1,0) {$ab$};
  \node[vertex] (v4) at (0,0,1) {$c$};
  \node[vertex] (v5) at (0,1,1) {$bc$};
  \node[vertex] (v6) at (1,0,1) {$ac$};
  \node[vertex] (v7) at (1,1,1) {$abc$};
  \draw[edge] (v0) -- (v1) node[rotu, left=\dist] {$B$} -- 
    (v3) -- (v2) -- (v0) node[rotu, below=\dist] {$A$};
  \draw[edge] (v0) -- (v4) -- (v5) -- (v1);
  \draw[edge] (v2) -- (v6)
    node[rotu, below right=\dist] {$C$} -- (v7) -- (v3);
  \draw[edge] (v4) -- (v6); \draw[edge] (v5) -- (v7);
  \node[sinal, below of=v0] {$-$};
  \node[sinal, left of=v0] {$-$};
  \node[sinal, left of=v1] {$+$};
  \node[sinal, below of=v2] {$+$};
  \node[sinal, right of=v3] {$-$};
  \node[sinal, right of=v7] {$+$};
\end{tikzpicture}

\def\dist{0.4}
\def\ax{2}
\begin{tikzpicture}[
  scale=2, ->, thick, z={(0.55,0.3)}, node distance=0.65cm]
  \node[vertex, fill=yellow] (c0) at (0,0,0) {$0$};
  \node[vertex] (v0) at (-1,-1,-1) {$(1)$};
  \node[vertex] (v1) at (-1,1,-1) {$b$};
  \node[vertex] (v2) at (1,-1,-1) {$a$};
  \node[vertex] (v3) at (1,1,-1) {$ab$};
  \node[vertex] (v4) at (-1,-1,1) {$c$};
  \node[vertex] (v5) at (-1,1,1) {$bc$};
  \node[vertex] (v6) at (1,-1,1) {$ac$};
  \node[vertex] (v7) at (1,1,1) {$abc$};
  \node[axial] (a1) at (-\ax,0,0) {$W$};
  \node[axial] (a2) at (\ax,0,0) {$W$};
  \node[axial] (a3) at (0,-\ax,0) {$W$};
  \node[axial] (a4) at (0,\ax,0) {$W$};
  \node[axial] (a5) at (0,0,-\ax) {$W$};
  \node[axial] (a6) at (0,0,\ax) {$W$};
  \draw[edge] (v0) -- (v1) node[rotu, left=\dist] {$B$} -- 
    (v3) -- (v2) -- (v0) node[rotu, below=\dist] {$A$};
  \draw[edge] (v0) -- (v4) -- (v5) -- (v1);
  \draw[edge] (v2) -- (v6)
    node[rotu, below right=\dist] {$C$} -- (v7) -- (v3);
  \draw[edge] (v4) -- (v6); \draw[edge] (v5) -- (v7);
  \draw[edge] (a1) -- (c0) --(a2);
  \draw[edge] (a3) -- (c0) --(a4);
  \draw[edge] (a5) -- (c0) --(a6);
  \node[sinal, below of=v0] {$-$};
  \node[sinal, left of=v0] {$-$};
  \node[sinal, left of=v1] {$+$};
  \node[sinal, below of=v2] {$+$};
  \node[sinal, right of=v3] {$-$};
  \node[sinal, right of=v7] {$+$};
\end{tikzpicture}

\begin{tikzpicture}[
  scale=2, ->, thick, z={(0.45,0.35)}, node distance=0.65cm,
  vertex/.style={
    rectangle, minimum size=12pt, inner sep=1pt, fill=gray!10
  }]
  \node[text centered] (title) at (0.7,1.7,0)
    {Rendimento (\%) em um $2^3$};
  \node[vertex] (v0) at (0,0,0) {$54.8$};
  \node[vertex] (v1) at (0,1,0) {$48.0$};
  \node[vertex] (v2) at (1,0,0) {$86.5$};
  \node[vertex] (v3) at (1,1,0) {$63.0$};
  \node[vertex] (v4) at (0,0,1) {$63.0$};
  \node[vertex] (v5) at (0,1,1) {$58.5$};
  \node[vertex] (v6) at (1,0,1) {$93.5$};
  \node[vertex] (v7) at (1,1,1) {$72.0$};
  \draw[edge] (v0) -- (v1)
    node[rotu, rotate=90, yshift=1.2cm] {Catalizador} -- 
    (v3) -- (v2) -- (v0) node[rotu, below=0.9cm] {Temperatura};
  \draw[edge] (v0) -- (v4) -- (v5) -- (v1);
  \draw[edge] (v2) -- (v6)
    node[rotu, rotate=40, yshift=-1cm, xshift=0.5cm]
    {Concentra\c{c}\~ao} -- (v7) -- (v3);
  \draw[edge] (v4) -- (v6); \draw[edge] (v5) -- (v7);
  \node[sinal, below of=v0] {$-$};
  \node[sinal, left of=v0] {$-$};
  \node[sinal, left of=v1] {$+$};
  \node[sinal, below of=v2] {$+$};
  \node[sinal, right of=v3] {$-$};
  \node[sinal, right of=v7] {$+$};
\end{tikzpicture}


\end{document}
```
****

![](./src/drawing_inside_box_bigger+symbol+diagram+command+style.png)

  * [drawing_inside_box_bigger+symbol+diagram+command+style.tex](https://github.com/walmes/Tikz/blob/master/src/drawing_inside_box_bigger+symbol+diagram+command+style.pgf)

```tex
\documentclass[border=10]{standalone}
\usepackage{tikz}
\usetikzlibrary{positioning,shapes,arrows}


\newcommand{\symbolA}{
\tikz \draw[red] (0,0)--(0,0.2)--(0.2,0.2)--(0.2,0.4)--(0.4,0.4);
}

\newcommand{\symbolB}{
\tikz[y={(0,-1)}] \draw[blue] (0,0)--(0,0.2)--(0.2,0.2)--(0.2,0.4)--(0.4,0.4);
}

\newcommand{\symbolC}{
\begin{tikzpicture}
\draw[fill=green] (0,0) circle (0.2cm);
\end{tikzpicture}
}
\begin{document}

\tikzstyle{block} = [draw, fill=blue!20, rectangle, 
    minimum height=3em, minimum width=6em]
\tikzstyle{sum} = [draw, fill=blue!20, circle, node distance=1cm]
\tikzstyle{input} = [coordinate]
\tikzstyle{output} = [coordinate]
\tikzstyle{pinstyle} = [pin edge={to-,thin,black}]

% The block diagram code is probably more verbose than necessary
\begin{tikzpicture}[auto, node distance=2cm,>=latex']
    % We start by placing the blocks
    \node [input, name=input] {};
    \node [sum, right of=input] (sum) {};
    \node [block, right of=sum] (controller) {\symbolA};
    \node [block, right of=controller, pin={[pinstyle]above:Disturbances},
            node distance=3cm] (system) {\symbolB};
    % We draw an edge between the controller and system block to 
    % calculate the coordinate u. We need it to place the measurement block. 
    \draw [->] (controller) -- node[name=u] {$u$} (system);
    \node [output, right of=system] (output) {};
    \node [block, below of=u] (measurements) {\symbolC};

    % Once the nodes are placed, connecting them is easy. 
    \draw [draw,->] (input) -- node {$r$} (sum);
    \draw [->] (sum) -- node {$e$} (controller);
    \draw [->] (system) -- node [name=y] {$y$}(output);
    \draw [->] (y) |- (measurements);
    \draw [->] (measurements) -| node[pos=0.99] {$-$} 
        node [near end] {$y_m$} (sum);
\end{tikzpicture}
\end{document}
```
****

![](./src/elem-circle_grided+elem+geometry.png)

  * [elem-circle_grided+elem+geometry.tex](https://github.com/walmes/Tikz/blob/master/src/elem-circle_grided+elem+geometry.pgf)

```tex
\documentclass[tikz,border=10pt]{standalone}
%\documentclass[crop, tikz]{standalone}

\usepackage{tikz}

\begin{document}
	
\begin{tikzpicture}
\draw[step=.5cm,gray,very thin] (-1.4,-1.4) grid(1.4,1.4);
\draw (-1.5,0) -- (1.5,0);
\draw (0,-1.5) -- (0,1.5);
\draw (0,0) circle (1cm);
\end{tikzpicture}
	
\end{document}
```
****

![](./src/elem-circle_half+elem+geometry.png)

  * [elem-circle_half+elem+geometry.tex](https://github.com/walmes/Tikz/blob/master/src/elem-circle_half+elem+geometry.pgf)

```tex
\documentclass[tikz,border=10pt]{standalone}
%\documentclass[crop, tikz]{standalone}

\usepackage{tikz}

\begin{document}
	
\begin{tikzpicture}
\draw (-1.5,0) -- (1.5,0);
\draw (0,-1.5) -- (0,1.5);
\draw (-1,0) .. controls (-1,0.555) and (-0.555,1) .. (0,1)
.. controls (0.555,1) and (1,0.555) .. (1,0);
\end{tikzpicture}
	
\end{document}
```
****

![](./src/elem-cube_finer_grid+elem+foreach+command.png)

  * [elem-cube_finer_grid+elem+foreach+command.tex](https://github.com/walmes/Tikz/blob/master/src/elem-cube_finer_grid+elem+foreach+command.pgf)

```tex
\documentclass[tikz,border=45pt]{standalone}
%\usepackage[margin=15mm]{geometry}
\usepackage{tikz}


\newcommand{\tikzcuboid}[4]{% width, height, depth, scale
	\begin{tikzpicture}[scale=#4]
		\foreach \x in {0,...,#1}
		{   \draw (\x ,0  ,#3 ) -- (\x ,#2 ,#3 );
		    \draw (\x ,#2 ,#3 ) -- (\x ,#2 ,0  );
		}
		\foreach \x in {0,...,#2}
		{   \draw (#1 ,\x ,#3 ) -- (#1 ,\x ,0  );
		    \draw (0  ,\x ,#3 ) -- (#1 ,\x ,#3 );
		}
		\foreach \x in {0,...,#3}
		{   \draw (#1 ,0  ,\x ) -- (#1 ,#2 ,\x );
		    \draw (0  ,#2 ,\x ) -- (#1 ,#2 ,\x );
		}
	\end{tikzpicture}
}

\newcommand{\tikzcube}[2]{% length, scale
	\tikzcuboid{#1}{#1}{#1}{#2}
}


\begin{document}


	\tikzcuboid{11}{7}{5}{0.5}
%	\tikzcube{13}{0.25}

\end{document}
```
****

![](./src/elem-grid_RBG-7x7+elem+3d+pgf+foreach.png)

  * [elem-grid_RBG-7x7+elem+3d+pgf+foreach.tex](https://github.com/walmes/Tikz/blob/master/src/elem-grid_RBG-7x7+elem+3d+pgf+foreach.pgf)

```tex
% https://tex.stackexchange.com/a/271584/173708
% Modified by ARR for 7z7 plane

\documentclass[border={10}]{standalone}
\usepackage{tikz}  
\usepackage{tikz-3dplot} 

\tdplotsetmaincoords{60}{125} % view angles
\tdplotsetrotatedcoords{0}{0}{0} 
\begin{document}

\begin{tikzpicture}
    [%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        scale=5,tdplot_rotated_coords,
        grid/.style={very thin,gray}
    ]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %draw a grid in the x-y plane
    \foreach \x in {0,1,...,7}
        \foreach \y in {0,1,...,7}
        {
            \draw[grid] (\x,0) -- (\x,7);
            \draw[grid] (0,\y) -- (7,\y);
        };
    \draw[fill=blue]    (0,0,0) -- (0,1,0) -- (1,1,0) -- (1,0,0) -- cycle;
    \draw[fill=green ]  (1,1,0) -- (2,1,0) -- (2,2,0) -- (1,2,0) -- cycle;

\end{tikzpicture}    
\end{document}
```
****

![](./src/elem-grid_RBG+elem+foreach+style.png)

  * [elem-grid_RBG+elem+foreach+style.tex](https://github.com/walmes/Tikz/blob/master/src/elem-grid_RBG+elem+foreach+style.pgf)

```tex
\documentclass[tikz,border=10pt]{standalone}
%\documentclass[crop, tikz]{standalone}

\usepackage{tikz}

\begin{document}

\begin{tikzpicture}
	[%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	box/.style={rectangle,draw=black,thick, minimum size=1cm},
	]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	\foreach \x in {0,1,...,10}{
		\foreach \y in {0,1,...,10}
		\node[box] at (\x,\y){};
	}
	
	\node[box,fill=green] at (8,8){};  
	\node[box,fill=red  ] at (5,5){};  
	\node[box,fill=blue ] at (2,2){};  

\end{tikzpicture}

\end{document}
```
****

![](./src/elem-magnification+elem+geometry.png)

  * [elem-magnification+elem+geometry.tex](https://github.com/walmes/Tikz/blob/master/src/elem-magnification+elem+geometry.pgf)

```tex
\documentclass{standalone}
\usepackage{tikz} % http://ctan.org/pkg/pgf
\usetikzlibrary{spy, backgrounds}
\begin{document}

\begin{tikzpicture} [spy using outlines={circle, magnification=8, size=2cm, connect spies, transform shape}]
  \draw[red] (2.9,0) -- (2.9,4);
  \draw[help lines] (0,0) grid (4,4);
  \draw (0,0) -- (3,3) -- (3,0);
%   \begin{pgfonlayer}{background}
%    \draw[red] (2.9,0) -- (2.9,4);
%   \end{pgfonlayer}
  \spy [black] on (3,3) in node [left] at (6,5.5);
\end{tikzpicture}
\end{document}
```
****

![](./src/elem-stacked+elem+diagram.png)

  * [elem-stacked+elem+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/elem-stacked+elem+diagram.pgf)

```tex
\documentclass[border=10pt]{standalone}
\usepackage{tikz}
\usetikzlibrary{shapes.multipart}

\begin{document}

\begin{tikzpicture}[stack/.style={rectangle split, rectangle split parts=#1,draw, anchor=center}]
	\node[stack=5]  {
	\nodepart{two}a
	\nodepart{three}b
	\nodepart{four}c
	\nodepart{five}d
	};
\end{tikzpicture}

\end{document}
```
****

![](./src/elem-trapezium+elem+geometry.png)

  * [elem-trapezium+elem+geometry.tex](https://github.com/walmes/Tikz/blob/master/src/elem-trapezium+elem+geometry.pgf)

```tex
%\documentclass{standalone}
\documentclass[tikz,border=15pt]{standalone}
%\documentclass[crop, tikz]{standalone}

\usepackage{tikz}
\usetikzlibrary{shapes}

\begin{document}
	
\tikzset{my node/.style={trapezium, fill=#1!20, draw=#1!75, text=black}}

\begin{tikzpicture}
	\tikzset{trapezium stretches=true}
	\draw [help lines] grid (3,2);
	\node [my node=red] {A};
	\node [my node=green, minimum height=1.5cm] at (1, 1.25) {B};
	\node [my node=blue, minimum width=1.5cm] at (2, 0) {C};
\end{tikzpicture}
	
\end{document}
```
****

![](./src/filesystem_tree+diagram.png)

  * [filesystem_tree+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/filesystem_tree+diagram.pgf)

```tex
% http://www.texample.net/media/tikz/examples/TEX/filesystem-tree.tex
% Author: Frantisek Burian
\documentclass{minimal}
\usepackage{tikz}
%%%<
\usepackage{verbatim}
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{5pt}%
%%%>
\begin{comment}
:Title: Filesystem tree
:Tags: Trees; Styles
:Author: Frantisek Burian
:Slug: filesystem-tree
\end{comment}
\usetikzlibrary{trees}
\begin{document}
\tikzstyle{every node}=[draw=black,thick,anchor=west]
\tikzstyle{selected}=[draw=red,fill=red!30]
\tikzstyle{optional}=[dashed,fill=gray!50]
\begin{tikzpicture}[%
  grow via three points={one child at (0.5,-0.7) and
  two children at (0.5,-0.7) and (0.5,-1.4)},
  edge from parent path={(\tikzparentnode.south) |- (\tikzchildnode.west)}]
  \node {texmf}
    child { node {doc}}		
    child { node {fonts}}
    child { node {source}}
    child { node [selected] {tex}
      child { node {generic}}
      child { node [optional] {latex}}
      child { node {plain}}
    }
    child [missing] {}				
    child [missing] {}				
    child [missing] {}				
    child { node {texdoc}};
\end{tikzpicture}
\end{document}
```
****

![](./src/flow-direction_of_arrival+diagram.png)

  * [flow-direction_of_arrival+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/flow-direction_of_arrival+diagram.pgf)

```tex
% Direction-of-arrival diagram
% Author: Edgar Fuentes
\documentclass{article}
\usepackage{tikz}
%%%<
\usepackage{verbatim}
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{10pt}%
%%%>
\begin{comment}
:Title: Direction-of-arrival diagram
:Tags: Diagrams;Styles;
:Author: Edgar Fuentes
:Slug: doa-diagram

This diagram explains a spatial filter with direction of arrival estimation.
\end{comment}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{shapes.arrows}
\usepackage{array}
\begin{document}
\begin{tikzpicture} [
    auto,
    decision/.style = { diamond, draw=blue, thick, fill=blue!20,
                        text width=5em, text badly centered,
                        inner sep=1pt, rounded corners },
    block/.style    = { rectangle, draw=blue, thick, 
                        fill=blue!20, text width=10em, text centered,
                        rounded corners, minimum height=2em },
    line/.style     = { draw, thick, ->, shorten >=2pt },
  ]
  % Define nodes in a matrix
  \matrix [column sep=5mm, row sep=10mm] {
                    & \node [text centered] (x) {$\mathbf{X}$};            & \\
                    & \node (null1) {};                                    & \\
                    & \node [block] (doa) {\textsf{DoAE}($\mathbf{X}$)};   & \\
    \node(null3){}; & \node [decision] (uiddes)
                        {\textsf{UID}($\hat{\mathbf{X}}$)};
                                  & \node[text centered](tra){$\mathbf{i}$}; \\
                    & \node [block] (track) {\textsf{DoAT}($\mathbf{x}$)}; & \\
                    & \node [block] (pesos)
                        {\textsf{BF}(DoA$_{\mathrm{T}}$,DoAs)};            & \\
                    & \node [block] (filtrado)
                        {\textsf{SF}($\mathbf{w}$,$\mathbf{x}$)};          & \\
                    & \node [text centered] (xf) {$\hat{x}(t)$ };          & \\
  };
  % connect all nodes defined above
  \begin{scope} [every path/.style=line]
    \path (x)        --    (doa);
    \path (doa)      --    node [near start] {DoAs} (uiddes);
    \path (tra)      --    (uiddes);
    \path (uiddes)   --++  (-3,0) node [near start] {no} |- (null1);
    \path (uiddes)   --    node [near start] {DoA} (track);
    \path (track)    --    node [near start] {DoA$_{\mathrm{T}}$} (pesos);
    \path (pesos)    --    node [near start] {\textbf{w}} (filtrado);
    \path (filtrado) --    (xf);
  \end{scope}
  %
  % legend for subprocedures
  \node (leyend) at (7.5, 5){
    \begin{tabular}{>{\sffamily}l@{: }l}
      \multicolumn{2}{c}{\textbf{subprocedures}} \\
      DoAE & direction of arrival estimation     \\
      UID  & user identification                 \\
      DoAT & DoA tracking                        \\
      BF   & beam forming                        \\
      SF   & spatial filtering
    \end{tabular}
  };
  %
  % legend for input and output variables
  \node (leyend) at (7, 0){
    \begin{tabular}{l@{: }l}
      \multicolumn{2}{c}{\textbf{variables}}              \\
      DoA                       & direction of arrival    \\
      $\mathbf{i}$              & identification sequence \\
      $\mathbf{X},\,\mathbf{x}$ & signal model            \\
      DoA$_{\mathrm{T}}$        & DoAs up to date         \\
      $\hat{x}(t)$              & fitered signal
      \end{tabular}
  };
\end{tikzpicture}
\end{document}
```
****

![](./src/flow-flowchart_video+diagram+style.png)

  * [flow-flowchart_video+diagram+style.tex](https://github.com/walmes/Tikz/blob/master/src/flow-flowchart_video+diagram+style.pgf)

```tex
% https://github.com/FriendlyUser/LatexDiagrams
\documentclass{standalone}

\usepackage{tikz}
\usetikzlibrary{arrows.meta,
                calc, chains,
                quotes,
                positioning,
                shapes.geometric}

\begin{document}

\begin{tikzpicture}[
    node distance = 8mm and 16mm,
      start chain = A going below,
      base/.style = {draw, minimum width=32mm, minimum height=8mm,
                     align=center, on chain=A},
 startstop/.style = {base, rectangle, rounded corners, fill=red!30},
   process/.style = {base, rectangle, fill=orange!30},
        io/.style = {base, trapezium, 
                     trapezium left angle=70, trapezium right angle=110,
                     fill=blue!30},
  decision/.style = {base, diamond, fill=green!30},
  every edge quotes/.style = {auto=right}]
                    ]
\node [startstop]       {Read Video};            % <-- A-1
\node [process]         {Extract Frames};
\node [io]              {Read Frame};
\node [decision]        {Completed?};
\node [process]         {Save Watermarked Video};
\node [process]         {Stop};             % <-- A-6
%
\node [process,                             % <-- A-7
       right=of A-4]    {Get Next Frame};
%%
\draw [arrows=-Stealth] 
    (A-1) edge["read data"]          (A-2)
    (A-2) edge["get watermark"]    (A-3)
    (A-3) edge[text width=3cm,"apply watermark to all frames "]       (A-4)
    (A-4) edge["yes"]            (A-5)
    (A-5) edge["exit"]          (A-6)
    (A-4) edge["no"']          (A-7)       % <-- by ' is swapped label position
    (A-7) |- ($(A-2.south east)!0.5!(A-3.north east)$)
          -| ([xshift=7mm] A-3.north)
    ;
  \end{tikzpicture}
\end{document}
```
****

![](./src/geom-circle_bisectors_triangle+geometry.png)

  * [geom-circle_bisectors_triangle+geometry.tex](https://github.com/walmes/Tikz/blob/master/src/geom-circle_bisectors_triangle+geometry.pgf)

```tex
% Perpendicular bisectors of a triangle
% Author: Sam Britt
\documentclass[tikz,border=10pt]{standalone}
%%%<
\usepackage{verbatim}
%%%>
\begin{comment}
:Title: Perpendicular bisectors of a triangle
:Tags: Coordinate calculations;Foreach;Mathematical engine;Geometry;Mathematics
:Author: Sam Britt
:Slug: bisector

A perpendicular bisector of a line segment is a line which is perpendicular
to this line and passes through its midpoint. This drawing shows
perpendicular bisectors of a triangle. They meet in the center of the
circumcircle of the triangle.

This example was written by Sam Britt answering a question on TeX.SE.
\end{comment}
\usetikzlibrary{calc}
\begin{document}
\begin{tikzpicture}
  [
    scale=3,
    >=stealth,
    point/.style = {draw, circle,  fill = black, inner sep = 1pt},
    dot/.style   = {draw, circle,  fill = black, inner sep = .2pt},
  ]

  % the circle
  \def\rad{1}
  \node (origin) at (0,0) [point, label = {below right:$P_c$}]{};
  \draw (origin) circle (\rad);

  % triangle nodes: just points on the circle
  \node (n1) at +(60:\rad) [point, label = above:$1$] {};
  \node (n2) at +(-145:\rad) [point, label = below:$2$] {};
  \node (n3) at +(-45:\rad) [point, label = {below right:$3$ $(0, 0, 0)$}] {};

  % triangle edges: connect the vertices, and leave a node at the midpoint
  \draw[->] (n3) -- node (a) [label = {above right:$\vec{v}_1$}] {} (n1);
  \draw[->] (n3) -- node (b) [label = {below right:$\vec{v}_2$}] {} (n2);
  \draw[dashed] (n2) -- (n1);

  % Bisectors
  % start at the point lying on the line from (origin) to (a), at
  % twice that distance, and then draw a path going to the point on
  % the line lying on the line from (a) to the (origin), at 3 times
  % that distance.
  \draw[dotted]
    ($ (origin) ! 2 ! (a) $)
    node [right] {Bisector 1}
    -- ($(a) ! 3 ! (origin)$ );

  % similarly for origin and b
  \draw[dotted]
    ($ (origin) ! 2 ! (b) $)
    -- ($(b) ! 3 ! (origin)$ )
    node [right] {Bisector 2};

  % short vectors
  \draw[->]
    ($ (origin) ! -.7 ! (a) $)
    -- node [below] {$\vec{u}_4$}
    ($ (origin) ! -.1 ! (a) $);
  \draw[->]
    ($ (origin) ! -.1 ! (b) $)
    -- node [right] {$\vec{u}_3$}
    ($ (origin) ! -.7 ! (b) $);

  % Right angle symbols
  \def\ralen{.5ex}  % length of the short segment
  \foreach \inter/\first/\last in {a/n3/origin, b/n2/origin}
    {
      \draw let \p1 = ($(\inter)!\ralen!(\first)$), % point along first path
                \p2 = ($(\inter)!\ralen!(\last)$),  % point along second path
                \p3 = ($(\p1)+(\p2)-(\inter)$)      % corner point
            in
              (\p1) -- (\p3) -- (\p2)               % path
              ($(\inter)!.5!(\p3)$) node [dot] {};  % center dot
    }
\end{tikzpicture}
\end{document}
```
****

![](./src/geom-circle_coordinate_systems+geometry.png)

  * [geom-circle_coordinate_systems+geometry.tex](https://github.com/walmes/Tikz/blob/master/src/geom-circle_coordinate_systems+geometry.pgf)

```tex
% https://github.com/PetarV-/TikZ/blob/master/Coordinate%20systems/coordinate_systems.tex
\documentclass[crop, tikz, border=10pt]{standalone}
\usepackage{tikz}

\usetikzlibrary{calc}

\definecolor{olivegreen}{rgb}{0,0.6,0}

\begin{document}
\begin{tikzpicture}[scale=0.85]
	% Axis
	\draw[thick,-stealth,black] (-3,0)--(3,0) coordinate (A) node[below] {$x$}; % x axis
	\draw[thick,-stealth,black] (0,-3)--(0,3) node[left] {$y$}; % y axis
	\draw[black,thin] (0,0) circle (2.5cm);
	
	\draw[ultra thick,red] (0,0) -- (60:2.5cm |- 0,0) node[midway,below] {$x$}; % UpOn y axis

	\draw (1,0) arc (0:60:1) node at ($(60/2:0.7)$) {$\alpha$};
	\draw[ultra thick, blue] (60:2.5cm) -- (60:2.5cm |- 0,0) node[midway,right] {$y$}; % vertical line

	\draw[ultra thick,olivegreen,rotate=60] (0,0) -- node [left] {$r$} (2.5,0) coordinate (B); 
    
	\draw[xshift=-1cm] (B) node[circle,fill,inner sep=1pt,label=above:$P$](e){};
\end{tikzpicture}
\end{document}
```
****

![](./src/geom-hyperbola+geometry+physics.png)

  * [geom-hyperbola+geometry+physics.tex](https://github.com/walmes/Tikz/blob/master/src/geom-hyperbola+geometry+physics.pgf)

```tex
% https://wiki.physik.uzh.ch/cms/latex:tikz:hyperbola
    % Author: Izaak Neutelings (July, 2017)

\documentclass{article}
\usepackage{amsmath} % for \dfrac
\usepackage{tikz}
\tikzset{>=latex} % for LaTeX arrow head

\usepackage{pgfplots}                                     % for the axis environment

\usetikzlibrary{calc} % to do arithmetic with coordinates
\usetikzlibrary{angles,quotes} % for pic

% colors
\definecolor{mylightgrey}{RGB}{230,230,230}
\definecolor{mygrey}{RGB}{190,190,190}
\definecolor{mydarkgrey}{RGB}{110,110,110}
\definecolor{mygreen}{RGB}{120,220,160}
\definecolor{mydarkgreen}{RGB}{60,120,60}
\definecolor{myverydarkgreen}{RGB}{20,60,20}
\definecolor{mydarkred}{RGB}{140,40,40}

% mark right angle
\newcommand{\MarkRightAngle}[4][1.5mm]
{\coordinate (tempa) at ($(#3)!#1!(#2)$);
	\coordinate (tempb) at ($(#3)!#1!(#4)$);
	\coordinate (tempc) at ($(tempa)!0.5!(tempb)$);%midpoint
	\draw (tempa) -- ($(#3)!2!(tempc)$) -- (tempb);
}

% split figures into pages
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{1pt}%

\begin{document}
	
	
	% RUTHERFORD SCATTERING - hyperbola orbit
	\begin{tikzpicture}[scale=1]
	
	% limits & parameters
	\def\xa{-2.4}
	\def\xb{ 4}
	\def\ya{-4}
	\def\yb{ 4}
	\def\tmax{2.1}
	\def\a{1.3}
	\def\b{1}
	\def\c{{sqrt(\a^2+\b^2)}}
	\def\N{100} % number of points
	
	% coordinates
	\coordinate (O)  at (   0,  0 );
	\coordinate (A)  at (  \a,  0 );
	\coordinate (F1) at (  {sqrt(\a^2+\b^2)},   0 );
	\coordinate (F2) at ( -{sqrt(\a^2+\b^2)},   0 );
	\coordinate (P)  at ( -{\a^2/sqrt(\a^2+\b^2)}, -{\a*\b/sqrt(\a^2+\b^2)} );
	\coordinate (P1) at (\xb*\a, \yb*\b);
	\coordinate (P2) at (\xb*\a,-\yb*\b);
	\coordinate (yshift) at (0,0.4);
	
	% axes & asymptotes
	\draw[mygrey] % x axis
	(\xa*\a,0) -- (\xb*\a,0);
	\draw[dashed,mydarkgrey]
	(-\xb*\a*0.45, \ya*\b*0.45) -- (\xb*\a, \yb*\b)
	(-\xb*\a*0.45,-\ya*\b*0.45) -- (\xb*\a,-\yb*\b);
	
	% arrows
	\def\vtheta{30}
	\def\vradius{0.8}
	\draw[->,myverydarkgreen,shift=($(P1)-(yshift)$),scale=0.6]
	(0,0) -- (-\a,-\b) node[midway,below right=0pt] {${v}_i$};
	\draw[->,myverydarkgreen,shift=($(P2)+(yshift)$),scale=0.6]
	(-\a,\b) -- (0,0) node[midway,above right=-2pt] {${v}_f$};
	\draw[->,myverydarkgreen]
	(\a+0.35,{\vradius*sin(\vtheta)}) arc (180-\vtheta:180+\vtheta+10:\vradius)
	node[above right=0pt] {$v^*$};
	
	% angles
	\MarkRightAngle{F2}{P}{O}
	\pic [draw,myverydarkgreen,"$\theta$",angle radius=12,angle eccentricity=1.4] {angle = F2--O--P};
	\pic [draw,below,angle radius=16,angle eccentricity=1.4] {angle = P2--O--P1};
	\node[right=1pt,below=-2pt,myverydarkgreen] at ($(O)!0.5!(A)$)  {\small$\phi$};
	
	% hyperbola
	\draw[color=mylightgrey,line width=0.5,samples=\N,variable=\t,domain=-\tmax*0.58:\tmax*0.58] % left
	plot({-\a*cosh(\t)},{\b*sinh(\t)});
	\draw[color=mydarkgreen,line width=1,samples=\N,variable=\t,domain=-\tmax:\tmax] % right
	plot({ \a*cosh(\t)},{\b*sinh(\t)}); % {exp(\y)+exp(-\y)
	
	% nodes
	\draw[myverydarkgreen]
	(F2) -- (P) node[midway,below left=1pt,] {$b$};
	\fill[radius=1.5pt]
	(A)  circle node[above left=0pt] {A}
	(O)  circle node[above=2pt] {O};
	\fill[radius=2.5pt,mydarkred]
	(F2) circle node[above=2pt] {N};
	\draw[]
	%(O) -- (F2)
	node[left=1pt,above=0pt] at ($(F2)!0.5!(O)$) {$c$}
	node[below right] at ($(P)!0.5!(O)$)  {$a$};
	
	% alpha particle
	\draw[radius=1pt,mydarkgreen,fill]
	({ \a*cosh(\tmax*1.02)},{\b*sinh(\tmax*1.02)}) circle node[above right=0pt] {$\alpha$};
	
	\end{tikzpicture}
	
	
	
	
	
	% RUTHERFORD SCATTERING - hyperbolic orbits with different impact parameters
	\begin{tikzpicture}[scale=1]
	
	% limits & parameters
	\def\xa{-35}
	\def\xb{ 55}
	\def\ya{ -1}
	\def\yb{ 55}
	\def\tmax{4.5}
	\def\N{50} % number of points
	
	% use axes to get square box which cuts of the long curves
	\begin{axis}[ xmin=\xa,xmax=\xb,
	ymin=\ya,ymax=\yb,
	hide x axis, hide y axis,
	xticklabels={,,},yticklabels={,,}
	axis line style={draw=none}, tick style={draw=none}
	]
	
	% loop over multiples \u of impact parameters \b=\u*0.25
	\def\a{1}
	\foreach \u in {1,3,6,10,15,21,28,38}{
		\def\b{\u*0.25}
		\def\c{sqrt(\a^2+\b^2)}
		% hyperbola
		\addplot[color=mydarkgreen,line width=0.5,samples=\N,smooth,variable=\t,domain=-\tmax:\tmax]
		({   \a/\c*(-\a*cosh(\t)-\c) + \b/\c*\b*sinh(\t)  },
		{  -\b/\c*(-\a*cosh(\t)-\c) + \a/\c*\b*sinh(\t)  });
	}
	
	% nucleus
	\addplot[mydarkred,mark=*,mark size=2pt,mark options=solid] coordinates {(0,0)};
	
	\end{axis}
	
	\end{tikzpicture}
	
	
	
	
	
\end{document}
```
****

![](./src/geometric_representation+math+foreach+pgf+scope.png)

  * [geometric_representation+math+foreach+pgf+scope.tex](https://github.com/walmes/Tikz/blob/master/src/geometric_representation+math+foreach+pgf+scope.pgf)

```tex
% http://www.texample.net/media/tikz/examples/TEX/geometric-series.tex
% Geometric representation of the sum 1/4 + 1/16 + 1/64 + 1/256 + ...
% Author: Jimi Oke
\documentclass{article}
\usepackage{tikz}
%%%<
\usepackage{verbatim}
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{5pt}%
%%%>
\begin{comment}
:Title: Representation of a geometric series
:Tags: Foreach; Scopes
:Author: Jimi Oke
:Slug: geometric-series

The infinite series 1/4 + 1/16 + 1/64 + 1/256 + ... is one of the first computed infinite series in the history of mathematics, already used by Archimedes. Its sum is 1/3. 
\end{comment}
\begin{document}
\begin{tikzpicture}[scale=.35]\footnotesize
 \pgfmathsetmacro{\xone}{-.4}
 \pgfmathsetmacro{\xtwo}{ 16.4}
 \pgfmathsetmacro{\yone}{-.4}
 \pgfmathsetmacro{\ytwo}{16.4}

\begin{scope}<+->;
% grid
  \draw[step=1cm,gray,very thin] (\xone,\yone) grid (\xtwo,\ytwo);

% ticks
  \foreach \x/\xtext in { 8/\frac{1}{2}, 16/1}
  \draw[gray,xshift=\x cm] (0,.3) -- (0,0) node[below] {$\xtext$};
  \foreach \y/\ytext in {8/\frac{1}{2},16/1}
    \draw[gray, yshift=\y cm] (.3,0) -- (0,0)
    node[left] {$\ytext$};

% origin
 \draw[gray] (0,0) node[anchor=north east] {$O$};

% axes
  \draw[gray,thick,<->] (\xone, 0) -- (\xtwo, 0) node[right] {$x$};
  \draw[gray,thick,<->] (0, \yone) -- (0, \ytwo) node[above] {$y$};
\end{scope}

% function
\begin{scope}[thick,red]
  \foreach \x in {16, 8, 4, 2, 1,.5,.25}
    \draw (16-\x, 16-\x) rectangle (16,16);

  \foreach \x in {16, 8, 4, 2, 1,.5,.25}
  \filldraw[thin,red,opacity=.3] (16-\x, 16-\x)
    rectangle (16-.5*\x,16-.5*\x);

\foreach \x in {16, 8, 4, 2, 1,.5,.25}{
  \filldraw[thin,blue,opacity=.2] (16-\x, 16-.5*\x)
    rectangle (16-.5*\x,16);
  \filldraw[thin,blue,opacity=.2] (16-.5*\x, 16-\x)
    rectangle (16,16-.5*\x);}
\end{scope}
\end{tikzpicture}
\end{document} 
```
****

![](./src/impact-supreme_court+diagram.png)

  * [impact-supreme_court+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/impact-supreme_court+diagram.pgf)

```tex
\documentclass[border=10pt]{standalone}
\usepackage{tikz}
\usetikzlibrary{shapes.geometric, arrows.meta, positioning}
\tikzset{
  red-rounded-rectangle/.style={rectangle, rounded corners, minimum width=3cm, minimum height=1cm,text centered, draw=black, fill=red!30, align=center},
  green-rounded-rectangle/.style={rectangle, rounded corners, minimum width=3cm, minimum height=1cm,text centered, draw=black, fill=green!30, align=center},
  blue-rounded-rectangle/.style={rectangle, rounded corners, minimum width=3cm, minimum height=1cm,text centered, draw=black, fill=blue!30, align=center},
}
\begin{document}
\begin{tikzpicture}[node distance=0.5cm, >/.tip=Latex, thick]
  \node (scotus) [green-rounded-rectangle, text width = 10cm]{
    {\Huge \textbf{The Supreme Court}}
  };
  \node (state) [green-rounded-rectangle, right = of scotus, text width=4cm]{
    {\large \textbf{State Supreme Court}}\\
    Highest Law of the State
  };
  \node (state-appeals) [red-rounded-rectangle, below  = of  state, text width = 4cm]{
    {\large \textbf{State Court of Appeals}}\\
    Hears Appeals from Trials on a Case-By-Case basis.
  };
  \node (12-appeals) [red-rounded-rectangle, left=of state-appeals -| scotus, text width = 4cm] {
    {\large \textbf{12 Federal Courts of Appeals}}\\
    Hears Appeals from lower courts. Geographically distributed.
  };
  \node (94-district) [blue-rounded-rectangle, below = of 12-appeals,, text width=4cm]{
    {\large \textbf{94 District Courts}}\\
    Hears cases and deals verdicts. \textit{Judge Judy} except federal.
  };
  \node (court-appeals) [red-rounded-rectangle, right = of scotus |- state-appeals, text width=4cm]{
    {\large \textbf{Court of Appeals for the Federal Circuit}}\\
    Hears special federal appeals. (e.g. patents)
  };
  \node (legis-courts) [blue-rounded-rectangle, below= of court-appeals, text width = 4cm]{
    {\large \textbf{Legislative Courts}}\\
    Weaker Courts created by Congress. (E.g. \textit{Court of Military Appeals})
  };
  \node (trial-court) [blue-rounded-rectangle, below = of state-appeals,  text width=4cm]{
    {\large \textbf{Trial Court}}\\
    Your typical \textit{Judge Judy} case. Hears either criminal or civil cases, and deals verdicts.
  };
  \draw [->] 
  	(trial-court) 	edge (state-appeals) 
  	(state-appeals) edge (state) 
  	(state) edge (scotus) 
  	(legis-courts) edge (court-appeals) 
  	(court-appeals) edge (scotus.south -| court-appeals) 
  	(94-district) 	edge (12-appeals) 
  	(12-appeals) -- 
  	(12-appeals |- scotus.south) ;
\end{tikzpicture}
\end{document}  
```
****

![](./src/impact-venn+diagram.png)

  * [impact-venn+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/impact-venn+diagram.pgf)

```tex
% http://www.texample.net/media/tikz/examples/TEX/venn.tex
% A Venn diagram with PDF blending
% Author: Stefan Kottwitz
% https://www.packtpub.com/hardware-and-creative/latex-cookbook
\documentclass[border=10pt]{standalone} 
%%%<
\usepackage{verbatim}
%%%>
\begin{comment}
:Title: A Venn diagram with PDF blending
:Tags: Diagrams;Cookbook
:Author: Stefan Kottwitz
:Slug: venn

PDF blend mode requires TikZ version 3.0 or above.
\end{comment}
\usepackage{tikz}
\begin{document}
\begin{tikzpicture}
  \begin{scope}[blend group = soft light]
    \fill[red!30!white]   ( 90:1.2) circle (2);
    \fill[green!30!white] (210:1.2) circle (2);
    \fill[blue!30!white]  (330:1.2) circle (2);
  \end{scope}
  \node at ( 90:2)    {Computer Science};
  \node at ( 210:2)   {Statistics};
  \node at ( 330:2)   {Coding};
  \node [font=\Large] {Data Science};
\end{tikzpicture}
\end{document}
```
****

![](./src/inertial_system_color+diagram+pgf+command+def+layer.png)

  * [inertial_system_color+diagram+pgf+command+def+layer.tex](https://github.com/walmes/Tikz/blob/master/src/inertial_system_color+diagram+pgf+command+def+layer.pgf)

```tex
% http://www.texample.net/media/tikz/examples/TEX/inertial-navigation-system.tex
\documentclass[crop, tikz]{standalone}

\usepackage{tikz}
\usetikzlibrary{shapes,arrows}
\usepackage{amsmath,bm,times}
\usepackage{verbatim}

\begin{comment}
:Title: Inertial navigation system
:Tags: Block diagrams, Layers

A block diagram of an inertial measurement unit (IMU) combined with navigation
equations to form an inertial navigation system (INS). A handful of useful tricks have been 
used to align blocks and arrows nicely. Hard coding coordinates has been avoided as
much as possible.

\end{comment}

\newcommand{\mx}[1]{\mathbf{\bm{#1}}} % Matrix command
\newcommand{\vc}[1]{\mathbf{\bm{#1}}} % Vector command

\begin{document}
\pagestyle{empty}

% We need layers to draw the block diagram
\pgfdeclarelayer{background}
\pgfdeclarelayer{foreground}
\pgfsetlayers{background,main,foreground}

% Define a few styles and constants
\tikzstyle{sensor}=[draw, fill=blue!20, text width=5em, 
    text centered, minimum height=2.5em]
\tikzstyle{ann} = [above, text width=5em]
\tikzstyle{naveqs} = [sensor, text width=6em, fill=red!20, 
    minimum height=12em, rounded corners]
\def\blockdist{2.3}
\def\edgedist{2.5}

\begin{tikzpicture}
    \node (naveq) [naveqs] {Navigation equations};
    % Note the use of \path instead of \node at ... below. 
    \path (naveq.140)+(-\blockdist,0) node (gyros) [sensor] {Gyros};
    \path (naveq.-150)+(-\blockdist,0) node (accel) [sensor] {Accelero-meters};
    
    % Unfortunately we cant use the convenient \path (fromnode) -- (tonode) 
    % syntax here. This is because TikZ draws the path from the node centers
    % and clip the path at the node boundaries. We want horizontal lines, but
    % the sensor and naveq blocks aren't aligned horizontally. Instead we use
    % the line intersection syntax |- to calculate the correct coordinate
    \path [draw, ->] (gyros) -- node [above] {$\vc{\omega}_{ib}^b$} 
        (naveq.west |- gyros) ;
    % We could simply have written (gyros) .. (naveq.140). However, it's
    % best to avoid hard coding coordinates
    \path [draw, ->] (accel) -- node [above] {$\vc{f}^b$} 
        (naveq.west |- accel);
    \node (IMU) [below of=accel] {IMU};
    \path (naveq.south west)+(-0.6,-0.4) node (INS) {INS};
    \draw [->] (naveq.50) -- node [ann] {Velocity } + (\edgedist,0) 
        node[right] {$\vc{v}^l$};
    \draw [->] (naveq.20) -- node [ann] {Attitude} + (\edgedist,0) 
        node[right] { $\mx{R}_l^b$};
    \draw [->] (naveq.-25) -- node [ann] {Horisontal position} + (\edgedist,0)
        node [right] {$\mx{R}_e^l$};
    \draw [->] (naveq.-50) -- node [ann] {Depth} + (\edgedist,0) 
        node[right] {$z$};
    
    % Now it's time to draw the colored IMU and INS rectangles.
    % To draw them behind the blocks we use pgf layers. This way we  
    % can use the above block coordinates to place the backgrounds   
    \begin{pgfonlayer}{background}
        % Compute a few helper coordinates
        \path (gyros.west |- naveq.north)+(-0.5,0.3) node (a) {};
        \path (INS.south -| naveq.east)+(+0.3,-0.2) node (b) {};
        \path[fill=yellow!20,rounded corners, draw=black!50, dashed]
            (a) rectangle (b);
        \path (gyros.north west)+(-0.2,0.2) node (a) {};
        \path (IMU.south -| gyros.east)+(+0.2,-0.2) node (b) {};
        \path[fill=blue!10,rounded corners, draw=black!50, dashed]
            (a) rectangle (b);
    \end{pgfonlayer}
\end{tikzpicture}


\end{document}
```
****

![](./src/mammography_bayes+diagram.png)

  * [mammography_bayes+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/mammography_bayes+diagram.pgf)

```tex
% Mammography problem from 'Intro to Bayes'
% Author: John Henderson
\documentclass[10pt]{article}
\usepackage{tikz}
%%%<
\usepackage{verbatim}
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{5pt}%
%%%>
\begin{comment}
:Title: Mammography problem from 'Intro to Bayes'
:Tags: Nodes and Shapes;Node positioning;Text and math;Diagrams;Mathematics
:Author: John Henderson
:Slug: bayes

The following was created in response to reading about "the mammography
problem," a commonly used example illustrating the use of Bayesian
Probability, on Eliezer Yudkowsky's page, "An Intuitive Explanation of
Bayes' Theorem." The visualization presents the problem as involving
"sieves" which behave differently depending on whether the individual
passing through has or does not have cancer, illustrating the split
probability created by the reliability of a mammography (chance of
producing true positives and false positives). The illustration was posted
on LessWrong.com, a site devoted to rationality, created by Yudkowsky.
\end{comment}
\usetikzlibrary{positioning,decorations.pathreplacing,shapes}
\usepackage[english]{babel}
\usepackage{microtype}
\usepackage[hmargin=1.5cm,vmargin=1cm]{geometry}
\usepackage{amsmath}
\DeclareMathOperator{\p}{p}
\newcommand*{\cancer}{\text{cancer}}
\newcommand*{\testp}{\text{test}+}
\begin{document}
\begin{tikzpicture}[%
  % common options for blocks:
  block/.style = {draw, fill=blue!30, align=center, anchor=west,
              minimum height=0.65cm, inner sep=0},
  % common options for the circles:
  ball/.style = {circle, draw, align=center, anchor=north, inner sep=0}]

% circle illustrating all women
\node[ball,text width=3cm,fill=purple!20] (all) at (6,0) {All women};

% two circles showing split of p{cancer} and p{~cancer}
\node[ball,fill=red!70,text width=0.1cm,anchor=base] (pcan) at (3.5,-5.5) {};
\node[ball,fill=blue!40,text width=2.9cm,anchor=base] (pncan) at (8.5,-6)
   {Women without cancer\\
    $\p({\sim}\cancer) = 99\%$};

% arrows showing split from all women to cancer and ~cancer
\draw[->,thick,draw=red!50] (all.south) to [out=270,in=90] (pcan.north);
\draw[->,thick,draw=blue!80] (all.south) to [out=270,in=110] (pncan.100);

% transition from all women to actual cancer rates
\node[anchor=north,text width=10cm,inner sep=.05cm,align=center,fill=white]
  (why1) at (6,-3.7) {In measuring, we find:};

% note illustration the p{cancer} circle (text won't fit inside)
\node[inner sep=0,anchor=east,text width=3.3cm] (note1) at (3.2,-5.5) {
   Women with cancer $\p(\cancer) = 1\%$};

% draw the sieves
\node[block,anchor=north,text width=4.4cm,fill=green!50] (tray1) at
   (3.5,-8.8) {\small{$\p(\testp\mid\cancer)=0.8$}};

\node[block,anchor=north,text width=4.4cm,fill=green!50] (tray2) at
   (8.5,-8.8) {$\p(\testp\mid{\sim}\cancer)=0.096$};

% text explaining how p{cancer} and p{~cancer} behave as they
% pass through the sieves
\node[anchor=west,text width=6cm] (note1) at (-6,-9.1) {
   Now we pass both groups through the sieve; note that both
     sieves are \emph{the same}; they just behave differently
     depending on which group is passing through. \\ 
     Let $\testp=$ a positve mammography.};

% arrows showing the circles passing through the seives
\draw[->,thick,draw=red!80] (3.5,-5.9) -- (3.5,-8.6);
\draw[->,thick,draw=blue!50] (8.5,-8.1) -- (8.5,-8.6);

% numerator
\node[ball,text width=0.05cm,fill=red!70] (can) at (6,-10.5) {};

% dividing line
\draw[thick] (5,-11) -- (7,-11);

% demoniator
\node[ball,text width=0.39cm,fill=blue!40,anchor=base] (ncan) at (6.5,-11.5) {};
\node[ball,text width=0.05cm,fill=red!70,anchor=base] (can2) at (5.5,-11.5) {};

% plus sign in denominator
\draw[thick] (5.9,-11.4) -- (5.9,-11.6);
\draw[thick] (5.8,-11.5) -- (6,-11.5);

% arrows showing the output of the sieves formed the fraction
\draw[->,thick,draw=red!80] (tray1.south) to [out=280,in=180] (can);
\draw[->,thick,draw=red!80] (tray1.south) to [out=280,in=180] (can2);
\node[anchor=north,inner sep=.1cm,align=center,fill=white] (why2) at
   (3.8,-9.8) {$1\% * 80\%$};

\draw[->,thick,draw=blue!50] (tray2.south) to [out=265,in=0] (ncan);
\node[anchor=north,inner sep=.1cm,align=center,fill=white] (why2) at
   (8.4,-9.8) {$99\% * 9.6\%$};

% explanation of final formula
\node[anchor=north west,text width=6.5cm] (note2) at (-6,-12.5)
   {Finally, to find the probability that a positive test
       \emph{actually means cancer}, we look at those who passed
       through the sieve \emph{with cancer}, and divide by all who
       received a positive test, cancer or not.}; 

% illustrated fraction turned into math
\node[anchor=north,text width=10cm] (solution) at (6,-12.5) {
  \begin{align*}
      \frac{\p(\testp\mid\cancer)}{\p(\testp\mid\cancer)
        + \p(\testp\mid{\sim}\cancer)} &= \\
      \frac{1\% * 80\%}{(1\% * 80\%) + (99\% * 9.6\%)} &= 7.8\%
        = \p(\cancer\mid\testp)
   \end{align*}};
\end{tikzpicture}
\end{document}
```
****

![](./src/mapper-reducer.png)

  * [mapper-reducer.tex](https://github.com/walmes/Tikz/blob/master/src/mapper-reducer.pgf)

```tex
% https://tex.stackexchange.com/a/52703/173708

% (S) -> (M) -> (V) -> (shuffle) -> (P) -> (R) - (F)
% S for Start F for Final
\documentclass{standalone}
\usepackage{tikz}
\usetikzlibrary{%
  calc,
  fit,
  shapes,
  backgrounds
}
% the next macro is useful to create a table
\newcommand\tabins[3]{%
 \tikz[baseline=(Tab.base)] 
           \node  [rectangle split, 
                   rectangle split parts=3, 
                   draw, 
                   align=right,
                   inner sep=.5em,
                   rectangle split horizontal] (Tab)
                           {\hbox to 4ex{#1}
           \nodepart{two}  {\hbox to 8ex{\hfill #2\$}}  
           \nodepart{three}{\hbox to 3ex{#3}}}; 
}

\begin{document}
\parindent=0pt
\begin{tikzpicture}[%
   %every node/.style={transform shape},% now it's not necessary but good for a poster
  x=1.25cm,y=2cm,  
  font=\footnotesize,
  % every group of nodes have a style except for main, the style is named by a letter
  main/.style={draw,fill=yellow,inner sep=.5em},
  R/.style={draw,fill=purple!40!blue!30,inner sep=.5em},
  M/.style={draw,fill=green!80!yellow,inner sep=.5em},
  S/.style={anchor=east},
  V/.style={anchor=west},
  P/.style={anchor=center},
  F/.style={anchor=west}
  ]

% main node the reference Shuffle 
\node[main] (shuffle) {Group};
%group R reducer
\node[R] at ($(shuffle)+(8,1)$)    (R1+) {Reduce};
\node[R] at ($(shuffle)+(8, 0)$)   (R0)  {Reduce};
\node[R] at ($(shuffle)+(8,-1)$)   (R1-) {Reduce};
% group M Mapper
\node[M] at ($(shuffle)+(-6,+2.5)$)   (M3+)  {Map};
\node[M] at ($(shuffle)+(-6,+ 1.5)$)  (M2+)  {Map};
\node[M] at ($(shuffle)+(-6,+ .5)$)   (M1+)  {Map};
\node[M] at ($(shuffle)+(-6,- .5)$)   (M1-)  {Map};
\node[M] at ($(shuffle)+(-6,- 1.5)$)  (M2-)  {Map};
\node[M] at ($(shuffle)+(-6,-2.5)$)   (M3-)  {Map};
% group S Start the first nodes
\node[S] at ($(M3+)+(-1.5,0)$)  (S3+) {\Big($k_1$,\tabins{4711}{59.90}{NY}\Big)};
\node[S] at ($(M2+)+(-1.5,0)$)  (S2+) {\Big($k_2$,\tabins{4713}{142.99}{CA}\Big)};
\node[S] at ($(M1+)+(-1.5,0)$)  (S1+) {\Big($k_3$,\tabins{4714}{72.00}{NY}\Big)}; 
\node[S] at ($(M1-)+(-1.5,0)$)  (S1-) {\Big($k_4$,\tabins{4715}{108.75}{NY}\Big)}; 
\node[S] at ($(M2-)+(-1.5,0)$)  (S2-) {\Big($k_5$,\tabins{4718}{19.89}{WA}\Big)};  
\node[S] at ($(M3-)+(-1.5,0)$)  (S3-) {\Big($k_6$,\tabins{4719}{36.60}{CA}\Big)};  
% group V  why not
\node[V] at ($(M3+)+(1.5,0)$)  (V3+) {\Big(NY,59.90\$\Big)};
\node[V] at ($(M2+)+(1.5,0)$)  (V2+) {\Big(CA,142.99\$\Big)};
\node[V] at ($(M1+)+(1.5,0)$)  (V1+) {\Big(NY,72.00\$\Big)}; 
\node[V] at ($(M1-)+(1.5,0)$)  (V1-) {\Big(NY,108.75\$\Big)}; 
\node[V] at ($(M2-)+(1.5,0)$)  (V2-) {\Big(WA,19.89\$\Big)};  
\node[V] at ($(M3-)+(1.5,0)$)  (V3-) {\Big(CA,36.60\$\Big)};   

\node[P] at ($(R1+)+(-4,0)$) (P1+) {\Big(CA,\big[142.99\$,36.60\$\big]\Big)};
\node[P] at ($(R0) +(-4,0)$) (P0)  {\Big(NY,\big[59.90\$,72.00\$,108.75\big]\Big)};
\node[P] at ($(R1-)+(-4,0)$) (P1-) {\Big(WA,\big[19.89\$\big]\Big)}; 

\node[F] (F1+) at ($(R1+)+(1.5,0)$) {(CA,89.80\$)};
\node[F] (F0)  at ($(R0) +(1.5,0)$) {(NY,80.22\$)}; 
\node[F] (F1-) at ($(R1-)+(1.5,0)$) {(WA,72.00\$)}; 

% wrappers
\begin{scope}[on background layer]
    \node[fill=lightgray!50,inner sep = 4mm,fit=(shuffle),label=above:Shuffle] {}; 
\end{scope} 
\begin{scope}[on background layer]
    \node[fill=lightgray!50,inner sep = 4mm,fit=(R1+)(R1-),label=above:Reducer] {}; 
\end{scope}  
\begin{scope}[on background layer]
    \node[fill=lightgray!50,inner sep = 4mm,fit=(M3+)(M3-),label=above:Mapper] {}; 
\end{scope}

%edges

\foreach \indice in {3+,2+,1+,1-,2-,3-} \draw[->] (S\indice.east) -- (M\indice.west); 
\foreach \indice in {3+,2+,1+,1-,2-,3-} \draw[->] (M\indice.east) -- (V\indice.west);
\foreach \indice in {3+,2+,1+,1-,2-,3-} \draw[->] (V\indice.east) to [out=0,in=180] (shuffle.west); 
\foreach \indice in {1+,0,1-} \draw[->] (shuffle.east) to [out=0,in=180] (P\indice.west);  
\foreach \indice in {1+,0,1-} \draw[->] (P\indice.east) -- (R\indice.west);
\foreach \indice in {1+,0,1-} \draw[->] (R\indice.east) -- (F\indice.west);   
\end{tikzpicture} 

\end{document}     
```
****

![](./src/mind_child_manipulation+mindmap.png)

  * [mind_child_manipulation+mindmap.tex](https://github.com/walmes/Tikz/blob/master/src/mind_child_manipulation+mindmap.pgf)

```tex
\PassOptionsToPackage{rgb}{xcolor}
\documentclass[tikz,border=10pt]{standalone}
\usetikzlibrary{mindmap}
\begin{document}
\begin{tikzpicture}
  \path
  [
    mindmap,
    grow cyclic,
    every node/.style=concept,
    concept color=black!10,
    level 1/.append style={level distance=5cm, sibling angle=90},
    level 2/.append style={level distance=3cm, sibling angle=45},
    root concept/.append style={concept, concept color=black!10},
  ]
  node [root concept] {Lorem}
   child [concept color=cyan!40] { node {Ipsum}
        child [level distance=40mm] { node {Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet}
            child [level distance=35mm] { node {sit}}
               }
        child { node {amet}
            child { node {consectetur}}
            child { node {adipiscing}}
            child { node {elit}}
        }
        child { node {Aliquam}
            child { node {tincidunt}}
            child { node {interdum}}
            child { node {faucibus}}
               }
        child [style={sibling angle=50}] { node {Curabitur}
            child{ node {id}}
               }
    }
    child [concept color=yellow!50] { node {malesuada}
        child { node {}}
        child { node {}}
        child { node {}}
        child { node {}}
        child { node {}}
    }
    child [concept color=red!40] { node {adipiscing}
        child { node {}}
        child { node {}}
        child { node {}}
        child { node {}}
        child { node {}}
    }
    child [concept color=green!50] { node {elit}
        child { node {}}
        child { node {}}
        child { node {}}
        child { node {}}
        child { node {}}
    };
\end{tikzpicture}
\end{document}
```
****

![](./src/mind_circle_connection+mindmap.png)

  * [mind_circle_connection+mindmap.tex](https://github.com/walmes/Tikz/blob/master/src/mind_circle_connection+mindmap.pgf)

```tex

\documentclass[tikz,border=10pt]{standalone}
%\documentclass[crop, tikz]{standalone}

\usepackage{tikz}

\begin{document}
	
\usetikzlibrary{mindmap}
\begin{tikzpicture}[outer sep=0pt]
\node (n1) at (0,0) [circle,minimum size=2cm,fill,draw,thick,red] {};
\node (n2) at (30:2.5) [circle,minimum size=1cm,fill,draw,thick,blue] {};

\path (n1) to[circle connection bar switch color=from (red) to (blue)] (n2);
\end{tikzpicture}
	
\end{document}
```
****

![](./src/mind_computer_science+mindmap.png)

  * [mind_computer_science+mindmap.tex](https://github.com/walmes/Tikz/blob/master/src/mind_computer_science+mindmap.pgf)

```tex
% changed by ARR
% added margins and page size to fit picture full
% Author: Till Tantau
% Source: The PGF/TikZ manual
\documentclass{article}
\usepackage[paperheight=6in,paperwidth=7in,top=0.5in, bottom=0.5in, left=0.5in, right=0.5in]{geometry}
\pagestyle{empty}

\usepackage{tikz}
\usetikzlibrary{mindmap,trees}

\begin{document}

\begin{tikzpicture}
  \path[mindmap,concept color=black,text=white]
    node[concept] {Computer Science}
    [clockwise from=0]
    child[concept color=green!50!black] {
      node[concept] {practical}
      [clockwise from=90]
      child { node[concept] {algorithms} }
      child { node[concept] {data structures} }
      child { node[concept] {pro\-gramming languages} }
      child { node[concept] {software engineer\-ing} }
    }  
    child[concept color=blue] {
      node[concept] {applied}
      [clockwise from=-30]
      child { node[concept] {databases} }
      child { node[concept] {WWW} }
    }
    child[concept color=red] { node[concept] {technical} }
    child[concept color=orange] { node[concept] {theoretical} };
\end{tikzpicture}
\end{document}
```
****

![](./src/mind_connecting_concepts+mindmap.png)

  * [mind_connecting_concepts+mindmap.tex](https://github.com/walmes/Tikz/blob/master/src/mind_connecting_concepts+mindmap.pgf)

```tex

\documentclass[tikz,border=10pt]{standalone}
%\documentclass[crop, tikz]{standalone}

\usepackage{tikz}
% needed for Mindmap
\usetikzlibrary{mindmap}

\pgfdeclarelayer{background}
\pgfsetlayers{background,main}

\begin{document}
	

\begin{tikzpicture}
	[root concept/.append style={concept color=blue!20,minimum size=2cm},
	level 1 concept/.append style={sibling angle=45},
	mindmap]
	\node [concept] {Root concept}
	[clockwise from=45]
	child { node[concept] (c1) {child}}
	child { node[concept] (c2) {child}}
	child { node[concept] (c3) {child}};
	\begin{pgfonlayer}{background}
	\draw [concept connection] (c1) edge (c2)
	edge (c3)
	(c2) edge (c3);
	\end{pgfonlayer}
\end{tikzpicture}

	
\end{document}
```
****

![](./src/mind_fixed+mindmap.png)

  * [mind_fixed+mindmap.tex](https://github.com/walmes/Tikz/blob/master/src/mind_fixed+mindmap.pgf)

```tex
% https://tex.stackexchange.com/a/153942/173708
\documentclass[article, 12pt, oneside]{memoir}

\usepackage[a2paper]{geometry}
\usepackage{tikz}
\usetikzlibrary{mindmap}
\pagestyle{empty}
\begin{document}
\begin{tikzpicture}[
    mindmap,
    grow cyclic, text width=4cm, align=flush center,
    every node/.style={concept},
    concept color=orange!40,
    level 1/.style={level distance=10cm,sibling angle=90},
    level 2/.style={level distance=6cm,sibling angle=45}]

\node [root concept] {ShareLaTeX Tutorial Videos}
   child [concept color=blue!30] { node {Beginners Series}
        child { node {First Document}}
        child { node {Sections and Paragraphs}}
        child { node {Mathematics}}
        child { node {Images}}
        child { node {bibliography}}
        child { node {Tables and Matrices}}
        child { node {Longer Documents}}
    }
    child [concept color=yellow!30] { node {Thesis Series}
        child { node {Basic Structure}}
        child { node {Page Layout}}
        child { node {Figures, Subfigures and Tables}}
        child { node {Biblatex}}
        child { node {Title Page}}
    }
    child [concept color=teal!40]  { node {Beamer Series}
        child { node {Getting Started}}
        child { node {Text, Pictures and Tables}}
        child { node {Blocks, Code and Hyperlinks}}
        child { node {Overlay Specifications}}
        child { node {Themes and Handouts}}
    }
    child [concept color=purple!50] { node {TikZ Series}
        child { node {Basic Drawing}}
        child { node {Geogebra}}
        child { node {Flow Charts}}
        child { node {Circuit Diagrams}}
        child [concept color=green!40]  { node {Mind Maps}}
    };
\end{tikzpicture}
\end{document}
```
****

![](./src/multiple_block_connections-101+diagram.png)

  * [multiple_block_connections-101+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/multiple_block_connections-101+diagram.pgf)

```tex
% https://tex.stackexchange.com/a/37310/173708
\documentclass[12pt,a4paper]{article}
%\documentclass[border=2pt]{standalone}
\usepackage{tikz}
\usetikzlibrary{calc}

%%%<
\usepackage{verbatim}
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{5pt}%
%%%>

\begin{document}
\begin{figure}
\begin{center}
\begin{tikzpicture}[>=stealth]
  %coordinates
  \coordinate (orig)   at (0,0);
  \coordinate (LLD)    at (4,0);
  \coordinate (AroneA) at (-1/2,11/2);
  \coordinate (ArtwoA) at (-1/2,5);
  \coordinate (ArthrA) at (-1/2,9/2);
  \coordinate (LLA)    at (1,4);
  \coordinate (LLB)    at (4,4);
  \coordinate (LLC)    at (7,4);
  \coordinate (AroneC) at (25/2,11/2);
  \coordinate (ArtwoC) at (25/2,5);
  \coordinate (ArthrC) at (25/2,9/2);
  \coordinate (conCBD) at (21/2,9/2);
  \coordinate (conCB)  at (21/2,7/2);
  \coordinate (coCBD)  at (11,5);
  \coordinate (coCB)   at (11,3);
  \coordinate (conCBA) at (23/2,11/2);
  \coordinate (conCA)  at (23/2,5/2);

  %nodes
  \node[draw, minimum width=2cm, minimum height=2cm, anchor=south west, text width=2cm, align=center] (A) at (LLA) {Impedance\\control};
  \node[draw, minimum width=2cm, minimum height=2cm, anchor=south west, text width=2cm, align=center] (B) at (LLB) {Inverse\\Dynamics};
  \node[draw, minimum width=3cm, minimum height=2cm, anchor=south west, text width=2cm, align=center] (C) at (LLC) {Manipulator\\and\\environment};
  \node[draw, minimum width=2cm, minimum height=2cm, anchor=south west, text width=2cm, align=center] (D) at (LLD) {Direct\\kinematics};

  %edges
  \draw[->] (AroneA) -- node[above]{$p_d, R_d$} ($(A.180) + (0,1/2)$);
  \draw[->] (ArtwoA) -- node[above]{$v_d$} (A.180);
  \draw[->] (ArthrA) -- node[above]{$v_d$} ($(A.180) + (0,-1/2)$);

  \draw[->] (A.0) -- node[above] {$\alpha$} (B.180);
  \draw[->] (B.0) -- node[above] {$\tau$} (C.180);

  \draw[->] ($(C.0) + (0,1/2)$) -- node[above, pos=0.2]{$h_e$} (AroneC);
  \draw[->] (C.0) -- node[above, pos=0.2]{$q$} (ArtwoC);
  \draw[->] ($(C.0) + (0,-1/2)$) -- node[above, pos=0.2]{$q$} (ArthrC);

  \path[fill] (conCBD) circle[radius=1pt] (conCB) circle[radius=1pt];
  \path[draw,->] (conCBD) -- (conCB) -| ($(B.270) + (1/2,0)$);

  \path[fill] (coCBD) circle[radius=1pt] (coCB) circle[radius=1pt];
  \path[draw,->] (coCBD)  -- (coCB) -| (B.270);

  \path[fill] (conCBA) circle[radius=1pt] (conCA) circle[radius=1pt];
  \path[draw,->] (conCBA) -- (conCA) -| ($(B.270) + (-1/2,0)$);

  \path[draw,->] (conCB) |- ($(D.0) + (0,1/2)$);
  \path[draw,->] (coCB)  |- ($(D.0) + (0,-1/2)$);

  \path[draw,->] (conCA) |- ($(A.270) + (-1/2,0) + (0,-9/2)$) -- ($(A.270) + (-1/2,0)$);

  \path[draw,->] ($(D.180) + (0,1/2)$)  -| node[above,pos=0.2] {$p_e,r_e$} ($(A.270) + (1/2,0)$);
  \path[draw,->] ($(D.180) + (0,-1/2)$) -| node[above,pos=0.15] {$v_e$} (A.270);

\end{tikzpicture}

\end{center}

\end{figure}
\end{document}
```
****

![](./src/nested+diagram.png)

  * [nested+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/nested+diagram.pgf)

```tex
% https://tex.stackexchange.com/questions/452323/tikz-nested-block-diagram-with-boxed-text-inside-other-blocks
\documentclass[border=3.14mm,tikz]{standalone}
\usepackage{tikz}

\usetikzlibrary{calc}
\usetikzlibrary{shapes.arrows}
\usetikzlibrary{positioning,fit,backgrounds}

\begin{document}
\begin{tikzpicture}[mynode/.style = {rectangle, draw, align=center,
            text width=4cm,fill=white,
            inner xsep=6mm, inner ysep=3mm, rounded corners},
            my arrow/.style={single arrow, draw,minimum height=1.1cm},
rotate border/.style={shape border uses incircle, shape border rotate=#1},
            font=\sffamily]
    \node[mynode, label={[name=lab]Camera \& Infrared Sensor}] (inner1) {Time Synchronization};
    \node[mynode, below=2mm of inner1] (justbelow1) {Resampling};
    %
    \node[right=1.5cm of inner1, mynode, label={[name=cal]Calibration \& alignment}] (inner2) {};
    \node[mynode, below=2mm of inner2] (justbelow2) {};
    \node[mynode, below=2mm of justbelow2] (justbelow2b) {};
    \node[mynode, below=2mm of justbelow2b] (justbelow2c) {};
    %
    \node[right=1.5cm of inner2, mynode, label={[name=img]Create obfuscated
    images}] (inner3) {};
    \node[mynode, below=2mm of inner3] (justbelow3) {};
    \node[mynode, below=2mm of justbelow3] (justbelow3b) {};
    \node[mynode, below=2mm of justbelow3b] (justbelow3c) {};
    %
    \node[right=1.5cm of inner3, mynode, label={[name=tech]Obfuscation
    techniques}] (inner4) {};
    \node[mynode, below=2mm of inner4] (justbelow4) {};
    \node[mynode, below=2mm of justbelow4] (justbelow4b) {};
    \node[mynode, below=2mm of justbelow4b] (justbelow4c) {};
    \begin{scope}[on background layer]
    \node[fit={(lab) (inner1) (justbelow4c.south-|inner1.south)}, draw,fill=red!20] (outer1) {};
    \node[fit={(cal) (inner2) (justbelow2c)}, draw,fill=red!20] (outer2) {};
    \node[fit={(img) (inner3) (justbelow3c)}, draw,fill=red!20] (outer3) {};
    \node[fit={(tech) (inner4) (justbelow4c)}, draw,fill=red!20] (outer4) {};
    \end{scope}
    \path (outer1) -- (outer2) node[pos=0.45,my arrow]{}
    (outer2) -- (outer3) node[pos=0.45,my arrow]{}
    (outer4) -- (outer3) node[pos=0.45,my arrow,shape border rotate=180]{};
    \end{tikzpicture}
\end{document}
```
****

![](./src/nn-02_auto_net+neuralnet+foreach+pgf+style+learn.png)

  * [nn-02_auto_net+neuralnet+foreach+pgf+style+learn.tex](https://github.com/walmes/Tikz/blob/master/src/nn-02_auto_net+neuralnet+foreach+pgf+style+learn.pgf)

```tex
\documentclass[tikz,border=2mm]{standalone}


\begin{document}


\begin{tikzpicture}
[   cnode/.style={draw=black,fill=#1,minimum width=3mm,circle},
]
    \node[cnode=red,label=0:$\Sigma$] (s) at (6,-3) {};
    \node at (0,-4) {$\vdots$};
    \node at (3,-4) {$\vdots$};
    \foreach \x in {1,...,4}
    {   \pgfmathparse{\x<4 ? \x : "n"}
        \node[cnode=blue,label=180:$x_{\pgfmathresult}$] (x-\x) at (0,{-\x-div(\x,4)}) {};
        \node[cnode=gray,label=90:$\varphi_{\pgfmathresult}$] (p-\x) at (3,{-\x-div(\x,4)}) {};
        \draw (p-\x) -- node[above,sloped,pos=0.3] {$\omega_{\pgfmathresult}$} (s);
    }
    \foreach \x in {1,...,4}
    {   \foreach \y in {1,...,4}
        {   \draw (x-\x) -- (p-\y);
        }
    }
\end{tikzpicture}

\end{document}
```
****

![](./src/nn-05_auto_net_arr+neuralnet+style+foreach+learn.png)

  * [nn-05_auto_net_arr+neuralnet+style+foreach+learn.tex](https://github.com/walmes/Tikz/blob/master/src/nn-05_auto_net_arr+neuralnet+style+foreach+learn.pgf)

```tex
\documentclass[border=0.125cm]{standalone}
\usepackage{tikz}
\usetikzlibrary{positioning}

\begin{document}


\tikzset{%
  every neuron/.style={
    circle,
    draw,
    minimum size=1cm
  },
  neuron missing/.style={
    draw=none, 
    scale=4,
    text height=0.333cm,
    execute at begin node=\color{black}$\vdots$
  },
}

\begin{tikzpicture}[x=1.5cm, y=1.5cm, >=stealth]

	% input layer
	\foreach \m/\l [count=\y] in {1,2,3,missing,4}
	  \node [every neuron/.try, neuron \m/.try] (input-\m) at (0,2.5-\y) {};
	
	% hidden layer
	\foreach \m [count=\y] in {1,missing,2}
	  \node [every neuron/.try, neuron \m/.try ] (hidden-\m) at (2,2-\y*1.25) {};
	
	% output layer
	\foreach \m [count=\y] in {1,missing,2}
	  \node [every neuron/.try, neuron \m/.try ] (output-\m) at (4,1.5-\y) {};
	
	% labels for input layer
	\foreach \l [count=\i] in {1,2,3,n}
	  \draw [<-] (input-\i) -- ++(-1,0)
	    node [above, midway] {$I_\l$};
	
	% labels for hidden layer
	\foreach \l [count=\i] in {1,n}
	  \node [above] at (hidden-\i.north) {$H_\l$};
	
	% labels for output layer
	\foreach \l [count=\i] in {1,n}
	  \draw [->] (output-\i) -- ++(1,0)
	    node [above, midway] {$O_\l$};
	
	% connections for input layer
	\foreach \i in {1,...,4}
	  \foreach \j in {1,...,2}
	    \draw [->] (input-\i) -- (hidden-\j);
	
	% connections for hidden to output layer
	\foreach \i in {1,...,2}
	  \foreach \j in {1,...,2}
	    \draw [->] (hidden-\i) -- (output-\j);
	
	% labels for each layer at the top
	\foreach \l [count=\x from 0] in {Input, Hidden, Ouput}
	  \node [align=center, above] at (\x*2,2) {\l \\ layer};

\end{tikzpicture}

\end{document}
```
****

![](./src/nn-08-tkz-berge-01+neuralnet+scope+foreach+pkg.png)

  * [nn-08-tkz-berge-01+neuralnet+scope+foreach+pkg.tex](https://github.com/walmes/Tikz/blob/master/src/nn-08-tkz-berge-01+neuralnet+scope+foreach+pkg.pgf)

```tex
\documentclass[border=5cm]{standalone}

\usepackage{tikz}    
\usepackage{xcolor}
\usepackage{tkz-berge}


\begin{document}


\begin{tikzpicture} 
    \renewcommand*{\VertexBallColor}{green!80!black}
    \GraphInit[vstyle=Shade] 
     \grComplete[RA=5]{6}
\end{tikzpicture}

\begin{tikzpicture}
    \renewcommand*{\VertexBallColor}{green!80!black}
    \GraphInit[vstyle=Shade] 

    \grPath[Math,prefix=p,RA=2,RS=0]{2} 
    \grPath[Math,prefix=q,RA=2,RS=3]{2}

    \begin{scope}[xshift=4cm, yshift=-1cm]
        \grPath[Math,prefix=r,RA=2,RS=0]{1} 
    \end{scope}

    \begin{scope}[xshift=4cm, yshift=4cm]
        \grPath[Math,prefix=s,RA=2,RS=0]{1} 
    \end{scope}

    \foreach \from in { 0,...,1}{
        \EdgeFromOneToAll{p}{q}{\from}{2}
    }
    \EdgeFromOneToAll{r}{q}{0}{2}
    \EdgeFromOneToAll{r}{p}{0}{2}

    \EdgeFromOneToAll{s}{q}{0}{2}
    \EdgeFromOneToAll{s}{p}{0}{2}
    \EdgeFromOneToAll{s}{r}{0}{1}

\end{tikzpicture}

\end{document}
```
****

![](./src/nn-2h_manual_net-color+neuralnet+set+foreach.png)

  * [nn-2h_manual_net-color+neuralnet+set+foreach.tex](https://github.com/walmes/Tikz/blob/master/src/nn-2h_manual_net-color+neuralnet+set+foreach.pgf)

```tex
\documentclass{standalone}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{arrows}
\begin{document}
  \begin{tikzpicture}
    %%Create a style for the arrows we are using
    \tikzset{normal arrow/.style={draw,-triangle 45,very thick}}
    %%Create the different coordinates to place the nodes
    \path (0,0) coordinate (1) ++(0,-2) coordinate (2) ++(0,-2) coordinate (3);
    \path (1) ++(-3,-.2) coordinate (x1);
    \path (3) ++(-3, .2) coordinate (x2);
    %%Use the calc library and partway modifiers to generate the second and third level points
    \path ($(1)!.5!(2)!3 cm!90:(2)$) coordinate (4);
    \path ($(2)!.5!(3)!3 cm!90:(3)$) coordinate (5);
    \path ($(4)!.5!(5)!3 cm!90:(5)$) coordinate (6);
    \path (6) ++(3,0) coordinate (7);
    %%Place nodes at each point using the foreach construct
    \foreach \i/\color in {1/Magenta!60,2/MidnightBlue!60,3/CadetBlue!80,4/CadetBlue!80,5/CadetBlue!80,6/CadetBlue!80}{
      \node[draw,circle,shading=axis,top color=\color, bottom color=\color!black,shading angle=45] (n\i) at (\i) {$f_{\i}(e)$};
    }
    %%Place the remaining nodes separately
    \node (nx1) at (x1) {$\mathbf{x_1}$};
    \node (nx2) at (x2) {$\mathbf{x_2}$};
    \node (ny)  at (7)  {$\mathbf{y}$};
    %%Drawing the arrows
    \path[normal arrow] (nx1) -- (n1);
    \path[normal arrow] (nx1) -- (n3);
    \path[normal arrow] (nx2) -- (n1);
    \path[normal arrow] (nx2) -- (n3);
    \path[normal arrow] (n1)  -- (n4);
    \path[normal arrow] (n1)  -- (n5);
    \path[normal arrow] (n2)  -- (n4);
    \path[normal arrow] (n2)  -- (n5);
    \path[normal arrow] (n3)  -- (n4);
    \path[normal arrow] (n3)  -- (n5);
    \path[normal arrow] (n4)  -- (n6);
    \path[normal arrow] (n5)  -- (n6);
    \path[normal arrow] (n6)  -- (ny);
    %%Drawing the cyan arrows including the labels
    \path[normal arrow,Cyan] (nx1) -- node[above=.5em,Cyan] {$\mathbf{w_{(x1)2}}$} (n2);
    \path[normal arrow,Cyan] (nx2) -- node[below=.5em,Cyan] {$\mathbf{w_{(x2)2}}$} (n2);
  \end{tikzpicture}
\end{document}
```
****

![](./src/nn-a3c_manual_net_arr+neuralnet.png)

  * [nn-a3c_manual_net_arr+neuralnet.tex](https://github.com/walmes/Tikz/blob/master/src/nn-a3c_manual_net_arr+neuralnet.pgf)

```tex
% https://raw.githubusercontent.com/PetarV-/TikZ/master/A3C%20neural%20network/a3c_neural_network.tex
\documentclass[crop, tikz]{standalone}
\usepackage{tikz}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{xcolor}

\usetikzlibrary{positioning, decorations.pathmorphing}

\definecolor{olivegreen}{rgb}{0,0.6,0}

\begin{document}
\begin{tikzpicture}

	% boxes
	\path[rounded corners, fill=blue, fill opacity=0.2] (-0.4, 3.5) --  (-0.4, -3.5) -- (4, -3.5) -- (4, -0.2) -- (5, -0.2) -- (5, 3.5) -- (-0.4, 3.5) -- (-0.4, 0);
	\path[rounded corners, fill=red, fill opacity=0.2] (-0.4, -3.5) --  (-0.4, 3.5) -- (4, 3.5) -- (4, -0.2) -- (5, -0.2) -- (5, -3.5) -- (-0.4, -3.5) -- (-0.4, 0);
	\path[rounded corners, fill=white] (-0.4, 0) -- (-0.4, -3.5) -- (4, -3.5) -- (4, 3.5) -- (-0.4, 3.5) -- (-0.4, 0);
	\path[rounded corners, fill=olivegreen, fill opacity=0.2] (-0.4, 0) -- (-0.4, -3.5) -- (4, -3.5) -- (4, 3.5) -- (-0.4, 3.5) -- (-0.4, 0);
	\path [draw, dashed, very thick, rectangle, rounded corners] (-0.4, 0) -- (-0.4, -3.5) -- (5, -3.5) -- (5, 3.5) -- (-0.4, 3.5) -- (-0.4, 0);
	
	% add input nodes
	\node[circle, thick, fill=white, draw] (x1) {};
	\node[circle, thick, draw, fill=white, below=1em of x1] (x2) {};
	\node[circle, thick, fill=white, draw, below=1em of x2] (x3) {};
	\node[circle, thick, fill=white, draw, below=1em of x3] (x4) {};
	\node[circle, thick, fill=white, draw, below=1em of x4] (x5) {};
	\node[circle, thick, fill=white, draw, above=1em of x1] (x6) {};
	\node[circle, thick, fill=white, draw, above=1em of x6] (x7) {};
	\node[circle, thick, fill=white, draw, above=1em of x7] (x8) {};
	\node[circle, thick, fill=white, draw, above=1em of x8] (x9) {};

	% add 2nd layer
	\node[circle, thick, right=4em of x1, fill=white, draw] (xhh1) {};
	\node[circle, thick, draw, fill=white, below=1em of xhh1] (xhh2) {};
	\node[circle, thick, fill=white, draw, below=1em of xhh2] (xhh3) {};
	\node[circle, thick, fill=white, draw, below=1em of xhh3] (xhh4) {};
	\node[circle, thick, fill=white, draw, above=1em of xhh1] (xhh5) {};
	\node[circle, thick, fill=white, draw, above=1em of xhh5] (xhh6) {};
	\node[circle, thick, fill=white, draw, above=1em of xhh6] (xhh7) {};
	
	% 3rd layer
	\node[circle, thick, right=8em of x1, fill=white, draw] (xh1) {};
	\node[circle, thick, draw, fill=white, below=1em of xh1] (xh2) {};
	\node[circle, thick, fill=white, draw, below=1em of xh2] (xh3) {};
	\node[circle, thick, fill=white, draw, below=1em of xh3] (xh4) {};
	\node[circle, thick, fill=white, draw, above=1em of xh1] (xh5) {};
	\node[circle, thick, fill=white, draw, above=1em of xh5] (xh6) {};
	\node[circle, thick, fill=white, draw, above=1em of xh6] (xh7) {};

	% output layer
	\node[circle, very thick, fill=blue!30, draw, right=12em of x1, yshift=5em] (hm1) {};
	\node[circle, very thick, draw, fill=blue!30, below=0.5em of hm1] (hm2) {};
	\node[circle, very thick, draw, fill=blue!30, below=0.5em of hm2] (hm3) {};
	\node[circle, very thick, draw, fill=blue!30, above=0.5em of hm1] (hm4) {};
	\node[circle, very thick, draw, fill=blue!30, above=0.5em of hm4] (hm5) {};
	\node[circle, very thick, fill=red!30, draw, right=12em of x1, yshift=-5em] (hs1) {};

	% add labels for output layer
	\node[right=1.5em of hm1, blue] (mu1) {$\pi_\theta(s, \alpha_3)$};
	\node[right=1.5em of hm2, blue] (mu2) {$\pi_\theta(s, \alpha_4)$};
	\node[right=1.5em of hm3, blue] (mu3) {$\pi_\theta(s, \alpha_5)$};
	\node[right=1.5em of hm4, blue] (mu4) {$\pi_\theta(s, \alpha_2)$};
	\node[right=1.5em of hm5, blue] (mu5) {$\pi_\theta(s, \alpha_1)$};
	\node[right=1.5em of hs1, red] (s1) {$V_\psi(s)$};

	% arrows between input layer and 2nd layer
	\foreach \x in {1,...,9}
	\foreach \y in {1,...,7}
	\draw[-stealth, thick] (x\x) -- (xhh\y);

	% arrows between 2nd layer and 3rd layer
	\foreach \x in {1,...,7}
	\foreach \y in {1,...,7}
	\draw[-stealth, thick] (xhh\x) -- (xh\y);
	
	% arrows between 3rd layer and upper output layer
	\foreach \x in {1,...,7}
	\foreach \y in {1,...,5}
	\draw[-stealth, thick, blue] (xh\x) -- (hm\y);
	
	% arrows between 3rd layer and lower output layer
	\foreach \x in {1,...,7}
	\draw[-stealth, thick, red] (xh\x) -- (hs1);
	
	% decorated arrows for main output variable
	\draw[-stealth, decoration={snake, pre length=0.01mm, segment length=2mm, amplitude=0.3mm, post length=1.5mm}, decorate, thick, red] (hs1) -- (s1);
	
	% decorated arrows between upper output nodes and labels
	\foreach \x in {1,...,5}
	\draw[-stealth, decoration={snake, pre length=0.01mm, segment length=2mm, amplitude=0.3mm, post length=1.5mm}, decorate, thick, blue] (hm\x) -- (mu\x);

	% label for the whole network
	\node[left=0.75em of x1] (l1) {$s$};

\end{tikzpicture}
\end{document}
```
****

![](./src/nn-auto_net_4h_arr+neuralnet+matrix+foreach+style+scope.png)

  * [nn-auto_net_4h_arr+neuralnet+matrix+foreach+style+scope.tex](https://github.com/walmes/Tikz/blob/master/src/nn-auto_net_4h_arr+neuralnet+matrix+foreach+style+scope.pgf)

```tex
% https://tex.stackexchange.com/a/371474/173708
\documentclass[border=10pt]{standalone}
\usepackage{tikz}
\usetikzlibrary{matrix,arrows.meta,quotes,shadows,decorations.pathreplacing,positioning,fadings}
\usepackage{cfr-lm}
\begin{document}
\colorlet{mewnol}{blue!75!cyan}%
\colorlet{allanol}{blue!50!black}%
\begin{tikzpicture}
  [
    lliw nn/.code={\colorlet{lliwnn}{#1}},
    lliw nn=mewnol,
    nn/.style={draw=lliwnn, inner color=white, outer color=lliwnn!5, circular drop shadow},
    font=\sffamily\plstyle,
    >=Latex,
    every edge/.append style={->},
    every edge quotes/.append style={font=\sffamily\plstyle\footnotesize,},
    semithick,
  ]
  \matrix (n) [matrix of nodes, nodes={circle, minimum size=20pt, thick}, nodes in empty cells, column sep=7.5mm, column 1/.append style={nodes={coordinate}}, column 12/.append style={nodes={coordinate}}, column 2/.append style={lliw nn=allanol}, column 11/.append style={lliw nn=allanol}]
  {
    &[10mm]&&|[nn]|&&|[nn]|&&|[nn]|&&&&[10mm]\\
    &&|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&&&\\
    &|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&&\\
    &&|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&\\
    &|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&&\\
    &&|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&\\
    &|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&&\\
    &&|[nn]|&&|[nn]|&&|[nn]|&&|[nn]|&&&\\
    &&&|[nn]|&&|[nn]|&&|[nn]|&&&&\\
  };

	% draw all nodes; 
	% add labels for input and output layers 
	\foreach \i [count=\j from 1] in {3,5,7} \draw [allanol]  (n-\i-1) edge ["Input \j"] (n-\i-2) ;
	\foreach \i [count=\j from 1] in {4,6} \draw [allanol] (n-\i-11) edge ["Output \j"] (n-\i-12)  ;
  
	% add connections between all nodes  
  \begin{scope}[every edge/.append style={draw=mewnol, opacity={random(25,100)/100}}]
	\foreach \i in {3,5,7} \draw (n-\i-10) edge (n-4-11) edge (n-6-11);
	\foreach \i in {3,5,7} \foreach \j in {2,4,6,8} \draw (n-\i-2) edge (n-\j-3) (n-\j-9) edge (n-\i-10);
	\foreach \k [evaluate=\k as \m using {int(\k+1)}, evaluate=\k as \n using {int(\k+2)} ] in {3,5,7} \foreach \i in {2,4,6,8} \foreach \j in {1,3,5,7,9} \draw  (n-\i-\k) edge (n-\j-\m) (n-\j-\m) edge (n-\i-\n) ;
  \end{scope}

	% add decorations
	% add layers for groups: input layer, hidden layers, output layer  
	\begin{scope}[decoration={brace, amplitude=7.5pt}, thick, every node/.append style={align=center}]
	 \draw [decorate, mewnol] ([xshift=-2.5pt]n-1-3.west |- n-1-3.north) ++(0,7.5pt) coordinate (l) -- ([xshift=2.5pt]n-1-10.east |- l) node [above=7.5pt,midway] {Hidden\\Layers};
	 \draw [decorate, allanol] ([xshift=-2.5pt]n-1-2.west |- l) -- ([xshift=2.5pt]n-1-2.east |- l) node [above=7.5pt,midway]  {Input\\Layer};
	 \draw [decorate, allanol] ([xshift=-2.5pt]n-1-11.west |- l) -- ([xshift=2.5pt]n-1-11.east |- l) node [above=7.5pt,midway]  {Output\\Layer};
  \end{scope}
  
  % add x-axis arrow and label
  \draw [thick, ->, allanol] ([xshift=-2.5pt,yshift=-10pt]current bounding box.south -| n-9-2.west) coordinate (ll) -- ([xshift=2.5pt]n-9-11.east |- ll) node [midway, below] {Flow of Information};
  
  % add legend and strength
  \node (cs) [every edge quotes, anchor=base west, xshift=50mm, mewnol] at ([xshift=5pt,yshift=-12.5pt]n-1-1 |- current bounding box.south) {Connection Strength};
  \fill [fill=mewnol, path fading=west] (cs.base west) ++(-5pt,\pgflinewidth) rectangle ++(-50mm,5pt) ;
  
\end{tikzpicture}
\end{document}
```
****

![](./src/nn-auto_net_arr+neuralnet+foreach+style+foreach.png)

  * [nn-auto_net_arr+neuralnet+foreach+style+foreach.tex](https://github.com/walmes/Tikz/blob/master/src/nn-auto_net_arr+neuralnet+foreach+style+foreach.pgf)

```tex
\documentclass{standalone}

\usepackage{tikz}
\usepackage{verbatim}

% Basis: http://www.texample.net/tikz/examples/neural-network/
\begin{document}
\pagestyle{empty}

\def\layersep{2.5cm}

\begin{tikzpicture}[shorten >=1pt,->,draw=black!100, node distance=\layersep]
    \tikzstyle{every pin edge}=[<-,shorten <=1pt]
    \tikzstyle{neuron}=[circle,fill=black!25,minimum size=17pt,inner sep=0pt]
    \tikzstyle{input neuron}=[neuron, fill=white!100,draw=black];
    \tikzstyle{output neuron}=[neuron, fill=white!100,draw=black];
    \tikzstyle{hidden neuron}=[neuron, fill=white!100,draw=black];
    \tikzstyle{annot} = [text width=4em, text centered]

	% Draw the input layer nodes and the labels
	\foreach \name / \y in {1,...,3}
		% This is the same as writing \foreach \name / \y in {1/1,2/2,3/3,4/4}
		\node[input neuron, pin=left:Input \y] (I-\name) at (0,-\y) {};
	
	% Draw the hidden layer nodes
	\foreach \name / \y in {1,...,4}
	    \path[yshift=0.5cm]
	        node[hidden neuron] (H-\name) at (\layersep,-\y cm) {};
	
	% Draw the output layer node
	\node[output neuron,pin={[pin edge={->}]right:Output}, right of=H-2] (O1) {};
	\node[output neuron,pin={[pin edge={->}]right:Output}, right of=H-3] (O2) {};
	
	% Connect every node in the input layer with every node in the
	% hidden layer.
	\foreach \source in {1,...,3}
	    \foreach \dest in {1,...,4}
	        \path (I-\source) edge (H-\dest);
	
	% Connect every node in the hidden layer with the output layer
	\foreach \source in {1,...,4}
	    \path (H-\source) edge (O1);
	\foreach \source in {1,...,4}
	    \path (H-\source) edge (O2);
	
	% Annotate the layers at the top
	\node[annot,above of=H-1, node distance=1cm] (hl) {Hidden layer};
	\node[annot,left of=hl] {Input layer};
	\node[annot,right of=hl] {Output layer};

\end{tikzpicture}
% End of code
\end{document}
```
****

![](./src/nn-auto_net_color+neuralnet+foreach.png)

  * [nn-auto_net_color+neuralnet+foreach.tex](https://github.com/walmes/Tikz/blob/master/src/nn-auto_net_color+neuralnet+foreach.pgf)

```tex
\documentclass[border=1cm]{standalone}

\usepackage{tikz}
\usepackage{xcolor}

\begin{document}
 \begin{tikzpicture}
  \foreach \x /\alph/\name in {0/a/one, 60/b/two, 120/c/three, 180/d/four, 240/e/five, 300/f/six}{
  \node[circle, fill=green,minimum width=15mm,draw,shading=axis,top color=green, bottom color=green!50!black] (\alph) at (\x:3cm) {\name}; }

  \foreach \alpha in {a,b,c,d,e,f}%
  {%
  \foreach \alphb in {a,b,c,d,e}%
  {%
   \draw (\alpha) -- (\alphb);%
  }}

 \end{tikzpicture}


\end{document}
```
****

![](./src/nn-block_diagram-multilayer_perceptron+neuralnet+style+learn.png)

  * [nn-block_diagram-multilayer_perceptron+neuralnet+style+learn.tex](https://github.com/walmes/Tikz/blob/master/src/nn-block_diagram-multilayer_perceptron+neuralnet+style+learn.pgf)

```tex
\documentclass[crop, tikz]{standalone}
\usepackage{tikz}

\usetikzlibrary{positioning}

\tikzstyle{inputNode}=[draw,circle,minimum size=10pt,inner sep=0pt]
\tikzstyle{stateTransition}=[-stealth, thick]

\begin{document}
\begin{tikzpicture}
	\node[draw,circle,minimum size=25pt,inner sep=0pt] (x) at (0,0) {$\Sigma$ $\sigma$};

	\node[inputNode] (x0) at (-2, 1.5) {$\tiny +1$};
	\node[inputNode] (x1) at (-2, 0.75) {$\tiny x_1$};
	\node[inputNode] (x2) at (-2, 0) {$\tiny x_2$};
	\node[inputNode] (x3) at (-2, -0.75) {$\tiny x_3$};
	\node[inputNode] (xn) at (-2, -1.75) {$\tiny x_n$};

	\draw[stateTransition] (x0) to[out=0,in=120] node [midway, sloped, above] {$w_0$} (x);
	\draw[stateTransition] (x1) to[out=0,in=150] node [midway, sloped, above] {$w_1$} (x);
	\draw[stateTransition] (x2) to[out=0,in=180] node [midway, sloped, above] {$w_2$} (x);
	\draw[stateTransition] (x3) to[out=0,in=210] node [midway, sloped, above] {$w_3$} (x);
	\draw[stateTransition] (xn) to[out=0,in=240] node [midway, sloped, above] {$w_n$} (x);
	\draw[stateTransition] (x) -- (4,0) node [midway,above] {$\sigma\left(w_0 + \sum\limits_{i=1}^{n}{w_ix_i}\right)$};
	\draw[dashed] (0,-0.43) -- (0,0.43);
	\node (dots) at (-2, -1.15) {$\vdots$};
	\node[inputNode, thick] (i1) at (6, 0.75) {};
	\node[inputNode, thick] (i2) at (6, 0) {};
	\node[inputNode, thick] (i3) at (6, -0.75) {};
	
	\node[inputNode, thick] (h1) at (8, 1.5) {};
	\node[inputNode, thick] (h2) at (8, 0.75) {};
	\node[inputNode, thick] (h3) at (8, 0) {};
	\node[inputNode, thick] (h4) at (8, -0.75) {};
	\node[inputNode, thick] (h5) at (8, -1.5) {};
	
	\node[inputNode, thick] (o1) at (10, 0.75) {};
	\node[inputNode, thick] (o2) at (10, -0.75) {};
	
	\draw[stateTransition] (5, 0.75) -- node[above] {$I_1$} (i1);
	\draw[stateTransition] (5, 0) -- node[above] {$I_2$} (i2);
	\draw[stateTransition] (5, -0.75) -- node[above] {$I_3$} (i3);
	
	\draw[stateTransition] (i1) -- (h1);
	\draw[stateTransition] (i1) -- (h2);
	\draw[stateTransition] (i1) -- (h3);
	\draw[stateTransition] (i1) -- (h4);
	\draw[stateTransition] (i1) -- (h5);
	\draw[stateTransition] (i2) -- (h1);
	\draw[stateTransition] (i2) -- (h2);
	\draw[stateTransition] (i2) -- (h3);
	\draw[stateTransition] (i2) -- (h4);
	\draw[stateTransition] (i2) -- (h5);
	\draw[stateTransition] (i3) -- (h1);
	\draw[stateTransition] (i3) -- (h2);
	\draw[stateTransition] (i3) -- (h3);
	\draw[stateTransition] (i3) -- (h4);
	\draw[stateTransition] (i3) -- (h5);
	
	\draw[stateTransition] (h1) -- (o1);
	\draw[stateTransition] (h1) -- (o2);
	\draw[stateTransition] (h2) -- (o1);
	\draw[stateTransition] (h2) -- (o2);
	\draw[stateTransition] (h3) -- (o1);
	\draw[stateTransition] (h3) -- (o2);
	\draw[stateTransition] (h4) -- (o1);
	\draw[stateTransition] (h4) -- (o2);
	\draw[stateTransition] (h5) -- (o1);
	\draw[stateTransition] (h5) -- (o2);
	
	\node[above=of i1, align=center] (l1) {Input \\ layer};
	\node[right=2.3em of l1, align=center] (l2) {Hidden \\ layer};
	\node[right=2.3em of l2, align=center] (l3) {Output \\ layer};
	
	\draw[stateTransition] (o1) -- node[above] {$O_1$} (11, 0.75);
	\draw[stateTransition] (o2) -- node[above] {$O_2$} (11, -0.75);
	
	\path[dashed, double, ultra thick, gray] (x.north) edge[bend left=0] (h5.north);
	\path[dashed, double, ultra thick, gray] (x.south) edge[bend right=0] (h5.south);
\end{tikzpicture}
\end{document}
```
****

![](./src/nn-gan_two_gan_types+neuralnet.png)

  * [nn-gan_two_gan_types+neuralnet.tex](https://github.com/walmes/Tikz/blob/master/src/nn-gan_two_gan_types+neuralnet.pgf)

```tex
\documentclass[border=10pt]{standalone}
\usepackage{tikz}

\begin{document}




\tikzset{every picture/.style={line width=0.75pt}} %set default line width to 0.75pt        

\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-1,xscale=1]
%uncomment if require: \path (0,300); %set diagram left start at 0, and has height of 300

%Rounded Same Side Corner Rect [id:dp09824487187603104] 
\draw  [fill={rgb, 255:red, 167; green, 189; blue, 216 }  ,fill opacity=1 ] (59,53.17) .. controls (59,48.75) and (62.58,45.17) .. (67,45.17) -- (121,45.17) .. controls (125.42,45.17) and (129,48.75) .. (129,53.17) -- (129,85.17) .. controls (129,85.17) and (129,85.17) .. (129,85.17) -- (59,85.17) .. controls (59,85.17) and (59,85.17) .. (59,85.17) -- cycle ;

%Straight Lines [id:da3936283121049964] 
\draw [line width=1.5]    (94,46.37) -- (94,27.17) ;
\draw [shift={(94,24.17)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;

%Straight Lines [id:da20962861468486604] 
\draw [line width=1.5]    (94,108.37) -- (94,89.17) ;
\draw [shift={(94,86.17)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;


%Rounded Same Side Corner Rect [id:dp23742764202945832] 
\draw  [fill={rgb, 255:red, 236; green, 127; blue, 141 }  ,fill opacity=1 ] (111,184.5) .. controls (111,180.08) and (114.58,176.5) .. (119,176.5) -- (173,176.5) .. controls (177.42,176.5) and (181,180.08) .. (181,184.5) -- (181,216.5) .. controls (181,216.5) and (181,216.5) .. (181,216.5) -- (111,216.5) .. controls (111,216.5) and (111,216.5) .. (111,216.5) -- cycle ;

%Shape: Circle [id:dp9124405398322727] 
\draw   (133.5,260.5) .. controls (133.5,253.6) and (139.1,248) .. (146,248) .. controls (152.9,248) and (158.5,253.6) .. (158.5,260.5) .. controls (158.5,267.4) and (152.9,273) .. (146,273) .. controls (139.1,273) and (133.5,267.4) .. (133.5,260.5) -- cycle ;

%Straight Lines [id:da13727591026438046] 
\draw    (47,128.5) -- (47,118.37) -- (147,118.5) -- (147,128.5) ;


%Shape: Circle [id:dp18766521903761446] 
\draw   (34.5,141.5) .. controls (34.5,134.6) and (40.1,129) .. (47,129) .. controls (53.9,129) and (59.5,134.6) .. (59.5,141.5) .. controls (59.5,148.4) and (53.9,154) .. (47,154) .. controls (40.1,154) and (34.5,148.4) .. (34.5,141.5) -- cycle ;

%Straight Lines [id:da802599291550045] 
\draw [line width=1.5]    (147,176.7) -- (147,157.5) ;
\draw [shift={(147,154.5)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;

%Straight Lines [id:da6629044704219691] 
\draw [line width=1.5]    (94,108.37) -- (94,118.37) ;


%Rounded Same Side Corner Rect [id:dp8414166975508496] 
\draw  [fill={rgb, 255:red, 167; green, 189; blue, 216 }  ,fill opacity=1 ] (280,52.8) .. controls (280,48.38) and (283.58,44.8) .. (288,44.8) -- (342,44.8) .. controls (346.42,44.8) and (350,48.38) .. (350,52.8) -- (350,84.8) .. controls (350,84.8) and (350,84.8) .. (350,84.8) -- (280,84.8) .. controls (280,84.8) and (280,84.8) .. (280,84.8) -- cycle ;

%Straight Lines [id:da2585894594076309] 
\draw [line width=1.5]    (315,46) -- (315,26.8) ;
\draw [shift={(315,23.8)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;

%Straight Lines [id:da46888126052976953] 
\draw [line width=1.5]    (315,108) -- (315,88.8) ;
\draw [shift={(315,85.8)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;

%Straight Lines [id:da8917552789067931] 
\draw [line width=1.5]    (315,108) -- (315,118) ;



%Rounded Same Side Corner Rect [id:dp5374022902949864] 
\draw  [fill={rgb, 255:red, 236; green, 127; blue, 141 }  ,fill opacity=1 ] (331,185.5) .. controls (331,181.08) and (334.58,177.5) .. (339,177.5) -- (393,177.5) .. controls (397.42,177.5) and (401,181.08) .. (401,185.5) -- (401,217.5) .. controls (401,217.5) and (401,217.5) .. (401,217.5) -- (331,217.5) .. controls (331,217.5) and (331,217.5) .. (331,217.5) -- cycle ;

%Shape: Circle [id:dp15401041449631925] 
\draw   (355,260.5) .. controls (355,253.6) and (360.6,248) .. (367.5,248) .. controls (374.4,248) and (380,253.6) .. (380,260.5) .. controls (380,267.4) and (374.4,273) .. (367.5,273) .. controls (360.6,273) and (355,267.4) .. (355,260.5) -- cycle ;

%Straight Lines [id:da7442630597870975] 
\draw    (267,129.5) -- (267,119.37) -- (367,119.5) -- (367,129.5) ;


%Shape: Circle [id:dp5737171836404196] 
\draw   (254.5,142.5) .. controls (254.5,135.6) and (260.1,130) .. (267,130) .. controls (273.9,130) and (279.5,135.6) .. (279.5,142.5) .. controls (279.5,149.4) and (273.9,155) .. (267,155) .. controls (260.1,155) and (254.5,149.4) .. (254.5,142.5) -- cycle ;

%Straight Lines [id:da4180267705785833] 
\draw [line width=1.5]    (367,177.7) -- (367,158.5) ;
\draw [shift={(367,155.5)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;

%Shape: Circle [id:dp1910511651314143] 
\draw   (417.67,261) .. controls (417.67,254.1) and (423.26,248.5) .. (430.17,248.5) .. controls (437.07,248.5) and (442.67,254.1) .. (442.67,261) .. controls (442.67,267.9) and (437.07,273.5) .. (430.17,273.5) .. controls (423.26,273.5) and (417.67,267.9) .. (417.67,261) -- cycle ;
%Straight Lines [id:da4651457466304051] 
\draw    (430,107) -- (430,247.5) ;


%Straight Lines [id:da5203121766050092] 
\draw [line width=1.5]    (366.33,238.5) -- (366.33,219.3) ;
\draw [shift={(366.33,216.3)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;

%Straight Lines [id:da937462245399049] 
\draw [line width=1.5]    (366.33,238.5) -- (366.33,248.5) ;



%Straight Lines [id:da9479077607901114] 
\draw    (368.33,238.5) -- (430,238.5) ;

\draw [shift={(366.33,238.5)}, rotate = 0] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
%Straight Lines [id:da5439740708699127] 
\draw    (318.33,107.98) -- (430,107) ;

\draw [shift={(316.33,108)}, rotate = 359.5] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=0.75]  [draw opacity=0] (10.72,-5.15) -- (0,0) -- (10.72,5.15) -- (7.12,0) -- cycle    ;
%Straight Lines [id:da9106477946558591] 
\draw [line width=1.5]    (146,238.5) -- (146,219.3) ;
\draw [shift={(146,216.3)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;

%Straight Lines [id:da3221761369788204] 
\draw [line width=1.5]    (146,238.5) -- (146,248.5) ;




% Text Node
\draw (146,196.5) node [scale=1.7280000000000002] [align=left] {G};
% Text Node
\draw (147,140.5) node   {$G( z)$};
% Text Node
\draw (148,258.5) node   {$z$};
% Text Node
\draw (94,65.17) node [scale=1.7280000000000002] [align=left] {D};
% Text Node
\draw (161.5,118.5) node [scale=0.8,color={rgb, 255:red, 155; green, 155; blue, 155 }  ,opacity=1 ] [align=left] {fake};
% Text Node
\draw (32.5,117.5) node [scale=0.8,color={rgb, 255:red, 155; green, 155; blue, 155 }  ,opacity=1 ] [align=left] {real};
% Text Node
\draw (47.5,138) node   {$x$};
% Text Node
\draw (96,11.83) node  [align=left] {real/fake};
% Text Node
\draw (114.17,289) node [scale=0.8] [align=left] {a) Generative Adversarial Networks};
% Text Node
\draw (367,141.5) node   {$G( z)$};
% Text Node
\draw (381.5,119.5) node [scale=0.8,color={rgb, 255:red, 155; green, 155; blue, 155 }  ,opacity=1 ] [align=left] {fake};
% Text Node
\draw (252.5,118.5) node [scale=0.8,color={rgb, 255:red, 155; green, 155; blue, 155 }  ,opacity=1 ] [align=left] {real};
% Text Node
\draw (316,12.83) node  [align=left] {real/fake};
% Text Node
\draw (354.67,289) node [scale=0.8] [align=left] {b) Conditional GAN};
% Text Node
\draw (267.5,139) node   {$x$};
% Text Node
\draw (369.5,258.5) node   {$z$};
% Text Node
\draw (366,197.5) node [scale=1.7280000000000002] [align=left] {G};
% Text Node
\draw (315,64.8) node [scale=1.7280000000000002] [align=left] {D};
% Text Node
\draw (432.17,259) node   {$c$};


\end{tikzpicture}



\end{document}
```
****

![](./src/nn-gan_vertical+neuralnet.png)

  * [nn-gan_vertical+neuralnet.tex](https://github.com/walmes/Tikz/blob/master/src/nn-gan_vertical+neuralnet.pgf)

```tex
\documentclass[border=10pt]{standalone}
\usepackage{tikz}

\begin{document}




\tikzset{every picture/.style={line width=0.75pt}} %set default line width to 0.75pt        

\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-1,xscale=1]
%uncomment if require: \path (0,300); %set diagram left start at 0, and has height of 300

%Rounded Same Side Corner Rect [id:dp2451362198380881] 
\draw  [fill={rgb, 255:red, 167; green, 189; blue, 216 }  ,fill opacity=1 ] (79,54.17) .. controls (79,49.75) and (82.58,46.17) .. (87,46.17) -- (141,46.17) .. controls (145.42,46.17) and (149,49.75) .. (149,54.17) -- (149,86.17) .. controls (149,86.17) and (149,86.17) .. (149,86.17) -- (79,86.17) .. controls (79,86.17) and (79,86.17) .. (79,86.17) -- cycle ;

%Straight Lines [id:da14573772274169616] 
\draw [line width=1.5]    (114,47.37) -- (114,28.17) ;
\draw [shift={(114,25.17)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;

%Straight Lines [id:da7579961352080994] 
\draw [line width=1.5]    (114,109.37) -- (114,90.17) ;
\draw [shift={(114,87.17)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;


%Rounded Same Side Corner Rect [id:dp27437364893503646] 
\draw  [fill={rgb, 255:red, 236; green, 127; blue, 141 }  ,fill opacity=1 ] (131,185.5) .. controls (131,181.08) and (134.58,177.5) .. (139,177.5) -- (193,177.5) .. controls (197.42,177.5) and (201,181.08) .. (201,185.5) -- (201,217.5) .. controls (201,217.5) and (201,217.5) .. (201,217.5) -- (131,217.5) .. controls (131,217.5) and (131,217.5) .. (131,217.5) -- cycle ;

%Shape: Circle [id:dp6172800122901183] 
\draw   (153.5,261.5) .. controls (153.5,254.6) and (159.1,249) .. (166,249) .. controls (172.9,249) and (178.5,254.6) .. (178.5,261.5) .. controls (178.5,268.4) and (172.9,274) .. (166,274) .. controls (159.1,274) and (153.5,268.4) .. (153.5,261.5) -- cycle ;

%Straight Lines [id:da8111485597522028] 
\draw    (67,129.5) -- (67,119.37) -- (167,119.5) -- (167,129.5) ;


%Shape: Circle [id:dp5550396643085889] 
\draw   (54.5,142.5) .. controls (54.5,135.6) and (60.1,130) .. (67,130) .. controls (73.9,130) and (79.5,135.6) .. (79.5,142.5) .. controls (79.5,149.4) and (73.9,155) .. (67,155) .. controls (60.1,155) and (54.5,149.4) .. (54.5,142.5) -- cycle ;

%Straight Lines [id:da4358037156768244] 
\draw [line width=1.5]    (167,177.7) -- (167,158.5) ;
\draw [shift={(167,155.5)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;

%Straight Lines [id:da35373187835236874] 
\draw [line width=1.5]    (114,109.37) -- (114,119.37) ;


%Straight Lines [id:da1620841210006193] 
\draw [line width=1.5]    (166,239.5) -- (166,220.3) ;
\draw [shift={(166,217.3)}, rotate = 450] [fill={rgb, 255:red, 0; green, 0; blue, 0 }  ][line width=1.5]  [draw opacity=0] (11.61,-5.58) -- (0,0) -- (11.61,5.58) -- cycle    ;

%Straight Lines [id:da9258346349543058] 
\draw [line width=1.5]    (166,239.5) -- (166,249.5) ;




% Text Node
\draw (167,141.5) node   {$G( z)$};
% Text Node
\draw (181.5,119.5) node [scale=0.8,color={rgb, 255:red, 155; green, 155; blue, 155 }  ,opacity=1 ] [align=left] {fake};
% Text Node
\draw (52.5,118.5) node [scale=0.8,color={rgb, 255:red, 155; green, 155; blue, 155 }  ,opacity=1 ] [align=left] {real};
% Text Node
\draw (116,12.83) node  [align=left] {real/fake};
% Text Node
\draw (134.17,290) node [scale=0.8] [align=left] {a) Generative Adversarial Networks};
% Text Node
\draw (67.5,139) node   {$x$};
% Text Node
\draw (168,259.5) node   {$z$};
% Text Node
\draw (166,197.5) node [scale=1.7280000000000002] [align=left] {G};
% Text Node
\draw (114,66.17) node [scale=1.7280000000000002] [align=left] {D};


\end{tikzpicture}



\end{document}
```
****

![](./src/nn-generator+neuralnet+matrix.png)

  * [nn-generator+neuralnet+matrix.tex](https://github.com/walmes/Tikz/blob/master/src/nn-generator+neuralnet+matrix.pgf)

```tex
\documentclass[landscape]{article}
\usepackage{tikz}

%%%<
\usepackage{verbatim}
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{5pt}%
%%%>

\usepackage[margin=1cm]{geometry}
\usepackage{tikz,pgfplots,pgf}
\usetikzlibrary{matrix,shapes,arrows,positioning}

\begin{document}


\begin{figure}[htp]
\centering
\begin{tikzpicture}[
plain/.style={
  draw=none,
  fill=none,
  },
dot/.style={draw,shape=circle,minimum size=3pt,inner sep=0,fill=black
  },
net/.style={
  matrix of nodes,
  nodes={
    draw,
    circle,
    inner sep=8.5pt
    },
  nodes in empty cells,
  column sep=0.6cm,
  row sep=-11pt
  },
>=latex
]
\matrix[net] (mat)
{
|[plain]| \parbox{1cm}{\centering Input\\layer} 
          & |[plain]| \parbox{1cm}{\centering Hidden\\layer} 
                       & |[plain]| \parbox{1cm}{\centering Output\\layer} \\
          & |[plain]|                 \\
|[plain]| &            & |[plain]|    \\
          & |[plain]|  &              \\
|[plain]| & |[dot]|                   \\
          & |[plain]|  & |[dot]|      \\
|[plain]| & |[dot]|    & |[plain]|    \\
|[dot]|   & |[plain]|  & |[dot]|      \\
|[dot]|   & |[dot]|    & |[plain]|    \\
|[dot]|   & |[plain]|  &              \\
|[plain]| &            & |[plain]|    \\
          & |[plain]|                 \\
};
\foreach \ai/\mi in {2/B01,4/B02,6/B03,12/Bn}
  \draw[<-] (mat-\ai-1) -- node[above] {\mi} +(-1cm,0);
\foreach \ai in {2,4,6,12}
{\foreach \aii/\mii in {3/H1,11/Hn}
  \draw[->] (mat-\ai-1) -- (mat-\aii-2) node[yshift=0.6cm] {\mii};
}
\foreach \ai in {3,11}
{  \draw[->] (mat-\ai-2) -- (mat-4-3);
  \draw[->] (mat-4-3) -- node[above] {Var1} +(1cm,0);}
\foreach \ai in {3,11}
{  \draw[->] (mat-\ai-2) -- (mat-10-3);
  \draw[->] (mat-10-3) -- node[above] {Varn} +(1cm,0);}
\end{tikzpicture}

\caption{ANN diagram for the Generator.}
\label{fig_m_3}
\end{figure}

\end{document}
```
****

![](./src/nn-hopfield_auto_net+neuralnet+foreach+scope+learn+style+command.png)

  * [nn-hopfield_auto_net+neuralnet+foreach+scope+learn+style+command.tex](https://github.com/walmes/Tikz/blob/master/src/nn-hopfield_auto_net+neuralnet+foreach+scope+learn+style+command.pgf)

```tex
% https://raw.githubusercontent.com/MartinThoma/LaTeX-examples/master/tikz/hopfield-network/hopfield-network.tex
\documentclass[varwidth=true, border=2pt]{standalone}
\usepackage{tikz}

\tikzstyle{neuron}=[draw,circle,minimum size=20pt,inner sep=0pt, fill=white]
\tikzstyle{stateTransition}=[very thick]
\tikzstyle{learned}=[text=red]

\begin{document}
    \newcommand\n{5}
    \begin{tikzpicture}[scale=1.3]
        \begin{scope}[rotate=17]
        %the multiplication with floats is not possible. Thus I split the loop in two.
        \foreach \number in {1,...,\n}{
            \node[neuron] (N-\number) at ({\number*(360/\n)}:1.5cm) {$x_\number$};
        }

        \foreach \number in {1,...,\n}{
            \foreach \y in {1,...,\n}{
                \draw[stateTransition] (N-\number) -- (N-\y);
            }
        }
        \end{scope}
        \begin{scope}[rotate=-1]
        \draw[learned,stateTransition] (N-1) -- (N-2) node [midway,above=-0.15cm,sloped] {$w_{1,2}$};
        \draw[learned,stateTransition] (N-1) -- (N-5) node [midway,above=-0.15cm,sloped] {$w_{1,5}$};
        \end{scope}
    \end{tikzpicture}
\end{document}
```
****

![](./src/nn-neural_network-1h+neuralnet+foreach.png)

  * [nn-neural_network-1h+neuralnet+foreach.tex](https://github.com/walmes/Tikz/blob/master/src/nn-neural_network-1h+neuralnet+foreach.pgf)

```tex
% http://www.texample.net/media/tikz/examples/TEX/neural-network.tex
\documentclass{standalone}

\usepackage{tikz}
\usepackage{verbatim}

\begin{comment}
:Title: Neural network
:Tags: Foreach

The ``\foreach`` command is very useful for quickly creating structured graphics
like this neural network diagram.

\end{comment}

\begin{document}
\pagestyle{empty}

\def\layersep{2.5cm}

\begin{tikzpicture}[shorten >=1pt,->,draw=black!50, node distance=\layersep]
    \tikzstyle{every pin edge}=[<-,shorten <=1pt]
    \tikzstyle{neuron}=[circle,fill=black!25,minimum size=17pt,inner sep=0pt]
    \tikzstyle{input neuron}=[neuron, fill=green!50];
    \tikzstyle{output neuron}=[neuron, fill=red!50];
    \tikzstyle{hidden neuron}=[neuron, fill=blue!50];
    \tikzstyle{annot} = [text width=4em, text centered]

    % Draw the input layer nodes
    \foreach \name / \y in {1,...,4}
    % This is the same as writing \foreach \name / \y in {1/1,2/2,3/3,4/4}
        \node[input neuron, pin=left:Input \#\y] (I-\name) at (0,-\y) {};

    % Draw the hidden layer nodes
    \foreach \name / \y in {1,...,5}
        \path[yshift=0.5cm]
            node[hidden neuron] (H-\name) at (\layersep,-\y cm) {};

    % Draw the output layer node
    \node[output neuron,pin={[pin edge={->}]right:Output}, right of=H-3] (O) {};

    % Connect every node in the input layer with every node in the
    % hidden layer.
    \foreach \source in {1,...,4}
        \foreach \dest in {1,...,5}
            \path (I-\source) edge (H-\dest);

    % Connect every node in the hidden layer with the output layer
    \foreach \source in {1,...,5}
        \path (H-\source) edge (O);

    % Annotate the layers
    \node[annot,above of=H-1, node distance=1cm] (hl) {Hidden layer};
    \node[annot,left of=hl] {Input layer};
    \node[annot,right of=hl] {Output layer};
\end{tikzpicture}
% End of code
\end{document}
```
****

![](./src/nn-stacked_blocks+neuralnet+3d+def+pgf+set+style.png)

  * [nn-stacked_blocks+neuralnet+3d+def+pgf+set+style.tex](https://github.com/walmes/Tikz/blob/master/src/nn-stacked_blocks+neuralnet+3d+def+pgf+set+style.pgf)

```tex
\documentclass[tikz]{standalone}

%% Language and font encodings
\usepackage[english]{babel}
\usepackage[utf8x]{inputenc}
\usepackage[T1]{fontenc}

\usepackage{xcolor}
\definecolor{darkblue}{HTML}{1f4e79}
\definecolor{lightblue}{HTML}{00b0f0}
\definecolor{salmon}{HTML}{ff9c6b}

\usetikzlibrary{backgrounds,calc,shadings,shapes.arrows,arrows,shapes.symbols,shadows,positioning,decorations.markings,backgrounds,arrows.meta}

% Define parallelepiped shape:
\makeatletter
\pgfkeys{/pgf/.cd,
  parallelepiped offset x/.initial=2mm,
  parallelepiped offset y/.initial=2mm
}
\pgfdeclareshape{parallelepiped}
{
  \inheritsavedanchors[from=rectangle] % this is nearly a rectangle
  \inheritanchorborder[from=rectangle]
  \inheritanchor[from=rectangle]{north}
  \inheritanchor[from=rectangle]{north west}
  \inheritanchor[from=rectangle]{north east}
  \inheritanchor[from=rectangle]{center}
  \inheritanchor[from=rectangle]{west}
  \inheritanchor[from=rectangle]{east}
  \inheritanchor[from=rectangle]{mid}
  \inheritanchor[from=rectangle]{mid west}
  \inheritanchor[from=rectangle]{mid east}
  \inheritanchor[from=rectangle]{base}
  \inheritanchor[from=rectangle]{base west}
  \inheritanchor[from=rectangle]{base east}
  \inheritanchor[from=rectangle]{south}
  \inheritanchor[from=rectangle]{south west}
  \inheritanchor[from=rectangle]{south east}
  \backgroundpath{
    % store lower right in xa/ya and upper right in xb/yb
    \southwest \pgf@xa=\pgf@x \pgf@ya=\pgf@y
    \northeast \pgf@xb=\pgf@x \pgf@yb=\pgf@y
    \pgfmathsetlength\pgfutil@tempdima{\pgfkeysvalueof{/pgf/parallelepiped
      offset x}}
    \pgfmathsetlength\pgfutil@tempdimb{\pgfkeysvalueof{/pgf/parallelepiped
      offset y}}
    \def\ppd@offset{\pgfpoint{\pgfutil@tempdima}{\pgfutil@tempdimb}}
    \pgfpathmoveto{\pgfqpoint{\pgf@xa}{\pgf@ya}}
    \pgfpathlineto{\pgfqpoint{\pgf@xb}{\pgf@ya}}
    \pgfpathlineto{\pgfqpoint{\pgf@xb}{\pgf@yb}}
    \pgfpathlineto{\pgfqpoint{\pgf@xa}{\pgf@yb}}
    \pgfpathclose
    \pgfpathmoveto{\pgfqpoint{\pgf@xb}{\pgf@ya}}
    \pgfpathlineto{\pgfpointadd{\pgfpoint{\pgf@xb}{\pgf@ya}}{\ppd@offset}}
    \pgfpathlineto{\pgfpointadd{\pgfpoint{\pgf@xb}{\pgf@yb}}{\ppd@offset}}
    \pgfpathlineto{\pgfpointadd{\pgfpoint{\pgf@xa}{\pgf@yb}}{\ppd@offset}}
    \pgfpathlineto{\pgfqpoint{\pgf@xa}{\pgf@yb}}
    \pgfpathmoveto{\pgfqpoint{\pgf@xb}{\pgf@yb}}
    \pgfpathlineto{\pgfpointadd{\pgfpoint{\pgf@xb}{\pgf@yb}}{\ppd@offset}}
  }
}
\makeatother

\tikzset{
  % Dark blue blocks
  block/.style={
    parallelepiped,fill=white, draw,
    minimum width=0.8cm,
    minimum height=2.4cm,
    parallelepiped offset x=0.5cm,
    parallelepiped offset y=0.5cm,
    path picture={
      \draw[top color=darkblue,bottom color=darkblue]
        (path picture bounding box.south west) rectangle 
        (path picture bounding box.north east);
    },
    text=white,
  },
  % Orange-ish blocks
  conv/.style={
    parallelepiped,fill=white, draw,
    minimum width=0.8cm,
    minimum height=2.4cm,
    parallelepiped offset x=0.5cm,
    parallelepiped offset y=0.5cm,
    path picture={
      \draw[top color=salmon,bottom color=salmon]
        (path picture bounding box.south west) rectangle 
        (path picture bounding box.north east);
    },
    text=white,
  },
  % Taller Light blue blocks:
  plate/.style={
    parallelepiped,fill=white, draw,
    minimum width=0.1cm,
    minimum height=7.4cm,
    parallelepiped offset x=0.5cm,
    parallelepiped offset y=0.5cm,
    path picture={
      \draw[top color=lightblue,bottom color=lightblue]
        (path picture bounding box.south west) rectangle 
        (path picture bounding box.north east);
    },
    text=white,
  },
  % Arrows between blocks:
  link/.style={
    color=lightblue,
    line width=2mm,
  },
}

\begin{document}

\begin{tikzpicture}
  % The order of blocks matters since some are partially hidden behind subsequent blocks.
  \node[conv](conv1){\rotatebox{90}{Conv}};
  \node[plate,right=0.2cm of conv1](plate1){};
  % yshift to align the bottom of that blocks with the previous taller block.
  \node[block,right=0.2cm of plate1,yshift=-2.5cm](resblock1){\rotatebox{90}{ResBlock}};
  \node[block,above=0.1cm of resblock1](resblock2){\rotatebox{90}{ResBlock}};
  \node[block,above=0.1cm of resblock2](resblock3){\rotatebox{90}{ResBlock}};
  \node[block,right=0.2cm of resblock1](x1){\rotatebox{90}{(X4)}};
  \node[block,above=0.1cm of x1](x2){\rotatebox{90}{(X3)}};
  \node[block,above=0.1cm of x2](x3){\rotatebox{90}{(X2)}};
  \node[plate,right=0.2cm of x2](plate2){};
  \node[block,right=0.6cm of x2](resblock4){\rotatebox{90}{ResBlock4}};
  \node[block,right=2cm of resblock4](resblock5){\rotatebox{90}{ResBlock5}};
  \node[conv,right=0.2cm of resblock5](conv2){\rotatebox{90}{Conv}};
  \draw [-,link] ([xshift=0.2cm,yshift=0.2cm]resblock4.east) -- ([yshift=0.2cm]resblock5.west);
  \draw [-triangle 60,link] ([xshift=0.2cm,yshift=0.2cm]conv2.east) -- ([xshift=1.5cm,yshift=0.2cm]conv2.east);
\end{tikzpicture}

\end{document}
```
****

![](./src/noise+diagram.png)

  * [noise+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/noise+diagram.pgf)

```tex
% http://www.texample.net/media/tikz/examples/TEX/noise-shaper.tex
% Title: Block diagram of Third order noise shaper in Compact Disc Players
% Author: RamÃ³n Jaramillo
\documentclass[tikz,14pt,border=10pt]{standalone}
%%%<
\usepackage{verbatim}
%%%>
\begin{comment}
:Title: Block diagram of Third order noise shaper in Compact Disc Players
:Tags: Diagrams;Block diagrams;Electrical engineering
:Author: RamÃ³n Jaramillo
:Slug: noise-shaper

This is a block diagram of a third-order noise shaper, circuit located inside
of a compact disc player.

Source: A fundamental introduction to the Compact Disc Player (1994), 
located in http://www.tc.umn.edu/~erick205/Papers/3011Paper.pdf, page 17
by Grant M. Erickson
\end{comment}
\usepackage{textcomp}
\usetikzlibrary{shapes,arrows}
\begin{document}
% Definition of blocks:
\tikzset{%
  block/.style    = {draw, thick, rectangle, minimum height = 3em,
    minimum width = 3em},
  sum/.style      = {draw, circle, node distance = 2cm}, % Adder
  input/.style    = {coordinate}, % Input
  output/.style   = {coordinate} % Output
}
% Defining string as labels of certain blocks.
\newcommand{\suma}{\Large$+$}
\newcommand{\inte}{$\displaystyle \int$}
\newcommand{\derv}{\huge$\frac{d}{dt}$}

\begin{tikzpicture}[auto, thick, node distance=2cm, >=triangle 45]
\draw
	% Drawing the blocks of first filter :
	node at (0,0)[right=-3mm]{\Large \textopenbullet}
	node [input, name=input1] {} 
	node [sum, right of=input1] (suma1) {\suma}
	node [block, right of=suma1] (inte1) {\inte}
         node at (6.8,0)[block] (Q1) {\Large $Q_1$}
         node [block, below of=inte1] (ret1) {\Large$T_1$};
    % Joining blocks. 
    % Commands \draw with options like [->] must be written individually
	\draw[->](input1) -- node {$X(Z)$}(suma1);
 	\draw[->](suma1) -- node {} (inte1);
	\draw[->](inte1) -- node {} (Q1);
	\draw[->](ret1) -| node[near end]{} (suma1);
	% Adder
\draw
	node at (5.4,-4) [sum, name=suma2] {\suma}
    	% Second stage of filter 
	node at  (1,-6) [sum, name=suma3] {\suma}
	node [block, right of=suma3] (inte2) {\inte}
	node [sum, right of=inte2] (suma4) {\suma}
	node [block, right of=suma4] (inte3) {\inte}
	node [block, right of=inte3] (Q2) {\Large$Q_2$}
	node at (9,-8) [block, name=ret2] {\Large$T_2$}
;
	% Joining the blocks of second filter
	\draw[->] (suma3) -- node {} (inte2);
	\draw[->] (inte2) -- node {} (suma4);
	\draw[->] (suma4) -- node {} (inte3);
	\draw[->] (inte3) -- node {} (Q2);
	\draw[->] (ret2) -| (suma3);
	\draw[->] (ret2) -| (suma4);
         % Third stage of filter:
	% Defining nodes:
\draw
	node at (11.5, 0) [sum, name=suma5]{\suma}
	node [output, right of=suma5]{}
	node [block, below of=suma5] (deriv1){\derv}
	node [output, right of=suma5] (sal2){}
;
	% Joining the blocks:
	\draw[->] (suma2) -| node {}(suma3);
	\draw[->] (Q1) -- (8,0) |- node {}(ret1);
	\draw[->] (8,0) |- (suma2);
	\draw[->] (5.4,0) -- (suma2);
	\draw[->] (Q1) -- node {}(suma5);
	\draw[->] (deriv1) -- node {}(suma5);
	\draw[->] (Q2) -| node {}(deriv1);
    	\draw[<->] (ret2) -| node {}(deriv1);
    	\draw[->] (suma5) -- node {$Y(Z)$}(sal2);
    	% Drawing nodes with \textbullet
\draw
	node at (8,0) {\textbullet} 
	node at (8,-2){\textbullet}
	node at (5.4,0){\textbullet}
    	node at (5,-8){\textbullet}
    	node at (11.5,-6){\textbullet}
    	;
	% Boxing and labelling noise shapers
	\draw [color=gray,thick](-0.5,-3) rectangle (9,1);
	\node at (-0.5,1) [above=5mm, right=0mm] {\textsc{first-order noise shaper}};
	\draw [color=gray,thick](-0.5,-9) rectangle (12.5,-5);
	\node at (-0.5,-9) [below=5mm, right=0mm] {\textsc{second-order noise shaper}};
\end{tikzpicture}
\end{document}
```
****

![](./src/physics-solenoid.png)

  * [physics-solenoid.tex](https://github.com/walmes/Tikz/blob/master/src/physics-solenoid.pgf)

```tex
% https://wiki.physik.uzh.ch/cms/latex:tikz:solenoid
% Author: Izaak Neutelings (June 2018)
\documentclass[border=3pt,tikz]{standalone}

\usepackage{tikz}
\tikzset{>=latex} % for LaTeX arrow head
\usetikzlibrary{calc} 
\usetikzlibrary{patterns,snakes}

\begin{document}
\begin{tikzpicture}[scale=1]
  \def\R{0.8}
  \def\A{11}   % amplitude
  \def\s{6}    % coil segment length
  \def\L{8}    % coil length
  \def\a{0.5}  % coil segment aspect
  \def\dy{0.9} % vertical shift
  \def\dx{0.2} % horizontal shift
  \draw[snake=coil,thick,segment amplitude=2*\A,segment length=\s,segment aspect=\a]
    (0,0) -- (\L,0);
  \draw[<->,shorten >=5]
    (0,\dy) -- (\L,\dy) node[midway,above] {length $\ell$};
  \draw[snake=brace,mirror snake,segment amplitude=3]
    (0,-\dy) -- (\L,-\dy) node[midway,below=1] {$N$ turns};
  \draw[-,thick]
    (\L,0) -- (1.01*\L,0); % coil extension
  \draw[<->]
    (-\dx,0) -- (-\dx,\R) node[midway,left=6] {$R$};
\end{tikzpicture}
\end{document}
```
****

![](./src/pirates-games.png)

  * [pirates-games.tex](https://github.com/walmes/Tikz/blob/master/src/pirates-games.pgf)

```tex
% https://github.com/FriendlyUser/LatexDiagrams
% calls library tikz-uml.sty
% https://github.com/FriendlyUser/LatexDiagrams/blob/master/EngineeringSoftwareDesign/tikz-uml.sty
\documentclass[border=3mm]{standalone}
\usepackage[english]{babel}
\usepackage{tikz-uml}
\newcommand\blank[1]{\rule[-.2ex]{#1}{.4pt}}

\begin{document}
  \begin{tikzpicture}
%\umlclass[type=interface]{InterfaceA}{}{}
%\umlclass[y=-4]{ClassA}{}{}  
%\umlimpl[stereo=realizes, pos stereo=0.5]{ClassA}{InterfaceA}
%
%\umlclass[x=4, type=interface]{InterfaceB}{}{}
%\umlclass[x=4, y=-4]{ClassB}{}{}  
%\umlimpl[]{ClassB}{InterfaceB}
%\node[] at (3,-2) {<<realizes>>}; 
\umlclass[]{Pirates Game}
	{
		WORLD\blank{0.2cm}SIZE : constant\blank{0.2cm}type = {w:1500,h:1000}  \\
		WINDOW\blank{0.2cm}WIDTH  : constant\blank{0.2cm}type = 750	\\
		WINDOW\blank{0.2cm}HEIGHT : constant\blank{0.2cm}type = 500	
	}
	{
		preload() : void \\
		create() : void \\
		GameLoop() : void \\
		CreateShip(string,Number,Number,Number) : Sprite \\
	}

\umlclass[x=-2,y=-8]{Player}
	{
		+ x : Number \\
		+ y : Number \\
		+ rotation : Number \\
		+ health : Number \\
		+ alive : Boolean \\
		+ shot  : Boolean \\
		+ bullets : Number \\
		+ speed\blank{0.2cm}x : Number \\
		+ speed\blank{0.2cm}y : Number \\
	}
	{
		update () : void \\
	}	

\umlclass[x=4,y=-6]{Bullet}
{
	+ x : Number \\
	+ y : Number \\
	+ speed\blank{0.2cm}x : Number \\
	+ speed\blank{0.2cm}y : Number \\
}
{
}	

\umlclass[x=12,y=-5]{Hearts}
{
	+ x : Number \\
	+ y : Number \\
	+ speed\blank{0.2cm}x : Number \\
	+ speed\blank{0.2cm}y : Number \\
}
{}

\umlclass[x=12,y=0]{Mini-ships}
{
	+ x : Number \\
	+ y : Number \\
	+ speed\blank{0.2cm}x : Number \\
	+ speed\blank{0.2cm}y : Number \\
	+ rotationDirection : Number \\
	+ rotation : Number
}
{
}
\umlnote[x=7,y=-10,width=7.5cm]{Player}{Interactions between players and  game objects is controlled by the server and client. Each player \\ updates their own position.}
\umlunicompo[mult1=spawns,arg1=server,mult2=bullets,pos1=0.35,pos2=0.65]{Pirates Game}{Bullet}
\umlunicompo[mult1=spawns,arg1=server,mult2=Hearts,pos1=0.15,pos2=0.85]{Pirates Game}{Hearts}
\umlunicompo[geometry=|-|,arg1=creates, mult1=server,arg2=player,mult2=client,pos1=1.5,pos2=2.6]{Pirates Game}{Player}
\umlassoc[geometry=-|,arg1=player,mult1=shoots,mult2=bullets]{Player}{Bullet}
\umlunicompo[mult1=spawns,arg1=server,mult2=Mini-ships]{Pirates Game}{Mini-ships}
\umlassoc[geometry=|-|,arg1=destroys,pos1=1.75]{Bullet}{Mini-ships}
\umlassoc[geometry=-|,arg1=destroys,pos1=0.35]{Bullet}{Hearts}
\end{tikzpicture} 
\end{document}
```
****

![](./src/plot-electromagnetic_wave+physics.png)

  * [plot-electromagnetic_wave+physics.tex](https://github.com/walmes/Tikz/blob/master/src/plot-electromagnetic_wave+physics.pgf)

```tex
% https://wiki.physik.uzh.ch/cms/latex:tikz:electromagnetic_wave
    % Author: Izaak Neutelings (May 2018)
% Inspiration: https://tex.stackexchange.com/questions/113900/draw-polarized-light
\documentclass[border=3pt,tikz]{article}
\usepackage[top=0.25in, bottom=0.25in]{geometry}
\usepackage{amsmath} % for \text
\usepackage{tikz}

\tikzset{>=latex} % for LaTeX arrow head

\usepackage{xcolor}

\colorlet{myblue}{black!40!blue}
\colorlet{myred}{black!40!red}

\begin{document}
	
	
	% Electromagnetic wave - black
	\begin{tikzpicture}[x=(-15:1.2), y=(90:1.0), z=(-150:1.0),
	line cap=round, line join=round,
	axis/.style={black, thick,->},
	vector/.style={>=stealth,->}]
	\large
	\def\A{1.5}
	\def\nNodes{5} % use even number
	\def\nVectorsPerNode{8}
	\def\N{\nNodes*40}
	\def\xmax{\nNodes*pi/2*1.01}
	\pgfmathsetmacro\nVectors{(\nVectorsPerNode+1)*\nNodes}
	
	\def\vE{\mathbf{E}}
	\def\vB{\mathbf{B}}
	\def\vk{\mathbf{\hat{k}}}
	
	% main axes
	\draw[axis] (0,0,0) -- ++(\xmax*1.1,0,0) node[right] {$x$};
	\draw[axis] (0,-\A*1.4,0) -- (0,\A*1.4,0) node[right] {$y$};
	\draw[axis] (0,0,-\A*1.4) -- (0,0,\A*1.4) node[above left] {$z$};
	
	% small axes
	\def\xOffset{{(\nNodes-2)*pi/2}}
	\def\yOffset{\A*1.2}
	\def\zOffset{\A*1.2}
	\draw[axis] (\xOffset,\yOffset,-\zOffset) -- ++(\A*0.6,0,0) node[right] {$\vk$};
	\draw[axis] (\xOffset,\yOffset,-\zOffset) -- ++(0,\A*0.6,0) node[right] {$\vE$};
	\draw[axis] (\xOffset,\yOffset,-\zOffset) -- ++(0,0,\A*0.6) node[above left] {$\vB$};
	
	% equation
	\node[above right] at (\xOffset,-0.5*\yOffset,4*\zOffset)
	{$\begin{aligned}
		\vE &= \mathbf{E_0}\sin(\vk\cdot\mathbf{x}-c_0t)\\
		\vB &= \mathbf{B_0}\sin(\vk\cdot\mathbf{x}-c_0t)\\
		\end{aligned}$};
	\node[below right] at (\xOffset,-0.5*\yOffset,4*\zOffset)
	{$\vE\cdot\vk = 0,\;\; \vB\cdot\vk = 0,\;\; \vB = \frac{1}{c_0}\vk\times\vE$};
	
	% waves
	\draw[very thick,variable=\t,domain=0:\nNodes*pi/2*1.01,samples=\N]
	plot (\t,{\A*sin(\t*360/pi)},0);
	\draw[very thick,variable=\t,domain=0:\nNodes*pi/2*1.01,samples=\N]
	plot (\t,0,{\A*sin(\t*360/pi)});
	
	% draw vectors
	\foreach \k [evaluate={\t=\k*pi/2/(\nVectorsPerNode+1);
		\angle=\k*90/(\nVectorsPerNode+1);
		\c=(mod(\angle,90)!=0);}]
	in {1,...,\nVectors}{
		\if\c1
		\draw[vector] (\t,0,0) -- ++(0,{\A*sin(2*\angle)},0);
		\draw[vector] (\t,0,0) -- ++(0,0,{\A*sin(2*\angle)});
		\fi
	}
	
	\end{tikzpicture}
	
	
	
	% Electromagnetic wave - circular polarization
	\begin{tikzpicture}[x=(-15:0.8), y=(90:1.0), z=(-150:1.0),
	line cap=round, line join=round,
	axis/.style={black, thick,->},
	vector/.style={>=stealth,->}]
	\large
	\def\A{1.5}
	\def\nNodes{8} % use even number
	\def\nVectorsPerNode{8}
	\def\N{\nNodes*40}
	\def\xmax{\nNodes*pi/2*1.01}
	\pgfmathsetmacro\nVectors{\nVectorsPerNode*\nNodes}
	
	\def\vE{\mathbf{E}}
	\def\vB{\mathbf{B}}
	\def\vk{\mathbf{\hat{k}}}
	
	% main axes
	\draw[axis] (0,0,0) -- ++(\xmax*1.1,0,0) node[right] {$x$};
	\draw[axis] (0,-\A*1.4,0) -- (0,\A*1.4,0) node[right] {$y$};
	\draw[axis] (0,0,-\A*1.4) -- (0,0,\A*1.4) node[above left] {$z$};
	
	% waves
	\draw[very thick,variable=\t,domain=0:\nNodes*pi/2*1.01,samples=\N]
	plot (\t,{\A*cos(\t*360/pi)},{\A*sin(\t*360/pi)});
	
	% draw vectors
	\foreach \k [evaluate={\t=\k*pi/2/\nVectorsPerNode;
		\angle=\k*90/\nVectorsPerNode;}]
	in {1,...,\nVectors}{
		\draw[vector] (\t,0,0) -- ++(0,{\A*cos(2*\angle)},{\A*sin(2*\angle)});
	}
	
	\end{tikzpicture}
	
	
	
	% Electromagnetic wave - colored
	\begin{tikzpicture}[x=(-15:1.2), y=(90:1.0), z=(-150:1.0),
	line cap=round, line join=round,
	axis/.style={black, thick,->},
	vector/.style={>=stealth,->}]
	\large
	\def\A{1.5}
	\def\nNodes{5} % use even number
	\def\nVectorsPerNode{8}
	\def\N{\nNodes*40}
	\def\xmax{\nNodes*pi/2*1.01}
	\pgfmathsetmacro\nVectors{(\nVectorsPerNode+1)*\nNodes}
	
	\def\vE{{\color{myblue}\mathbf{E}}}
	\def\vB{{\color{myred}\mathbf{B}}}
	\def\vk{\mathbf{\hat{k}}}
	
	\def\drawENode{ % draw E node and vectors with some offset
		\draw[myblue,very thick,variable=\t,domain=\iOffset*pi/2:(\iOffset+1)*pi/2*1.01,samples=40]
		plot (\t,{\A*sin(\t*360/pi)},0);
		\foreach \k [evaluate={\t=\k*pi/2/(\nVectorsPerNode+1);
			\angle=\k*90/(\nVectorsPerNode+1);}]
		in {1,...,\nVectorsPerNode}{
			\draw[vector,myblue!50]  (\iOffset*pi/2+\t,0,0) -- ++(0,{\A*sin(2*\angle+\iOffset*180)},0);
		}
	}
	\def\drawBNode{ % draw B node and vectors with some offset
		\draw[myred,very thick,variable=\t,domain=\iOffset*pi/2:(\iOffset+1)*pi/2*1.01,samples=40]
		plot (\t,0,{\A*sin(\t*360/pi)});
		\foreach \k [evaluate={\t=\k*pi/2/(\nVectorsPerNode+1);
			\angle=\k*90/(\nVectorsPerNode+1);}]
		in {1,...,\nVectorsPerNode}{
			\draw[vector,myred!50]  (\iOffset*pi/2+\t,0,0) -- ++(0,0,{\A*sin(2*\angle+\iOffset*180)});
		}
	}
	
	% main axes
	\draw[axis] (0,0,0) -- ++(\xmax*1.1,0,0) node[right] {$x$};
	\draw[axis] (0,-\A*1.4,0) -- (0,\A*1.4,0) node[right] {$y$};
	\draw[axis] (0,0,-\A*1.4) -- (0,0,\A*1.4) node[above left] {$z$};
	
	% small axes
	\def\xOffset{{(\nNodes-2)*pi/2}}
	\def\yOffset{\A*1.2}
	\def\zOffset{\A*1.2}
	\draw[axis,black] (\xOffset,\yOffset,-\zOffset) -- ++(\A*0.6,0,0) node[right,align=center] {$\mathbf{\hat{k}}$}; %\\propagation
	\draw[axis,myblue]  (\xOffset,\yOffset,-\zOffset) -- ++(0,\A*0.6,0) node[right] {$\mathbf{E}$};
	\draw[axis,myred]   (\xOffset,\yOffset,-\zOffset) -- ++(0,0,\A*0.6) node[above left] {$\mathbf{B}$};
	
	% equation
	\node[above right] at (\xOffset,-0.5*\yOffset,4*\zOffset)
	{$\begin{aligned}
		\vE &= {\color{myblue}\mathbf{E_0}}\sin(\vk\cdot\mathbf{x}-c_0t)\\
		\vB &= {\color{myred} \mathbf{B_0}}\sin(\vk\cdot\mathbf{x}-c_0t)\\
		\end{aligned}$};
	\node[below right] at (\xOffset,-0.5*\yOffset,4*\zOffset)
	{$\vE\cdot\vk = 0,\;\; \vB\cdot\vk = 0,\;\; \vB = \frac{1}{c_0}\vk\times\vE$};
	
	% draw (anti-)nodes
	\foreach \iNode [evaluate={\iOffset=\iNode-1;}] in {1,...,\nNodes}{
		\ifodd\iNode \drawBNode \drawENode % E overlaps B
		\else        \drawENode \drawBNode % B overlaps E
		\fi
	}
	
	\end{tikzpicture}
	
	
	
\end{document}
```
****

![](./src/plot-intersections+geometry.png)

  * [plot-intersections+geometry.tex](https://github.com/walmes/Tikz/blob/master/src/plot-intersections+geometry.pgf)

```tex
\documentclass[tikz,border=10pt]{standalone}
%\documentclass[crop, tikz]{standalone}

\usepackage{tikz}

\begin{document}
	
\usetikzlibrary{arrows}
\begin{tikzpicture}[
scale=5,
axis/.style={very thick, ->, >=stealth'},
important line/.style={thick},
dashed line/.style={dashed, thin},
pile/.style={thick, ->, >=stealth', shorten <=2pt, shorten
	>=2pt},
every node/.style={color=black}
]
% axis
\draw[axis] (-0.1,0)  -- (1.1,0) node(xline)[right]
{$G\uparrow/T\downarrow$};
\draw[axis] (0,-0.1) -- (0,1.1) node(yline)[above] {$E$};
% Lines
\draw[important line] (.15,.15) coordinate (A) -- (.85,.85)
coordinate (B) node[right, text width=5em] {$Y^O$};
\draw[important line] (.15,.85) coordinate (C) -- (.85,.15)
coordinate (D) node[right, text width=5em] {$\mathit{NX}=x$};
% Intersection of lines
\fill[red] (intersection cs:
first line={(A) -- (B)},
second line={(C) -- (D)}) coordinate (E) circle (.4pt)
node[above,] {$A$};
% The E point is placed more or less randomly
\fill[red]  (E) +(-.075cm,-.2cm) coordinate (out) circle (.4pt)
node[below left] {$B$};
% Line connecting out and ext balances
\draw [pile] (out) -- (intersection of A--B and out--[shift={(0:1pt)}]out)
coordinate (extbal);
\fill[red] (extbal) circle (.4pt) node[above] {$C$};
% line connecting  out and int balances
\draw [pile] (out) -- (intersection of C--D and out--[shift={(0:1pt)}]out)
coordinate (intbal);
\fill[red] (intbal) circle (.4pt) node[above] {$D$};
% line between out og all balanced out :)
\draw[pile] (out) -- (E);
\end{tikzpicture}
	
\end{document}
```
****

![](./src/plot-linear-regression+geometry.png)

  * [plot-linear-regression+geometry.tex](https://github.com/walmes/Tikz/blob/master/src/plot-linear-regression+geometry.pgf)

```tex
% Linear regression
% Author: Henri Menke
\documentclass[tikz,border=10pt]{standalone}
\usetikzlibrary{arrows,intersections}

\begin{document}

\begin{tikzpicture}[
    thick,
    >=stealth',
    dot/.style = {
      draw,
      fill = white,
      circle,
      inner sep = 0pt,
      minimum size = 4pt
    }
  ]
  \coordinate (O) at (0,0);
  \draw[->] (-0.3,0) -- (8,0) coordinate[label = {below:$x$}] (xmax);
  \draw[->] (0,-0.3) -- (0,5) coordinate[label = {right:$f(x)$}] (ymax);
  \path[name path=x] (0.3,0.5) -- (6.7,4.7);
  \path[name path=y] plot[smooth] coordinates {(-0.3,2) (2,1.5) (4,2.8) (6,5)};
  \scope[name intersections = {of = x and y, name = i}]
    \fill[gray!20] (i-1) -- (i-2 |- i-1) -- (i-2) -- cycle;
    \draw      (0.3,0.5) -- (6.7,4.7) node[pos=0.8, below right] {Sekante};
    \draw[red] plot[smooth] coordinates {(-0.3,2) (2,1.5) (4,2.8) (6,5)};
    \draw (i-1) node[dot, label = {above:$P$}] (i-1) {} -- node[left]
      {$f(x_0)$} (i-1 |- O) node[dot, label = {below:$x_0$}] {};
    \path (i-2) node[dot, label = {above:$Q$}] (i-2) {} -- (i-2 |- i-1)
      node[dot] (i-12) {};
    \draw           (i-12) -- (i-12 |- O) node[dot,
                              label = {below:$x_0 + \varepsilon$}] {};
    \draw[blue, <->] (i-2) -- node[right] {$f(x_0 + \varepsilon) - f(x_0)$}
                              (i-12);
    \draw[blue, <->] (i-1) -- node[below] {$\varepsilon$} (i-12);
    \path       (i-1 |- O) -- node[below] {$\varepsilon$} (i-2 |- O);
    \draw[gray]      (i-2) -- (i-2 -| xmax);
    \draw[gray, <->] ([xshift = -0.5cm]i-2 -| xmax) -- node[fill = white]
      {$f(x_0 + \varepsilon)$}  ([xshift = -0.5cm]xmax);
  \endscope
\end{tikzpicture}
\end{document}
```
****

![](./src/plot-physics-functions.png)

  * [plot-physics-functions.tex](https://github.com/walmes/Tikz/blob/master/src/plot-physics-functions.pgf)

```tex
% https://wiki.physik.uzh.ch/cms/latex:tikz:functions
    % Author: Izaak Neutelings (June, 2017)
% based on code from a friend

\documentclass{article}
\usepackage[top=0.25in]{geometry}
\usepackage{amsmath} % for \dfrac
\usepackage{tikz}
\tikzset{>=latex} % for LaTeX arrow head
\usepackage{pgfplots} % for the axis environment

%% split figures into pages
%\usepackage[active,tightpage]{preview}
%\PreviewEnvironment{tikzpicture}
%\setlength\PreviewBorder{1pt}%

\pagestyle{empty}

\begin{document}
	
	% DRAW PLOT: sin, cos, tan
	\begin{tikzpicture}[domain=-pi:pi,xscale=2/pi]
	
	% limits
	\def\xa{ -pi-0.3}
	\def\xb{3*pi+0.4}
	\def\ya{-3.4}
	\def\yb{ 3.6}
	\def\N{100} % number of points
	
	% axes & grid
	\draw[xstep=pi/2,very thin, color=gray]
	(\xa,\ya) grid (\xb,\yb);
	\draw[->]
	(\xa,0) -- (\xb,0)
	node[right] {$x$};
	\draw[->]
	(0,\ya) -- (0,\yb)
	node[left] {$y$};
	
	% ticks
	\draw[] % x
	node[below,scale=0.9] at ( -pi,   0) {$-\pi$}
	node[below,scale=0.9] at ( -pi/2, 0) {$-\dfrac{\pi}{2}$}
	node[below,scale=0.9] at (  pi,   0) {$\pi$}
	node[below,scale=0.9] at (     0, 0) {0}
	node[below,scale=0.9] at (  pi/2, 0) {$\dfrac{\pi}{2}$}
	node[below,scale=0.9] at (  pi,   0) {$\pi$}
	node[below,scale=0.9] at (3*pi/2, 0) {$\dfrac{3\pi}{2}$}
	node[below,scale=0.9] at (2*pi,   0) {$2\pi$}
	node[below,scale=0.9] at (5*pi/2, 0) {$\dfrac{5\pi}{2}$}
	node[below,scale=0.9] at (3*pi,   0) {$3\pi$};
	\draw[] % y
	node[left,scale=0.9] at ( 0,  3) {$3$}
	node[left,scale=0.9] at ( 0,  2) {$2$}
	node[left,scale=0.9] at ( 0,  1) {$1$}
	node[left,scale=0.9] at ( 0,  0) {$0$}
	node[left,scale=0.9] at ( 0, -1) {$-1$}
	node[left,scale=0.9] at ( 0, -2) {$-2$}
	node[left,scale=0.9] at ( 0, -3) {$-3$};
	
	% functions
	\def\ea{0.28}
	\def\eb{0.26}
	\draw[color=blue,samples=\N,domain=\xa:\xb] % SIN
	plot(\x,{sin(\x r)}) % r for radians
	node[above right] at (5*pi/2,1) {$\sin(x)$};
	\draw[color=red,samples=\N,domain=\xa:\xb] % COS
	plot(\x,{cos(\x r)})
	node[above left] at (2*pi,1) {$\cos(x)$};
	\draw[color=orange] % TAN
	plot[samples=\N,domain=  \xa     :   -pi/2-\eb] (\x, {tan(\x r)})
	plot[samples=\N,domain=  -pi/2+\ea:   pi/2-\eb] (\x, {tan(\x r)})
	plot[samples=\N,domain=   pi/2+\ea: 3*pi/2-\eb] (\x, {tan(\x r)})
	plot[samples=\N,domain= 3*pi/2+\ea: 5*pi/2-\eb] (\x, {tan(\x r)})
	plot[samples=\N,domain= 5*pi/2+\ea:  \xb      ] (\x, {tan(\x r)})
	node[samples=\N,right=-2pt] at (pi/2,2.5) {$\tan(x)$};
	
	\end{tikzpicture}
	
\vspace{24pt}
	
	% AXIS ENVIRONMENT: sin, cos, tan
	\begin{tikzpicture}
	\begin{axis}[enlargelimits=false,
	axis lines=middle,
	scale=1.2,
	xtick={-3.15159, -1.57080, 0,
		1.57080,  3.15159, 4.71239,
		6.28318,  7.85398, 9.42478 }, 
	xticklabels={$-\pi$, $-\frac{1}{2}\pi$, 0,
		$\frac{1}{2}\pi$, $\pi$, $\frac{3}{2}\pi$,
		$2\pi$, $\frac{5}{2}\pi$, $3\pi$ },
	ytick={-3,-2,-1,0,1,2,3},
	grid=major, % only a grid on the defined ticks
	samples=100 % number of points
	]
	
	% sin
	\addplot[blue,no marks,domain=-1.2*pi:3*pi]{sin(deg(x))}; % deg to convert radians
	\node[right=10pt,above] at (axis cs:5*pi/2,1){\color{blue}$\sin(x)$};
	
	% cos
	\addplot[red,no marks,domain=-1.2*pi:3*pi] {cos(deg(x))};
	\node[above left] at (axis cs:2*pi,1){\color{red}$\cos(x)$};
	
	% tan, multiple parts because of singularities
	\addplot[orange,no marks,domain=-1.2*pi:-0.583*pi, ]{tan(deg(x))};
	\addplot[orange,no marks,domain=-0.4*pi:5*pi/12,   ]{tan(deg(x))};
	\addplot[orange,no marks,domain=27*pi/45:17*pi/12, ]{tan(deg(x))};
	\addplot[orange,no marks,domain=1.6*pi:29*pi/12,   ]{tan(deg(x))};
	\addplot[orange,no marks,domain=2.6*pi:36*pi/12,   ]{tan(deg(x))};
	\node[right] at (axis cs:pi/2,2.5){\color{orange}$\tan(x)$};
	
	\end{axis}
	\end{tikzpicture}
	
\vspace{24pt}	
	
	% AXIS ENVIRONMENT: arcsin, arccos, arctan
	\begin{tikzpicture}
	\begin{axis}[enlargelimits=false,
	axis lines=middle,
	xtick={-2,-1,0,1,2},
	ytick={-1.570780, 1.570780, 3.14159},
	yticklabels={$-\frac{1}{2}\pi$,$\frac{1}{2}\pi$,$\pi$},
	grid=major,
	samples=100
	]
	
	% arcsin
	\addplot[domain=-1:1,no marks,blue] {rad(asin(x))};
	\node at (axis cs:1.52,1.4){\color{blue}$\arcsin(x)$};
	
	% arccos
	\addplot[domain=-1:1,no marks,red] {rad(acos(x))};
	\node at (axis cs:-1.5,2.8){\color{red}$\arccos(x)$};
	
	% arctan
	\addplot[domain=-2:2,no marks,orange] {rad(atan(x))};
	\node at (axis cs:1.52,.67){\color{orange}$\arctan(x)$};
	
	\end{axis}
	\end{tikzpicture}
	
\end{document}
```
****

![](./src/plot-shading_regions+geometry+pgf+command+def.png)

  * [plot-shading_regions+geometry+pgf+command+def.tex](https://github.com/walmes/Tikz/blob/master/src/plot-shading_regions+geometry+pgf+command+def.pgf)

```tex
\documentclass[border=10mm]{standalone}
\usepackage{pgfplots}
\usepackage{tkz-fct}
\usetikzlibrary{intersections,backgrounds}


\newcommand{\vasymptote}[3][]{
    \draw [densely dashed,name path=#3,#1] ({rel axis cs:0,0} -| {axis cs:#2,0}) -- ({rel axis cs:0,1} -| {axis cs:#2,0});
}

\newcommand{\gettikzxy}[3]{%
  \tikz@scan@one@point\pgfutil@firstofone#1\relax
  \edef#2{\the\pgf@x}%
  \edef#3{\the\pgf@y}%
}

\pgfplotsset{
    every axis/.append style={
        scale only axis,
        width=1.0\columnwidth,
    },
    /tikz/every picture/.append style={
        trim axis left,
        trim axis right,
    }
}

\def\Dimline[#1][#2][#3][#4]{
\begin{scope}[thin, >=stealth'] % redefine as flechas
\draw let \p1=#1, \p2=#2, \n0={veclen(\x2-\x1,\y2-\y1)} in [|<->|,
decoration={markings,mark=at position .5 with {\node[#3] at (0,0)
{#4};},
},
postaction=decorate] #1 -- #2 ;
\end{scope}
}
\begin{document}

\begin{tikzpicture}
 \begin{axis}[
	   xmin = 0, xmax = 1000,
	   ymin = 12, ymax = 16,
	   xlabel=$Q$,
	   ylabel=$P$,
	  ]
	  \addplot[name path global=supply, domain=0:1000, red] { 0.00325*x + 12.5125 };
	  \addplot[name path global=demand, domain=0:1000, blue] { -0.013*x + 22.75 };
	  \addplot[name path global=world, domain=0:1000, black] { 13 };
	  \addplot[name path global=tariff, domain=0:1000, green] { 13.65 };
	
	
	  \node at (axis cs:100, 13.3) {$A$};
	  \node at (axis cs:300, 13.3) {$B$};
	  \node at (axis cs:550, 13.3) {$C$};
	  \node at (axis cs:720, 13.1) {$D$};
	
	  \vasymptote[dashed]{350}{first}
	  \vasymptote[dashed]{700}{second}
	
	  \legend{Supply, Demand, $P_\mathrm{world}$, $P_\mathrm{tariff}$}
	
	  \path [name intersections={of=supply and world, by={a}},
	         name intersections={of=supply and tariff, by={b}},
	         name intersections={of=first and world, by={c}},
	         name intersections={of=second and world, by={d}},
	         name intersections={of=demand and tariff, by={e}},
	         name intersections={of=demand and world, by={f}}];
	
	 \begin{scope}[on background layer]
		\fill [blue,opacity=.3] (axis cs:0,13) -- (axis cs:0,13.65) -- (b) -- (a) -- cycle;
		\fill [red,opacity=.3] (a) -- (b) -- (c) -- cycle;
		\fill [green,opacity=.3] (b) -- (c) -- (d) -- (e) -- cycle;
		\fill [purple,opacity=.3] (e) -- (d) -- (f) -- cycle;
	 \end{scope}
 \end{axis}

\end{tikzpicture}

\end{document}
```
****

![](./src/plot-two_plots_same_axis+fileio+pgf.png)

  * [plot-two_plots_same_axis+fileio+pgf.tex](https://github.com/walmes/Tikz/blob/master/src/plot-two_plots_same_axis+fileio+pgf.pgf)

```tex
\documentclass[border=10pt]{standalone}

\usepackage{pgfplots}
\pgfplotsset{compat=newest}


\begin{document}

% Preamble: \pgfplotsset{width=7cm,compat=newest}
\begin{tikzpicture}
    \begin{axis}
	    [
	    height=9cm,
	    width=9cm,
	    grid=major,
	    ]
	    % \addplot gnuplot[id=filesuffix]{(-x**5 - 242)};
	    \addlegendentry{model}
		    
		    \addplot coordinates {
			    (-4.77778,2027.60977)
			    (-3.55556,347.84069)
			    (-2.33333,22.58953)
			    (-1.11111,-493.50066)
			    (0.11111,46.66082)
			    (1.33333,-205.56286)
			    (2.55556,-341.40638)
			    (3.77778,-1169.24780)
			    (5.00000,-3269.56775)
			    };
		    \addlegendentry{estimate}
	    \end{axis}
    \end{tikzpicture}


\end{document}
```
****

![](./src/porter_model+diagram.png)

  * [porter_model+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/porter_model+diagram.pgf)

```tex
% http://www.texample.net/media/tikz/examples/TEX/porter-model.tex
% Porter model
% Author: Charles-Axel Dein
\documentclass[10pt,a4paper]{article} 

\usepackage[hmargin=2cm,vmargin=1cm]{geometry}
\renewcommand{\rmdefault}{bch} % change default font

\usepackage[english]{babel}
\usepackage[utf8]{inputenc}
\usepackage{tikz} 
\usetikzlibrary{arrows,decorations.pathmorphing,backgrounds,fit,positioning,shapes.symbols,chains}

%%%<
\usepackage{verbatim}
\usepackage[active,tightpage,floats]{preview}
\setlength\PreviewBorder{5pt}%
%%%>

\begin{comment}
:Title: Porter model

A Porter five (or six) forces model.


\end{comment}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% BEGIN DOCUMENT
\begin{document}

\begin{figure}[h]

\centering
\begin{tikzpicture}
[node distance = 1cm, auto,font=\footnotesize,
% STYLES
every node/.style={node distance=3cm},
% The comment style is used to describe the characteristics of each force
comment/.style={rectangle, inner sep= 5pt, text width=4cm, node distance=0.25cm, font=\scriptsize\sffamily},
% The force style is used to draw the forces' name
force/.style={rectangle, draw, fill=black!10, inner sep=5pt, text width=4cm, text badly centered, minimum height=1.2cm, font=\bfseries\footnotesize\sffamily}] 

% Draw forces
\node [force] (rivalry) {Rivalry among existing competitors};
\node [force, above of=rivalry] (substitutes) {Threat of substitutes};
\node [force, text width=3cm, dashed, left=1cm of substitutes] (state) {Public policies};
\node [force, left=1cm of rivalry] (suppliers) {Bargaining power of suppliers};
\node [force, right=1cm of rivalry] (users) {Bargaining power of users};
\node [force, below of=rivalry] (entrants) {Threat of new entrants};

%%%%%%%%%%%%%%%
% Change data from here

% RIVALRY
\node [comment, below=0.25 of rivalry] (comment-rivalry) {(+) A war against Microsoft\\
(+) Limiting sunk costs\\
(+) Coopetition};

% SUPPLIERS
\node [comment, below=0.25cm of suppliers] {(+) Efficiency\\
(+) Attracting other developers\\
(+) Creating a Chrome community};

% SUBSTITUTES
\node [comment, right=0.25 of substitutes] {(+) Portability};

% USERS
\node [comment, below=0.25 of users] {(+) Increasing the user information\\
(+) Reducing the switching costs};

% NEW ENTRANTS
\node [comment, right=0.25 of entrants] {(+) EC vs. Microsoft};

% PUBLIC POLICIES
\node [comment, text width=3cm, below=0.25 of state] {(+) Positively framed\\
(+) Transparency\\
(--) A new monopoly?};

%%%%%%%%%%%%%%%%

% Draw the links between forces
\path[->,thick] 
(substitutes) edge (rivalry)
(suppliers) edge (rivalry)
(users) edge (rivalry)
(entrants) edge (comment-rivalry);

\end{tikzpicture} 
\caption{FOSS in Chrome influences industry structure by increasing competition}
\label{fig:6forces}
\end{figure}

\end{document}
```
****

![](./src/scenario_tree+diagram.png)

  * [scenario_tree+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/scenario_tree+diagram.pgf)

```tex
% http://www.texample.net/media/tikz/examples/TEX/scenario-tree.tex
% Scenario tree
% Author: Rasmus Pank Roulund
\documentclass[border=5pt]{standalone}
\usepackage{tikz}
\usepackage{verbatim}

\begin{comment}
:Title: Scenario tree
:Tags: Trees

A scenario tree from the field of economics. The figure is a replication of a figure 4 from
Barry Eichengreen's NBER paper on "Hegemonic Stability Theories of the International Monetary System" 
from 1987 (PDF_). 

.. _PDF: http://papers.nber.org/papers/W2193.pdf

:Author: Rasmus Pank Roulund

\end{comment}

\usetikzlibrary{shapes}
\usepackage{amsmath}
\usepackage{xspace}
\newcommand{\A}{\ensuremath{\mathcal{A}}\xspace}
\newcommand{\B}{\ensuremath{\mathcal{B}}\xspace}
\newcommand\pa[1]{\ensuremath{\left(#1\right)}}
\begin{document}
\begin{tikzpicture}[
    grow=right,
    level 1/.style={sibling distance=3.5cm,level distance=5.2cm},
    level 2/.style={sibling distance=3.5cm, level distance=6.7cm},
    edge from parent/.style={very thick,draw=blue!40!black!60,
        shorten >=5pt, shorten <=5pt},
    edge from parent path={(\tikzparentnode.east) -- (\tikzchildnode.west)},
    kant/.style={text width=2cm, text centered, sloped},
    every node/.style={text ragged, inner sep=2mm},
    punkt/.style={rectangle, rounded corners, shade, top color=white,
    bottom color=blue!50!black!20, draw=blue!40!black!60, very
    thick }
    ]

\node[punkt, text width=5.5em] {Country~\B}
    %Lower part lv1
    child {
        node[punkt] [rectangle split, rectangle split, rectangle split parts=3,
         text ragged] {
            \textbf{Scenario  1}
                  \nodepart{second}
            $\text{Country \B}\colon    s\bar{Q}$
                  \nodepart{third}
            $\text{Country \A}\colon\pa{1-s}\bar{Q}$
        }
        edge from parent
            node[kant, below, pos=.6] {Unchanged parity}
    }
    %Upper part, lv1
    child {
        node[punkt, text width=6em] {Country~\A}
        %child 1
        child {
            node [punkt,rectangle split, rectangle split,
            rectangle split parts=3] {
                \textbf{Scenario  2}
                \nodepart{second}
                $\text{Country \B}\colon s\bar{Q}+2\alpha\Delta E -sc$
                \nodepart{third}
                $\text{Country \A}\colon\pa{1-s}\bar{Q}-\alpha\Delta E -
                \pa{1-s}c$
            }
            edge from parent
                node[below, kant,  pos=.6] {Unchanged parity}
        }
        %child 2
        child {
            node [punkt, rectangle split, rectangle split parts=3]{
                \textbf{Scenario 3}
                \nodepart{second}
                $\text{Country \B}\colon s\bar{Q}-2sc$
                \nodepart{third}
                $\text{Country \A}\colon\pa{1-s}\bar{Q}-2\pa{1-s}c$
            }
            edge from parent
                node[kant, above] {Devalues}}
            edge from parent{
                node[kant, above] {Devalues}}
    };
\end{tikzpicture}
\end{document}
```
****

![](./src/server_player+diagram.png)

  * [server_player+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/server_player+diagram.pgf)

```tex
% https://tex.stackexchange.com/questions/188582/tikz-is-it-possible-to-draw-this-block-diagram
\documentclass[border=3pt]{standalone}
\usepackage{tikz}
\usetikzlibrary{positioning,fit,patterns}

\tikzset{
  pics/media/.style ={
    code = { %
      \node[text width=2cm,minimum height=2cm,#1] (back) {};
      \node[draw,anchor=center,fill=white] at ([yshift=5pt]back.center) {Media};
      \draw[dashed] (back.north west) rectangle (back.south east);
    }
  },
  pics/media/.default={pattern=north east lines},
  aes/.style={
    draw,
    fill=red!30
  },
  rsa/.style={
    draw,
    rounded corners,
    fill=blue!30
  },
  ar/.style={
    ->,
    >=latex,
    shorten >= 3pt,
    shorten <= 3pt,    
  },
  ar2/.style={
    ->,
    >=latex,
    line width=2pt,
    shorten >= 3pt,
    shorten <= 3pt,    
  }
}

\newcommand\mediaencryptedbox[3][1cm]{
\node[
  draw,
  thick,
  rounded corners,
  #2,
  text width=3.5cm,
  minimum height=4.5cm,
  anchor=north west,
  yshift=#1
  ]
  (#3)
  {};
\node[
  aes,
  anchor=north
  ]
  at (#3.north) 
  {AES key}; 
\pic at (#3.center) (sm3) {media};
\node[
  anchor=south
  ]
  (rsa)  
  at (sm3back.north) 
  {Encrypted with RSA};
\node[
  anchor=north
  ] 
  at (sm3back.south) 
  {Encrypted with AES};
\draw
  (#3.west|-rsa.south) -- (#3.east|-rsa.south);
}

\begin{document}

\begin{tikzpicture}

% The Server
\pic (sm1) {media={fill=gray!30}};
\pic[right=of sm1back] (sm2) {media};
\mediaencryptedbox{right=of sm2back}{box1}
\node[
  aes,
  anchor=north,
  above=of sm2back.north
  ]
  (aes1)
  {AES key};  
\draw[ar]
  (aes1) -- (sm2back.north) ;  
\draw[ar]
  (aes1.south east) to[out=-60,in=180] coordinate (aux1) (box1.north west) ;
\node[
  anchor=west,
  rsa
  ]
  at (aux1|-aes1)
  (rsa1)
  {RSA public key};    

\draw[ar]
  (rsa1) -- (aux1) ;  

\draw[ar2]
  (sm1back.east) -- (sm2back.west);
\draw[ar2]
  (sm2back.east) -- (box1.west|-sm2back.east);

\node[
  inner sep=10pt,
  draw,
  dashed,fit={(sm1back.north west) (box1.south east) (aes1)}
  ]
  (server) 
  {};
\node[
  anchor=south west,
  font=\Large
  ]
  at ([shift={(15pt,5pt)}]server.north west)
  {Server};      

% The Player
\mediaencryptedbox[2.2cm]{right=6cm of box1}{box2}
\node[
  anchor=north west,
  rsa,
  above left=of box2
  ]
  (rsa2)
  {RSA public key};    
\draw[ar]
  (rsa2.south) 
    to[out=-80,in=160]
    node[align=center,anchor=east,shift={(10pt,-20pt)}] {RSA decryption \\ (slow)} 
  ([yshift=-20pt]box2.north west);
\draw[ar]
  ([yshift=-10pt]box2.north east) 
    to[out=0,in=0]
    node[align=center,anchor=west,shift={(5pt,0pt)}] (AESd) {AES decryption \\ (fast)} 
  (sm3back.east);
\node[
  inner sep=10pt,
  draw,
  dashed,fit={(rsa2) (box2.south east) (AESd)}
  ]
  (player) 
  {};
\node[
  anchor=south west,
  font=\Large
  ]
  at ([shift={(15pt,5pt)}]player.north west)
  {Player};

\draw[ar2]
  (server.east) -- (player.west|-server.east);        
\draw[ar2]
  ([yshift=10pt]sm3back.south east) -- ++(3cm,0) node[near end,anchor=south west] {Streaming};
\end{tikzpicture}

\end{document}
```
****

![](./src/simple-wrong+diagram.png)

  * [simple-wrong+diagram.tex](https://github.com/walmes/Tikz/blob/master/src/simple-wrong+diagram.pgf)

```tex
\documentclass[tikz,border=10pt]{standalone}

\usepackage{tikz}
\usetikzlibrary{shapes,arrows}
\begin{document}
	
	\tikzstyle{block} = [draw, fill=white, rectangle, 
	minimum height=3em, minimum width=6em]
	\tikzstyle{sum} = [draw, fill=white, circle, node distance=1cm]
	\tikzstyle{input} = [coordinate]
	\tikzstyle{output} = [coordinate]
	\tikzstyle{pinstyle} = [pin edge={to-,thin,black}]
	
	\begin{tikzpicture}[auto, node distance=2cm,>=latex']
	
	\node [input, name=input] {};
	\node [sum, right of=input] (sum) {};
	\node [block, right of=sum] (controller) {Controller};
	\node [block, right of=controller, pin={[pinstyle]above:D},
	node distance=3cm] (system) {System};
	
	\draw [->] (controller) -- node[name=u] {$u$} (system);
	\node [output, right of=system] (output) {};
	\node [block, below of=u] (measurements) {Measurements};
	
	\draw [draw,->] (input) -- node {$r$} (sum);
	\draw [->] (sum) -- node {$e$} (controller);
	\draw [->] (system) -- node [name=y] {$y$}(output);
	\draw [->] (y) |- (measurements);
	\draw [->] (measurements) -| node[pos=0.99] {$-$} 
	node [near end] {$y_m$} (sum);
	\end{tikzpicture}
\end{document}
```
****

![](./src/time-added-dots+timeline+style+text.png)

  * [time-added-dots+timeline+style+text.tex](https://github.com/walmes/Tikz/blob/master/src/time-added-dots+timeline+style+text.pgf)

```tex
% https://tex.stackexchange.com/a/303028/173708
\documentclass{article}
\usepackage{tikz}
\usetikzlibrary{arrows,positioning,decorations.pathreplacing}
\usepackage{lipsum}

\begin{document}
\lipsum[1]

\begin{center}
\makebox[\textwidth]{
\begin{tikzpicture}[
  every node/.style = {align=center},
        Line/.style = {-angle 90, shorten <=-2pt},
  Brace/.style args = {#1}{semithick, 
  							decorate, 
  							decoration={brace, 
  								#1, 
  								raise=20pt, 
  								pre=moveto, 
  								pre length=2pt, 
  								post=moveto, 
  								post length=2pt,}},
          ys/.style = {yshift=#1}
                  ]
	\linespread{0.8}                    
	\coordinate (a) at (0,0);
	\coordinate[right=30mm of a]    (b);
	\coordinate[right=30mm of b]    (c);
	\coordinate[right= 20mm of c]   (d);
	\coordinate[right=24mm of d]    (e);
	\coordinate[right= 5mm of e]    (f);
	\coordinate[right=22mm of f]    (g);
	
	%  adding * specs to the Line \draw macros for the dot
	\draw[Line,*-]  (a) --  (g) node[right] {$x$};
	\draw[Line, *-] (b) --  (c) ;
	\draw[Line, *-] (d) --  (e) ;
	\draw[Line, *-] (f) --  (g) ;
	
	\draw[Brace=mirror] (a) -- node[below=20pt] {Compensation} (b);
	\draw[Brace=mirror] (b) -- node[below=20pt] {Gift} (d);
	
	\draw ([ys=0mm] a) node[below] {0} -- (a);
	\draw ([ys=0mm] b) node[below] {$\theta s$} -- (b);
	\draw[Line, shorten >=4pt] ([ys=10mm]  c) node[above] {$\delta$} -- (c);
	\draw[Line, shorten >=4pt] ([ys=10mm]  d) node[above] {$x(\delta)$} -- (d);
	\draw ([ys=0mm]  d) node[below] {$\theta s + w$} -- (d);
	
	\draw ([ys=0mm]  f) node[below] {$z$} -- (f);
\end{tikzpicture}
}
\end{center}
\lipsum[2]
\end{document}
```
****

![](./src/time-annuity+timeline+foreach+learn.png)

  * [time-annuity+timeline+foreach+learn.tex](https://github.com/walmes/Tikz/blob/master/src/time-annuity+timeline+foreach+learn.pgf)

```tex
% https://www.latex4technics.com/?note=5rc
% https://tex.stackexchange.com/a/241153/173708
\documentclass[tikz]{standalone}

\begin{document}
\begin{tikzpicture}
  \draw[line width=1pt] (0,0) -- node[below=1mm,pos=0.6,scale=2] {$\cdots$} (10,0)node[right=4mm]{(periods)};
  \foreach \x/\y in {0/0,1/1,2/2,3/3,9/$n-1$,10/$n$}{
    \draw[line width=1pt] (\x,-2mm)node[below](\x){\strut\y} -- (\x,2mm)node[above]{$\$ 1$};
    }
    \draw[-latex] (0,-7mm) -- +(0,-10mm)node[below]{$A_{ni}$};
    \draw[-latex] (10,-7mm) -- +(0,-10mm)node[below]{$S_{ni}$};
\end{tikzpicture}
\end{document}
```
****

![](./src/time-arrows_to_nodes-arr+timeline+tree+scope+learn.png)

  * [time-arrows_to_nodes-arr+timeline+tree+scope+learn.tex](https://github.com/walmes/Tikz/blob/master/src/time-arrows_to_nodes-arr+timeline+tree+scope+learn.pgf)

```tex
% https://wiki.physik.uzh.ch/cms/latex:tikz:arrows_to_nodes

% How to break text lines: https://tex.stackexchange.com/a/124114/173708

% Author: Izaak Neutelings (September 2018)
\documentclass[border=3pt,tikz]{standalone}
\usepackage{amsmath} % for \;
\usepackage{tikz}
\usepackage{xcolor}

\colorlet{myblue}{blue!70!black}
\colorlet{mylightblue}{blue!10}
\tikzset{>=latex} % for LaTeX arrow head

\begin{document}


\begin{tikzpicture}[yscale=0.8,anchor=west]
  
  % FIRST COLUMN
  \node[anchor=west,draw=myblue,fill=mylightblue,thick,rounded corners=4,inner sep=1.5pt] (L) at (0,4) {\;\strut$qq\nu\nu$\;};  
  \node (L1) at (0.5,3) {\strut$jj\nu\nu$};
  \node (L2) at (-1.5,2) [draw, text width=1cm] {common text};   % break a line in two
  \node (L3) at (0.5,1) {\strut tt$\nu\nu$};
  \draw[->,myblue,thick] (L.south west) ++ (0.18,0) |- (L1.west);
  \draw[->,myblue,thick] (L.south west) ++ (0.18,0) |- (L2.east);
  \draw[->,myblue,thick] (L.south west) ++ (0.18,0) |- (L3.west);
  
  % SECOND COLUMN
  \begin{scope}[shift={(2.5,0)}]
    \node[draw=myblue,fill=mylightblue,thick,rounded corners=4,inner sep=1.5pt] (M) at (0,4) {\;\strut$qq\ell\ell$\;};
    \node (M1) at (0.5,3) {\strut$jj\mu\mu$};
    \node (M2) at (0.5,2) {\strut bb$\tau\tau$, b$\tau\tau$};
    \node (M3) at (0.5,1) {\strut tt$\tau\tau$};
    \draw[->,myblue,thick] (M.south west)++(0.18,0) |- (M1.west);
    \draw[->,myblue,thick] (M.south west)++(0.18,0) |- (M2.west);
    \draw[->,myblue,thick] (M.south west)++(0.18,0) |- (M3.west);
  \end{scope}
  
  % THIRD COLUMN
  \begin{scope}[shift={(5.0,0)}]
    \node[draw=myblue,fill=mylightblue,thick,rounded corners=4,inner sep=1.5pt] (R) at (0,4) {\;\strut$qq\ell\nu$\;};
    \node (R1) at (0.5,3) {\strut$jj\mu\nu$};
    \draw[->,myblue,thick] (R.south west)++(0.18,0) |- (R1.west);
  \end{scope}

\end{tikzpicture}


\end{document}
```
****

![](./src/time-arrows-circles+timeline+pgf+set.png)

  * [time-arrows-circles+timeline+pgf+set.tex](https://github.com/walmes/Tikz/blob/master/src/time-arrows-circles+timeline+pgf+set.pgf)

```tex
% https://tex.stackexchange.com/a/108776/173708

\documentclass{standalone}
\usepackage[margin=3cm]{geometry}
\usepackage{ragged2e}
\usepackage{fourier}
\usepackage{tikz} 
\usetikzlibrary{chains,shapes.arrows,fit}

\definecolor{arrowcolor}{RGB}{201,216,232}% color for the arrow filling
\definecolor{circlecolor}{RGB}{79,129,189}% color for the inner circles filling
\colorlet{textcolor}{white}% color for the text inside the circles
\colorlet{bordercolor}{white}% color for the outer border of circles

\pgfdeclarelayer{background}
\pgfsetlayers{background,main}

\newcounter{task}

\newlength\taskwidth% width of the box for the task description
\newlength\taskvsep% vertical distance between the task description and arrow

\setlength\taskwidth{2.5cm}
\setlength\taskvsep{17pt}

\def\taskpos{}
\def\taskanchor{}

\newcommand\task[1]{%
  {\parbox[t]{\taskwidth}{\scriptsize\Centering#1}}}

\tikzset{
inner/.style={
  on chain,
  circle,
  inner sep=4pt,
  fill=circlecolor,
  line width=1.5pt,
  draw=bordercolor,
  text width=1.2em,
  align=center,
  text height=1.25ex,
  text depth=0ex
},
on grid
}

\newcommand\Task[2][]{%
\node[inner xsep=0pt] (c1) {\phantom{A}};
\stepcounter{task}
\ifodd\thetask\relax
  \renewcommand\taskpos{\taskvsep}\renewcommand\taskanchor{south}
\else
  \renewcommand\taskpos{-\taskvsep}\renewcommand\taskanchor{north}
\fi
\node[inner,font=\footnotesize\sffamily\color{textcolor}]    
  (c\the\numexpr\value{task}+1\relax) {#1};
\node[anchor=\taskanchor,yshift=\taskpos] 
  at (c\the\numexpr\value{task}+1\relax) {\task{#2}};
}

\newcommand\drawarrow{% the arrow is placed in the background layer 
                                                     % after the node for the tasks have been placed
\ifnum\thetask=0\relax
  \node[on chain] (c1) {}; % if no \Task command is used, the arrow will be drawn
\fi
\node[on chain] (f) {};
\begin{pgfonlayer}{background}
\node[
  inner sep=10pt,
  single arrow,
  single arrow head extend=0.8cm,
  draw=none,
  fill=arrowcolor,
  fit= (c1) (f)
] (arrow) {};
\fill[white] % the decoration at the tail of the arrow
  (arrow.before tail) -- (c1|-arrow.west) -- (arrow.after tail) -- cycle;
\end{pgfonlayer}
}

\newenvironment{timeline}[1][node distance=.75\taskwidth]
  {\par\noindent\begin{tikzpicture}[start chain,#1]}
  {\drawarrow\end{tikzpicture}\par}

\begin{document}

\begin{timeline}
	\Task{Complete oral presentation\\ 27/04/2012}
	\Task{Work on user interface and some modulation \\ 28/04/2012}
	\Task{Work on and complete proposal to hand in \\ 29/04/2012}
	\Task{Hand in proposal and astart working on Software planning \\ 04/05/2012}
	\Task{Hand in Software planning and work on more content \\ 06/05/2012}
	\Task{Complete full user UI with action listeners \\ 12/05/2012}
	\Task{Complete beta testing and debug \\ May 13th to May 29th}
	\end{timeline}
	
	\vspace{1cm}
	
	\definecolor{arrowcolor}{RGB}{144,168,65}
	\colorlet{circlecolor}{white}
	\definecolor{bordercolor}{RGB}{168,89,65}
	\colorlet{textcolor}{bordercolor}
	\setlength\taskwidth{1.7cm}
	
	\begin{timeline}
	\Task[M]{Grilled cheese sandwiches on whole-wheat bread, one peach}
	\Task[Tu]{Penne pasta Caprese salad}
	\Task[W]{Zucchini muffins with cream cheese, grapes, and watermelon}
	\Task[Th]{Peanut butter and banana sandwiches, popcorn, one peach}
	\Task[F]{Cream cheese and cucumber sandwich, grapes, and blueberries}
	\Task[Sa]{Grilled fish with lemon, grilled corn, and whole-wheat biscuits}
	\Task[Su]{Yogurth with honey and blueberries}
\end{timeline}

\end{document}
```
****

![](./src/time-arrows-on-periods+timeline+foreach+style+learn.png)

  * [time-arrows-on-periods+timeline+foreach+style+learn.tex](https://github.com/walmes/Tikz/blob/master/src/time-arrows-on-periods+timeline+foreach+style+learn.pgf)

```tex
% https://tex.stackexchange.com/a/452487/173708
\documentclass[tikz,border=3.14mm]{standalone}
\usetikzlibrary{shapes.arrows,arrows.meta}

\begin{document}
	
\begin{tikzpicture}[font=\sffamily, 
	bullet/.style={fill=black, 
		circle, 
		text=white, 
		font=\sffamily\bfseries, 
		inner sep=1.2pt}]
	
	\draw[thick,-{Triangle[open]}] (-0.2,0) -- (8.5,0);
	\foreach \X in {1,2,3} {
		\draw ({(\X-1)*4},0.1) -- ({(\X-1)*4},-0.1);
		\draw[thick,dashed] ({(\X-1)*4},0) -- ++(0,2)
		node[above,bullet]{\X};}
	\node [double arrow, fill=gray!60,minimum height=3.6cm] at (2,1) {Fast Forwarding};
	\node [double arrow, fill=gray!60,minimum height=3.6cm] at (6,1) {Monitoring};
	\draw[orange,very thick,latex-latex] (0,-0.7) -- (8,-0.7) node[midway,bullet]{4};
	\node[anchor=north] at (0,0) {0};
	\node[anchor=north east] at (8,0) {Time};
\end{tikzpicture}
\end{document}
```
****

![](./src/time-events-and-periods+timeline+set+command+pgf+scope.png)

  * [time-events-and-periods+timeline+set+command+pgf+scope.tex](https://github.com/walmes/Tikz/blob/master/src/time-events-and-periods+timeline+set+command+pgf+scope.pgf)

```tex
% https://tex.stackexchange.com/a/442718/173708
\PassOptionsToPackage{table,dvipsnames,svgnames}{xcolor}
\documentclass[tikz,margin=1cm]{standalone}
\usetikzlibrary{arrows.meta,calc,positioning}

\colorlet{A}{gray}
\colorlet{B}{lightgray}
\pgfdeclarelayer{background}
\pgfdeclarelayer{timeline}
\pgfdeclarelayer{period}
\pgfdeclarelayer{foreground}
\pgfsetlayers{background,timeline,period,main,foreground}

%https://tex.stackexchange.com/a/349215
\tikzset{
  timeline/.style={arrows={}}%
  ,timeline style/.style={timeline/.append style={#1}}%
  ,year label/.style={font=\Huge\sffamily\bfseries,below}%
  ,year label style/.style={year label/.append style={#1}}%
  ,year tick/.style={tick size=5pt}%
  ,year tick style/.style={year tick/.append style={#1}}%
  ,minor tick/.style={tick size=2pt, very thin}%
  ,minor tick style/.style={minor tick/.append style={#1}}%
  ,period/.style={solid,line width=\timelinewidth,line cap=square}%
  ,periodbox/.style={font=\Huge\sffamily\bfseries,text=black}%
  ,eventline/.style={draw,red,thick,line cap=round,line join=round}%
  ,eventbox/.style={rectangle,rounded corners=3pt,inner sep=3pt,fill=red!25!white,text width=3cm,anchor=west,text=black,align=left,font=\large}%
  ,tick size/.code={\def\ticksize{#1}}%
  ,labeled years step/.code={\def\yearlabelstep{#1}}%
  ,minor tick step/.code={\def\minortickstep{#1}}%
  ,year tick step/.code={\def\yeartickstep{#1}}%
  ,enlarge timeline/.code={\def\enlarge{#1}}%
  ,eventboxa/.style={eventbox,text width=#1,draw=A,fill=none}%
  ,eventboxb/.style={eventbox,text width=#1,draw=A,fill=none}%
}

% Still from %https://tex.stackexchange.com/a/349215
\newcommand*{\drawtimeline}[5][]{%
  \def\fromyear{#2}%
  \def\toyear{#3}%
  \def\timelinesize{#4}%
  \def\timelinewidth{#5}%
  \pgfmathsetmacro{\timelinesizept}{\timelinesize}%
  \pgfmathsetmacro{\timelinewidthpt}{\timelinewidth}%
  \pgfmathsetmacro{\timelineoffset}{\timelinewidth/2}
  \pgfmathsetmacro{\timelineoffsetpt}{\timelineoffset}
%
  \begin{scope}[x=1pt, y=1pt, % Change main units to pt
                labeled years step=1,% Set some defaults
                minor tick step=0.25,%
                enlarge timeline=0cm,%
                year tick step=1,#1]
    \pgfmathsetmacro{\enlargept}{\enlarge}
    \pgfmathsetmacro{\yearticksep}{\timelinesize/((\toyear-\fromyear)/\yeartickstep)}
    \pgfmathsetmacro{\minorticksep}{\timelinesize/((\toyear-\fromyear)/\minortickstep)}
    \pgfmathsetmacro{\minorticklast}{\minorticksep/\minortickstep}
    \foreach \y[remember=\y as \lasty (initially 0), count=\i from \fromyear] in {0,\yearticksep,...,\timelinesizept}{
        \coordinate (Y-\i) at (\y,0);
        \draw[year tick] (\y,-\ticksize/2) --  ++(0,\ticksize);
        \ifnum\i=\toyear\breakforeach\else
        \foreach \q[count=\j from 0] in {0,\minorticksep,...,\minorticklast}{
            \coordinate (Y-\i-\j) at (\q+\y,0);
                \begin{pgfonlayer}{timeline}
            \draw[minor tick] (\q+\y,-\ticksize/2) -- ++(0,\ticksize);
                \end{pgfonlayer}
        };\fi};%
    \pgfmathsetmacro{\nextyear}{int(\fromyear+\yearlabelstep)}
    \begin{pgfonlayer}{timeline}
    \draw[timeline] (0,0) -- ++(-\enlargept,0) (0,0) -- ++(\timelinesizept,0) coordinate (end) -- ++(\enlargept,0);% Timeline
    \end{pgfonlayer}
%    \foreach \y in {\fromyear,\nextyear,...,\toyear} \node[year label] at (Y-\y) {\y};
  \end{scope}%
}
% Put a period identifier midway between the start and end of the period
% 1 = color of timeline segment
% 2 = period start
% 3 = period end
% 4 = period text
\newcommand{\period}[5]{\begin{pgfonlayer}{period} \draw[period,#1] (Y-#2) -- (Y-#3) node[periodbox,#5,midway,text=white] {\begin{tabular}{l} #4 \end{tabular}}; \end{pgfonlayer}}

%This somewhat follows @cfr's Chronos. It was certainly inspired by Chronos.
%https://tex.stackexchange.com/a/349236

% 1 = format of line and box
% 2 = starting coordinate
% 3 = pin associated with starting coordinate (well suited to using polar coordinate)
% 4 = branch at top of pin (well suited to using polar coordinate)
% 5 = Any extra formatting of node
% 6 = Name of node
% 7 = Node content

\newcommand{\vevent}[7]{\begin{pgfonlayer}{timeline} \draw[eventline,#1](Y-#2) -- ++(#3) -- ++(#4) node[#5] (#6) {#7}; \end{pgfonlayer}}

\begin{document}
    \begin{tikzpicture}
        \drawtimeline[
            labeled years step=1,
            minor tick step=0.083333,
            timeline style={draw=gray,line width=\timelinewidthpt},
            minor tick style={-,lightgray,tick size=3pt,line width=3pt,yshift=-\timelineoffsetpt},           
            ]%
            {2017}{2019}{50cm}{2cm};
%
    \period{A}{2017-0}{2017-2}{2017\\J-F}{}
    \period{B}{2017-2}{2017-4}{M-A}{}
    \period{A}{2017-4}{2017-6}{M-J}{}
    \period{B}{2017-6}{2017-8}{J-A}{}
    \period{A}{2017-8}{2017-10}{S-O}{}
    \period{B}{2017-10}{2017-12}{N-D}{}
    \period{A}{2018-0}{2018-2}{2018\\J-F}{}
    \period{B}{2018-2}{2018-4}{M-A}{}
    \period{A}{2018-4}{2018-6}{M-J}{}
    \period{B}{2018-6}{2018-8}{J-A}{}
%
    \vevent{A}{2017-0}{90:2.5cm}{45:0.5cm}{eventboxa=5cm,anchor=west}{H}{Start of ZoW consortium\\10 Jan}
    \vevent{A}{2017-6}{-90:2.5cm}{-45:0.5cm}{eventboxa=4cm,anchor=west}{H}{1st Symposium\\8 Jun}    
    \vevent{A}{2017-7}{90:2.5cm}{45:0.5cm}{eventboxa=4cm,anchor=west}{H}{1st Symposium\\8 Jun} 
    \vevent{A}{2017-12}{-90:2.5cm}{-45:0.5cm}{eventboxa=4cm,anchor=west}{H}{2nd Symposium\\8 Jun} 
    \vevent{A}{2018-0}{90:2.5cm}{45:0.5cm}{eventboxa=4cm,anchor=west}{H}{Storm\\Jan} 
    \vevent{A}{2018-0}{90:4.5cm}{45:0.5cm}{eventboxa=4cm,anchor=west}{H}{Storm\\18 Jan} 
    \vevent{A}{2018-6}{-90:2.5cm}{-45:0.5cm}{eventboxa=4cm,anchor=west}{H}{3rd Symposium\\14 Jun}
%
    \node[draw=none,rectangle,fill=cyan,text width=10cm,minimum height=1cm,text=black,align=center,font=\Large] (AA) at  ([yshift=-5cm]Y-2018-5) {Internship};       
    \node[below=0.5cm of AA,font=\large] {12 Feb - 10 Aug};            
    \end{tikzpicture}
\end{document}
```
****

![](./src/time-long-text+timeline+text+foreach.png)

  * [time-long-text+timeline+text+foreach.tex](https://github.com/walmes/Tikz/blob/master/src/time-long-text+timeline+text+foreach.pgf)

```tex
% https://tex.stackexchange.com/a/539169/173708
\documentclass[landscape]{article}
\usepackage{tikz}

%%%<
\usepackage{verbatim}
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{5pt}%
%%%>
\usepackage{tikz}
\usetikzlibrary{positioning}
\begin{document}
\begin{figure}
\begin{tikzpicture}[x=2.5cm,nodes={text width=2.2cm,align=left}]
	\draw[black,->,thick,>=latex,line cap=rect]
	  (0,0) -- (5,0);
	\foreach \Text [count=\Xc starting from 0] in 
		{{Due\~no dise\~na y ofrece un esquema de incentivos $w(a)$.},%
		 {Gerente acepta o rechaza.},%
		 {Gerente elige una (verificable) $a\in\lbrace m,s\rbrace$.},%
		 {Naturaleza juega.},%
		 {Flujos de caja $x$ y los beneficios $b$ son realizados. Compensaci\'on
		  $w(a)$ es pagada.}}  
		{\fill (\Xc,0) circle[radius=1.5pt];
		\node[below=0.2ex] at (\Xc,0) {\Text};}  
\end{tikzpicture}
\end{figure}
\end{document}
```
****

![](./src/time-rounded-box-arr+timeline+pgf+style+foreach+learn.png)

  * [time-rounded-box-arr+timeline+pgf+style+foreach+learn.tex](https://github.com/walmes/Tikz/blob/master/src/time-rounded-box-arr+timeline+pgf+style+foreach+learn.pgf)

```tex
% https://tex.stackexchange.com/a/493707/173708
\documentclass{standalone}
\usepackage[margin=1in]{geometry}
\usepackage{tikz}
\usetikzlibrary{positioning,arrows.meta}

\tikzdeclarecoordinatesystem{timeline}{% #1 is the date in years
    \pgfmathsetmacro\myx{(#1-1975)/3}
    \pgfpointxy{\myx}{0}
}
\begin{document}

\begin{tikzpicture}[line cap=rect, 
    event/.style={fill, 
        font=\tiny,
        text=white,
        inner sep=0.4ex,
        text height=1ex, 
        text depth=0.4ex, 
        rounded corners}, 
    bullet/.style={circle, 
        fill, 
        minimum size=4pt,   % added, new
        node contents={}, 
        inner sep=1pt}]
    
	\draw (timeline cs:1975) -- (timeline cs:2020);
	\foreach \X in {1975,1980,...,2020} {
	    \draw (timeline cs:\X) -- ++(0,0.2) node[above,font=\tiny]{\X};}
	    
	\draw[blue!80] (timeline cs:1977) node[bullet] -- node{1977} ++ (0,-0.8) node[below,event]{A New Hope};
	\draw[orange] (timeline cs:1980.4) node[bullet] -- node{1980} ++ (0,-1.6) node[below,event]{The Empire Strikes Back};
	\draw[green!80!black] (timeline cs:1984) node[bullet] -- ++ (0,-0.8) node[below,event]{Return of the Jedi};
	\draw[purple!80] (timeline cs:2002.5) node[bullet] -- node{2002} ++ (0,-0.8) node[below,event] (Clone) {Attack of the Clones};
	\node[red,left=0.3em of Clone,event] (Phantom) {The Phantom Menace};    % set name and print movie
	\draw[red] (timeline cs:1999) node[bullet]  to[out=-90,in=90] (Phantom); % draw the line from bullet to label
	\node[brown!80!black,right=0.3em of Clone,event] (Sith) {Revenge of the Sith};    % set name and print movie
	\draw[brown!80!black] (timeline cs:2005.5) node[bullet] to[out=-90,in=90] (Sith); % draw line
	\draw[pink!90!black] (timeline cs:2016) node[bullet] -- node{2016} ++ (0.2,0.8) node[above,event] {The Force Awakens};
\end{tikzpicture}
\end{document}
```
****

![](./src/time-simple+timeline+foreach+snake+decoration+learn.png)

  * [time-simple+timeline+foreach+snake+decoration+learn.tex](https://github.com/walmes/Tikz/blob/master/src/time-simple+timeline+foreach+snake+decoration+learn.pgf)

```tex
% https://stackoverflow.com/a/4170985/5270873

\documentclass{standalone}
\usepackage{tikz}
\usetikzlibrary{decorations.pathmorphing}


\begin{document}

\begin{tikzpicture}
	%draw horizontal line
	\draw (0,0) -- (2,0);
	\draw[decorate,decoration={snake,pre length=5mm, post length=5mm}] (2,0) -- (4,0);
	\draw (4,0) -- (5,0);
	\draw[decorate,decoration={snake,pre length=5mm, post length=5mm}] (5,0) -- (7,0);
	
	%draw vertical lines
	\foreach \x in {0,1,2,4,5,7}
	\draw (\x cm,3pt) -- (\x cm,-3pt);
	
	%draw nodes
	\draw (0,0) node[below=3pt] {$ 0 $} node[above=3pt] {$   $};
	\draw (1,0) node[below=3pt] {$ 1 $} node[above=3pt] {$ 10 $};
	\draw (2,0) node[below=3pt] {$ 2 $} node[above=3pt] {$ 20 $};
	\draw (3,0) node[below=3pt] {$  $} node[above=3pt] {$  $};
	\draw (4,0) node[below=3pt] {$ 5 $} node[above=3pt] {$ 50 $};
	\draw (5,0) node[below=3pt] {$ 6 $} node[above=3pt] {$ 60 $};
	\draw (6,0) node[below=3pt] {$  $} node[above=3pt] {$  $};
	\draw (7,0) node[below=3pt] {$ n $} node[above=3pt] {$ 10n $};
\end{tikzpicture}

\end{document}
```
****

![](./src/time-timeline+physics+timeline+def+foreach+multi+learn.png)

  * [time-timeline+physics+timeline+def+foreach+multi+learn.tex](https://github.com/walmes/Tikz/blob/master/src/time-timeline+physics+timeline+def+foreach+multi+learn.pgf)

```tex
% Author: Izaak Neutelings (July, 2017)

\documentclass{article}
\usepackage{amsmath} % for \dfrac
\usepackage{tikz}
\usepackage{calc} % for simple arithmetic
\tikzset{>=latex} % for LaTeX arrow head

% split figures into pages
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{1pt}%

\begin{document}





% TIMELINE - simple
\begin{tikzpicture}[]
  
  % limits
  \newcount\yearOne; \yearOne=1900
  \def\w{15}    % width of axes
  \def\n{4}     % number of decades
  \def\lt{0.40} %  ten tick length
  \def\lf{0.36} % five tick length
  \def\lo{0.30} %  one tick length
  
  % help functions
  \def\yearLabel(#1,#2){\node[above] at ({(#1-\yearOne)*\w/\n/10},\lt) {#2};}
  \def\yearArrowLabel(#1,#2,#3,#4){
    \def\xy{{(#1-\yearOne)*\w/\n/10}}; \pgfmathparse{int(#2*100)};
    \ifnum \pgfmathresult<0
      \def\yyp{{(\lt*(0.90+#2))}}; \def\yyw{{(\yyp-\lt*#3)}}
      \draw[<-,thick,black,align=center] (\xy,\yyp) -- (\xy,\yyw) node[below,black] at (\xy,\yyw) {#4};
    \else
      \def\yyp{{(\lt*(0.10+#2)}}; \def\yyw{{(\yyp+\lt*#3)}}
      \draw[<-,thick,black,align=center] (\xy,\yyp) -- (\xy,\yyw) node[above,black] at (\xy,\yyw) {#4};
    \fi}
  
  % axis
  %\draw[thick] (0,0) -- (\w,0);
  \draw[->,thick] (-\w*0.03,0) -- (\w*1.03,0);
  
  % ticks
  \foreach \tick in {0,1,...,\n}{
    \def\x{{\tick*\w/\n}}
    \def\year{\the\numexpr \yearOne+\tick*10 \relax}
  	\draw[thick] (\x,\lt) -- (\x,-\lt) % ten tick
	             node[below] {\year};
	
	\ifnum \tick<\n
	  \draw[thick] ({(\x+\w/\n/2)},0) -- ({(\x+\w/\n/2)},\lf); % five tick
      \foreach \ticko in {1,2,3,4,6,7,8,9}{
        \def\xo{{(\x+\ticko*\w/\n/10)}}
  	    \draw[thick] (\xo,0) -- (\xo,\lo);  % one tick
	}\fi
  }
  
  % label
  \yearLabel(1923,lol)
  \yearArrowLabel(1932.2, 1.0,1.0,foo)
  \yearArrowLabel(1937.2, 1.0,1.5,foo bar)
  \yearArrowLabel(1907.5, 0.0,1.5,small)
  \yearArrowLabel(1915.6,-1.0,2.0,\small this is small a sentence)
  \yearArrowLabel(1924.2,-1.2,1.2,$p\lambda=h$)
  
\end{tikzpicture}





% LOGARITHMIC SCALE
\large
\begin{tikzpicture}[]
  
  % limits
  \newcount\nOne; \nOne=-10
  \def\w{18}      % width of axes
  \def\n{29}      % number of decades
  \def\noffset{1} % offset labels
  \def\nskip{3}   % skip number
  \def\la{2.00}   % arrow length
  \def\lt{0.20}   % tick length
  \def\ls{0.15}   % tick length (skipped)
  
  % help functions
  \def\myx(#1){{(#1-\nOne)*\w/\n}}
  \def\arrowLabel(#1,#2,#3,#4){
    \def\xy{(#1-\nOne)*\w/\n}; \pgfmathparse{int(#2*100)};
    \ifnum \pgfmathresult<0
      \def\yyp{{(\lt*(-0.10+#2))}}; \def\yyw{{(\yyp-\la*\lt*#3)}}
      \draw[<-,thick,black!50!blue,align=center]
        (\myx(#1),\yyp) -- (\myx(#1),\yyw)
        node[below,black!80!blue] {#4}; %,fill=white
    \else
      \def\yyp{{(\lt*(0.10+#2)}}; \def\yyw{{(\yyp+\la*\lt*#3)}}
      \draw[<-,thick,black!50!blue,align=center]
        (\myx(#1),\yyp) -- (\myx(#1),\yyw)
        node[above,black!80!blue] {#4};
    \fi}
  \def\arrowLabelRed(#1,#2,#3,#4){
    \def\yyp{{(\lt*(-0.10+#2))}}; \def\yyw{{(\yyp-\la*\lt*#3)}}
    \fill[red,radius=2pt] (\myx(#1),0) circle;
    \draw[<-,thick,black!25!red,align=center]
      (\myx(#1),\yyp) -- (\myx(#1),\yyw)
      node[below,black!40!red] {\strut#4}; %,fill=white
    }
  
  % axis
  \draw[->,thick] (-\w*0.03,0) -- (\w*1.06,0)
                  node[right=4pt,below=6pt] {[GeV]};
  
  % ticks
  \foreach \tick in {0,1,...,\n}{
    \def\x{{\tick*\w/\n}}
    \def\dec{\the\numexpr \nOne+\tick \relax}
	\pgfmathparse{Mod(\tick-\noffset,\nskip)==0?1:0}
	\ifnum\pgfmathresult>0
	  \draw[thick] (\x,\lt) -- (\x,-\lt) % ten tick
	               node[below] {$10^{\dec}$}; % label
	\else
      \draw[thick] (\x,\ls) -- (\x,-\ls); % ten tick
	\fi
  }
  
  % label
  \arrowLabel(-9.52,1.2,2.5,neutrino) % log(0.0000000003)=-9.523 (0.3 eV)
  \arrowLabel(-3.29,1.2,1.5,electron) % log(0.000510)=-3.292 (0.510 MeV)
  \arrowLabel(-0.03,1.2,2.5,proton)   % log(0.938)=-0.03
  \arrowLabel( 1.90,1.2,5.7,$\text{W}^\pm$, $\text{Z}$) % log(80)=1.90, log(90)=1.95
  \arrowLabel( 2.25,1.2,2.4,\qquad Higgs\\\quad top) % log(125)=2.10, log(175)=2.24
  \arrowLabel( 4.15,-1.2,1.6,LHC)     % log(1400)=4.146
  \arrowLabel(16.00,1.2,2.5,GUT)      % 10^25 eV = 10^16 GeV
  \arrowLabel(19.09,1.2,4.0,Planck)   % Planck % quantum gravity % 1.22x10^19 . GeV
  
  % low mass
  \arrowLabelRed(1.477,-1.2,3.0,X)    % ln(30) = 1.477
  \arrowLabelRed(2.230,-1.2,3.0,$\text{B}'$) % ln(170) = 2.230
  
  % stretch
  \draw[<->,thick,black!20!orange]
    ({(2.6-\nOne)*\w/\n},0.95) -- ({(15.6-\nOne)*\w/\n},0.95)
    node[midway,below=1pt] {particle desert ?}
    node[midway,above=1pt] {new physics ?};
  
\end{tikzpicture}






% TIMELINE - particle physics
% sources: http://web.ihep.su/dbserv/compas/src/
%          http://www.particleadventure.org/other/history/
%          https://en.wikipedia.org/wiki/Timeline_of_particle_discoveries
\large
\begin{tikzpicture}[] %[minimum height=10pt, text height=10pt,text depth=10pt,

  % limits
  \newcount\yearOne; \yearOne=1900
  \newcount\yoffset;
  \def\w{18}       % width of axes
  \def\n{4}        % number of decades
  \def\lt{0.40}    %  ten tick length
  \def\lf{0.36}    % five tick length
  \def\lo{0.30}    %  one tick length
  \def\lext{0.07}  % left extension of axes
  \def\rext{1.045} % left extension of axes
  
  % help functions
  \def\yearLabel(#1,#2,#3){\node[above,black!60!blue] at ({(#1-\yearOne)*\w/\n/10},{\lt*#2}) {#3};}
  \def\yearArrowLabel(#1,#2,#3,#4){
    \def\xy{{(#1-\yearOne)*\w/\n/10}}; \pgfmathparse{int(#2*100)};
    \ifnum \pgfmathresult<0 % below
      \def\yyp{{(\lt*(0.90+#2))}}; \def\yyw{{(\yyp-\lt*#3)}}
      \draw[<-,thick,black!50!blue,align=center]
        (\xy,\yyp) -- (\xy,\yyw)
        node[below,black!80!blue] at (\xy,\yyw) {\strut #4};
    \else % under
      \def\yyp{{(\lt*(0.10+#2)}}; \def\yyw{{(\yyp+\lt*#3)}}
      \draw[<-,thick,black!60!blue,align=center]
        (\xy,\yyp) -- (\xy,\yyw)
        node[above] at (\xy,\yyw) {#4};
    \fi}
  \def\yearArrowLabelRed(#1,#2,#3,#4){
    \def\xy{{(#1-\yearOne)*\w/\n/10}}; \pgfmathparse{int(#2*100)};
      \def\yyp{{(\lt*(0.90+#2))}}; \def\yyw{{(\yyp-\lt*#3)}}
      \fill[red,radius=2pt] (\xy,0) circle;
      \draw[<-,thick,black!25!red,align=center]
        (\xy,\yyp) -- (\xy,\yyw)
        node[below,black!40!red] at (\xy,\yyw) {\strut #4};
     }  
  
  
  %---------------%
  %  1900 - 1940  %
  %---------------%
  
  % axis
  \draw[thick] (-\w*0.07,0) -- (\w*\rext,0);
  
  % ticks
  \foreach \tick in {0,1,...,\n}{
    \def\x{{\tick*\w/\n}}
    \def\year{\the\numexpr \yearOne+\tick*10 \relax}
    \draw[thick] (\x,-\lt) -- (\x,\lt) % ten tick
                 node[above] {\year};
	
	\ifnum \tick<\n
      \draw[thick] ({(\x+\w/\n/2)},0) -- ({(\x+\w/\n/2)},\lf); % five tick
      \foreach \ticko in {1,2,3,4,6,7,8,9}{
        \def\xo{{(\x+\ticko*\w/\n/10)}}
  	    \draw[thick] (\xo,0) -- (\xo,\lo);  % one tick
	}\fi
  }
  
  % extra ticks
  \draw[thick] (-1*\w/\n/10,0) -- (-1*\w/\n/10,\lo);
  \draw[thick] (-2*\w/\n/10,0) -- (-2*\w/\n/10,\lo);
  \draw[thick] ({\w+\w/\n/10},0) -- ({\w+\w/\n/10},\lo);
  
  % labels
  \yearArrowLabel(1897.83,-1.2,1.5,
                  $\text{e}^-$)      % electron 10/1897 Thomson
  \yearArrowLabel(1905.25,-1.2,1.5,
                  $\gamma$)          % photon   03/1905 Einstein
  \yearArrowLabel(1913.17, 1.2,1.5,
                  atom nucleus)      % nucleus  02/1913 Rutherford
  \yearArrowLabel(1917.50,-1.2,1.5,
                  $\text{p}^+$)      % proton      1917 Rutherford (Philos. Mag., Ser. 6, Vol. 37, 581 (1919))
  \yearArrowLabel(1932.50, 1.2,1.5,
                  anti-matter)       % anti-matter
  \yearArrowLabel(1932.50,-1.2,1.5,
                  $\text{e}^+$\\     % positron    1932 Anderson
                  $\text{n}^0$)      % neutron     1932 Chadwick
  \yearArrowLabel(1936.50,-1.2,1.5,
                  $\mu^\pm$)         % muon        1936
  
  
  
  %---------------%
  %  1940 - 1980  %
  %---------------%
  
  \yearOne=1940; \advance\yoffset by 120
  \begin{scope}[yshift=-\yoffset]
    
    % axis
    \draw[thick] (-\w*\lext,0) -- (\w*\rext,0);
    
    % ticks
    \foreach \tick in {0,1,...,\n}{
      \def\x{{\tick*\w/\n}}
      \def\year{\the\numexpr \yearOne+\tick*10 \relax}
      \draw[thick] (\x,-\lt) -- (\x,\lt) % ten tick
	               node[above] {\year};
      \ifnum \tick<\n
        \draw[thick] ({(\x+\w/\n/2)},0) -- ({(\x+\w/\n/2)},\lf); % five tick
        \foreach \ticko in {1,2,3,4,6,7,8,9}{
          \def\xo{{(\x+\ticko*\w/\n/10)}}
  	      \draw[thick] (\xo,0) -- (\xo,\lo);  % one tick
	  }\fi
    }

    % extra ticks
    \draw[thick] (-1*\w/\n/10,0) -- (-1*\w/\n/10,\lo);
    \draw[thick] (-2*\w/\n/10,0) -- (-2*\w/\n/10,\lo);
    \draw[thick] ({\w+\w/\n/10},0) -- ({\w+\w/\n/10},\lo);
  
    % labels
    \yearArrowLabel(1947.42,-1.2,1.5,
                    $\pi^\pm$\\            % pions    05/1947 Lattes, Muirhead, Occhialini, Powell
                    $\text{K}^0$)          % neutral kaons 12/1947 Rochester & Butler, Nature, 160, 855
    \yearArrowLabel(1949.00,-1.2,1.5,
                    $\text{K}^\pm$)        % kaons    12/1949 Powell, Fowler, Perkins, Nature, 163, 82
    \yearArrowLabel(1950.10,-2.2,1.8,
                  \,$\pi^0$)               % pi0      01/1950 Caltech
    \yearArrowLabel(1952.00,-1.2,1.5,
                    $\Lambda^0$\\          % Lambda0  12/1950 Hopper, Biswas, Phys. Rev. 80, 1099
                    $\Delta$)              % 1952 Anderson, Fermi, (Chicago Cyclotron), Phys. Rev., 85, 936
                                           % 1956 Ashkin (Rochester cyclotron), Phys. Rev., 101, 1149
     % Sigma+ 1953 Bonetti, Nuovo Cimento, 10, 1; Danysz, Pniewski, Phil. Mag., 44, 348; Cosmotron Brookhaven, Phys. Rev., 93, 109
     % Xi- "negative hyperon" 1954 Cowan (Caltech), Phys. Rev., 94, 161
    \yearArrowLabel(1953.20,-1.2,1.5,\,\,$\Sigma^\pm$\\\,\,$\Xi^-$)
    \yearArrowLabel(1955.92,-1.2,1.5,$\overline{\text{p}}$\,) % 11/1955 Chamberlain, Segrè (Bevatron) Phys. Rev. 100, 947
    \yearArrowLabel(1956.75,-1.2,1.5,$\nu_\text{e}$\\$\overline{\text{n}}$) % 09/1956 Reines, Cowan, Nature, 178, 446
    \yearArrowLabel(1957.80,-1.2,1.5,$\Sigma^0$) % 
    \yearArrowLabel(1959.00,-1.2,1.5,$\Xi^0$) % Xi 1959 (1964 Brookhaven)
    % 1960  Sigma*(1385) Phys. Rev. Lett., 5, 520
    \yearArrowLabel(1961.20,-1.2,1.5,
                    $\rho$\\            % 1961 Erwin (Cosmotron) Phys. Rev. Lett., 6, 628
                    $\omega$\\          % 1961 Maglic, Alvarez, Phys. Rev. Lett., 7, 178
                    $\eta$\\            % 1961 Pevsner, Phys. Rev. Lett., 7, 421
                    $\text{K}^*$)       % 1961 Alston, Phys. Rev. Lett., 6, 300, 1962 Phys. Rev. Lett., 9, 330
    % 19.. strangeness "associated-production", Pais
    % 1962 Eightfold Way, Gell-Man
    \yearArrowLabel(1962.58,-1.2,1.5,\vspace{2pt}
                    $\nu_\mu$\\         % 07/1962, Ledderman, Danby, Phys. Rev. Lett. 9, 36
                    $\phi$)             % 1962, Pjerrou Phys. Rev. Lett., 9, 114, Bertanza, Phys. Rev. Lett., 9, 180
    % 1962 f particle?
    \yearArrowLabel(1964.10,-1.2,1.5,
                    $\alpha_2$\\        %
                    \,$\eta^*$\\        %
                    \,\,$\Omega^-$)     % 02/1964, Barnes, Brookhaven, Phys. Rev. Lett. 12, 204
    \yearArrowLabel(1964.50, 1.2,1.2,
                    quark model\\
                    \small{up, down, strange}) % Gell-Mann
    % 1967 Steven Weinberg, Abdus Salam: electroweak unification
    \yearArrowLabel(1974.50, 1.2,1.2,
                    \qquad\qquad Standard Model\\
                    \small{charm})     % charm
    % 1974 November Revolution
    \yearArrowLabel(1974.50,-1.2,1.5,$\text{J/}\Psi$\,\,\\$\Psi'$\\\,$\Psi''$) % 
    %\yearLabel(1973,4.0,Standard Model) % Standard Model
    % tau 1975 Perl, Abrams, Phys. Rev. Lett. 35, 1489
    \yearArrowLabel(1976.00,-1.2,1.5,$\tau$\\$\chi_\text{c}$) % 
    \yearArrowLabel(1976.90,-1.2,1.5,
                    $\text{D}$        ) % 1976 SLAC
    \yearArrowLabel(1977.75, 1.2,1.2,
                    \small{bottom} )    % bottom
    \yearArrowLabel(1977.75,-1.2,1.5,$\Upsilon$\\\,$\Upsilon'$\\\,\,$\Upsilon''$\\\small\ldots) % Fermilab
    \yearArrowLabel(1979.65,-1.2,1.5,$\Lambda_\text{c}$\\$\Sigma_\text{c}$) % 
    
  \end{scope}
    
    
    
  %---------------%
  %  1980 - 2020  %
  %---------------%
  
  \yearOne=1980; \advance\yoffset by 130
  \begin{scope}[yshift=-\yoffset]
    
    % axis
    \draw[->,thick] (-\w*\lext,0) -- (\w*1.06,0);
    
    % ticks
    \foreach \tick in {0,1,...,\n}{
      \def\x{{\tick*\w/\n}}
      \def\year{\the\numexpr \yearOne+\tick*10 \relax}
      \draw[thick] (\x,-\lt) -- (\x,\lt) % ten tick
	               node[above] {\year};
      \ifnum \tick<\n
        \draw[thick] ({(\x+\w/\n/2)},0) -- ({(\x+\w/\n/2)},\lf); % five tick
        \foreach \ticko in {1,2,3,4,6,7,8,9}{
          \def\xo{{(\x+\ticko*\w/\n/10)}}
  	      \draw[thick] (\xo,0) -- (\xo,\lo);  % one tick
	  }\fi
    }
    
    % extra ticks
    \draw[thick] (-1*\w/\n/10,0) -- (-1*\w/\n/10,\lo);
    \draw[thick] (-2*\w/\n/10,0) -- (-2*\w/\n/10,\lo);
    \draw[thick] ({\w+\w/\n/10},0) -- ({\w+\w/\n/10},\lo);
  
    % labels
    \yearArrowLabel(1980.40,-1.2,1.5,
                    $\eta_\text{c}$   )  % 
    \yearArrowLabel(1981.30,-1.2,1.5,
                    B                 )  % 
    \yearArrowLabel(1983.05,-1.2,1.5,
              \mbox{$\text{W}^\pm$\hspace{4pt}}\\
                    $\text{D}_\text{s}$\\
                    $\Xi_\text{c}$    )  % 
    \yearArrowLabel(1984.00,-1.2,1.5,
              \mbox{\hspace{12pt}$\text{Z}^0$} ) % 
    \yearArrowLabel(1991.60,-1.2,1.5,$\text{B}_\text{s}$\\$\Lambda_\text{b}$)  % Bs Fermilab
    \yearArrowLabel(1995.30,-1.2,1.5,t)  % 
    \yearArrowLabel(1995.30, 1.2,1.2,
                    \small{top}      )   %  
    \yearArrowLabel(2000.60,-1.2,1.5,$\nu_\tau$)  % 
    \yearArrowLabel(2012.50,-1.2,1.5,H)  % 
    \yearArrowLabelRed(2017.7,-1.2,1.5,X\\\,$\text{B}'$) % low mass
    
  \end{scope}
    
    
    
\end{tikzpicture}
  
  

\end{document}
```
****

![](./src/time-tow-lined-braces+timeline+command+text+foreach+tabular+learn.png)

  * [time-tow-lined-braces+timeline+command+text+foreach+tabular+learn.tex](https://github.com/walmes/Tikz/blob/master/src/time-tow-lined-braces+timeline+command+text+foreach+tabular+learn.pgf)

```tex
% https://tex.stackexchange.com/a/215994/173708
\documentclass[tikz,border=5mm]{standalone}
\newcommand{\mytab}[1]{%
\begin{tabular}{@{}c@{}}
#1
\end{tabular}
}
\begin{document}
\begin{tikzpicture}
	\draw (0,0) -- (11,0);
	\foreach \x in {0.8,4,5.5,7,10.2}
		\draw(\x cm,3pt) -- (\x cm, -3pt);
	\draw (0.8,0) node[below=3pt] {$T_0$};
	\draw (4,0) node[below=3pt] {$T_1$};
	\draw (5.5,0) node[below=3pt] {$0$};
	\draw (7,0) node[below=3pt] {$T_2$};
	\draw (10.2,0) node[below=3pt] {$T_3$};
	\draw (2.35,0) node[above=6pt, align=center] {
	                        $\left(\mytab{estimation \\ window}\right]$};
\end{tikzpicture}
\end{document}
```
****

![](./src/time-two_courses_horizontal+timeline+foreach+learn.png)

  * [time-two_courses_horizontal+timeline+foreach+learn.tex](https://github.com/walmes/Tikz/blob/master/src/time-two_courses_horizontal+timeline+foreach+learn.pgf)

```tex
% https://tex.stackexchange.com/a/239139/173708
\documentclass{standalone}
\usepackage[utf8]{inputenc}
\usepackage{tikz}
\usetikzlibrary{snakes}
\usepackage{fullpage}
\usepackage{graphicx}
\usetikzlibrary{calc}


\begin{document}
\resizebox{\linewidth}{!}{% Resize table to fit within
\begin{tikzpicture}[snake=zigzag, line before snake = 5mm, line after snake = 5mm]
	%draw 1st horizontal line
	\draw (0,0) -- (19/2,0);
	\draw[snake] (19/2,0) -- (25/2,0);
	\draw (25/2,0) -- (30/2,0);
	\draw[snake] (30/2,0) -- (35/2,0);
	\draw (35/2,0) -- (40/2,0);
	%draw vertical lines
	\foreach \x in {0, 5, 10, 19, 30, 40}{
	   \draw (\x/2,3pt) -- (\x/2,-3pt);
	}
	%draw nodes
	\draw (-2,0) node { PHYS1060 };
	
	\draw (0,0) node[below=3pt] { Pre-test published } node[above=3pt] { Jan 4, 2014  };
	\draw (5/2,0) node[below=3pt] { Nudge } node[above=3pt] { Jan 9, 2014  };
	\draw (10/2,0) node[below=3pt] { First class } node[above=3pt] { Jan 13, 2014  };
	\draw (19/2,0) node[below=3pt] { Pre-test due } node[above=3pt] { Jan 22, 2014  };
	\draw (30/2,0) node[below=3pt] { Midterm } node[above=3pt] { Feb 17, 2014  };
	\draw (40/2,0) node[below=3pt] { Final Exam} node[above=3pt] { May 5, 2014  };
	
	%draw 2nd horizontal line
	\draw (-2,-2) node { PHYS1050 };
	\draw (0,-2) -- (19/2,-2);
	\draw[snake] (19/2,-2) -- (25/2,-2);
	\draw (25/2,-2) -- (30/2,-2);
	\draw[snake] (30/2,-2) -- (35/2,-2);
	\draw (35/2,-2) -- (40/2,-2);
	draw vertical lines
	\foreach \x in {0, 5, 10, 19, 30, 40}{
	   \draw ($(0,-2)+(\x/2, 3pt)$) -- ($(0,-2)+(\x/2, -3pt)$);
	}
		
	%draw nodes
	\draw (0,-2) node[below=3pt] { Pre-test published } node[above=3pt] { Aug 10, 2014  };
	\draw (5/2,-2) node[below=3pt] { First class } node[above=3pt] { Aug 27, 2014  };
	\draw (10/2,-2) node[below=3pt] { Nudge } node[above=3pt] { Sept 4, 2014  };
	\draw (19/2,-2) node[below=3pt] { Pre-test due } node[above=3pt] { Sept 7, 2014  };
	\draw (30/2,-2) node[below=3pt] { Midterm } node[above=3pt] { ?, 2014  };
	\draw (40/2,-2) node[below=3pt] { Final Exam} node[above=3pt] { ?, 2014  };	


\end{tikzpicture}
}

\end{document}
```
****

![](./src/time-vertical-multiple-on-year+timeline+text+environment+command+learn.png)

  * [time-vertical-multiple-on-year+timeline+text+environment+command+learn.tex](https://github.com/walmes/Tikz/blob/master/src/time-vertical-multiple-on-year+timeline+text+environment+command+learn.pgf)

```tex
% https://tex.stackexchange.com/a/197140/173708
\documentclass[10pt]{article}

\usepackage[paperwidth=210mm,%
    paperheight=297mm,%
    tmargin=7.5mm,%
    rmargin=7.5mm,%
    bmargin=7.5mm,%
    lmargin=7.5mm,
    vscale=1,%
    hscale=1]{geometry}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\usepackage{tikz}

\usetikzlibrary{arrows, calc, decorations.markings, positioning}

\pagestyle{empty}


% create an environment
\makeatletter
\newenvironment{timeline}[6]{%
    % #1 is startyear
    % #2 is tlendyear
    % #3 is yearcolumnwidth
    % #4 is rulecolumnwidth
    % #5 is entrycolumnwidth
    % #6 is timelineheight

    \newcommand{\startyear}{#1}
    \newcommand{\tlendyear}{#2}

    \newcommand{\yearcolumnwidth}{#3}
    \newcommand{\rulecolumnwidth}{#4}
    \newcommand{\entrycolumnwidth}{#5}
    \newcommand{\timelineheight}{#6}

    \newcommand{\templength}{}

    \newcommand{\entrycounter}{0}

    % https://tex.stackexchange.com/questions/85528/checking-whether-or-not-a-node-has-been-previously-defined
    % https://tex.stackexchange.com/questions/37709/how-can-i-know-if-a-node-is-already-defined
    \long\def\ifnodedefined##1##2##3{%
        \@ifundefined{pgf@sh@ns@##1}{##3}{##2}%
    }

    \newcommand{\ifnodeundefined}[2]{%
        \ifnodedefined{##1}{}{##2}
    }

    \newcommand{\drawtimeline}{%
        \draw[timelinerule] (\yearcolumnwidth+5pt, 0pt) -- (\yearcolumnwidth+5pt, -\timelineheight);
        \draw (\yearcolumnwidth+0pt, -10pt) -- (\yearcolumnwidth+10pt, -10pt);
        \draw (\yearcolumnwidth+0pt, -\timelineheight+15pt) -- (\yearcolumnwidth+10pt, -\timelineheight+15pt);

        \pgfmathsetlengthmacro{\templength}{neg(add(multiply(subtract(\startyear, \startyear), divide(subtract(\timelineheight, 25), subtract(\tlendyear, \startyear))), 10))}
        \node[year] (year-\startyear) at (\yearcolumnwidth, \templength) {\startyear};

        \pgfmathsetlengthmacro{\templength}{neg(add(multiply(subtract(\tlendyear, \startyear), divide(subtract(\timelineheight, 25), subtract(\tlendyear, \startyear))), 10))}
        \node[year] (year-\tlendyear) at (\yearcolumnwidth, \templength) {\tlendyear};
    }

    \newcommand{\entry}[2]{%
        % #1 is the year
        % #2 is the entry text

        \pgfmathtruncatemacro{\lastentrycount}{\entrycounter}
        \pgfmathtruncatemacro{\entrycounter}{\entrycounter + 1}

        \ifdim \lastentrycount pt > 0 pt%
            \node[entry] (entry-\entrycounter) [below of=entry-\lastentrycount] {##2};
        \else%
            \pgfmathsetlengthmacro{\templength}{neg(add(multiply(subtract(\startyear, \startyear), divide(subtract(\timelineheight, 25), subtract(\tlendyear, \startyear))), 10))}
            \node[entry] (entry-\entrycounter) at (\yearcolumnwidth+\rulecolumnwidth+10pt, \templength) {##2};
        \fi

        \ifnodeundefined{year-##1}{%
            \pgfmathsetlengthmacro{\templength}{neg(add(multiply(subtract(##1, \startyear), divide(subtract(\timelineheight, 25), subtract(\tlendyear, \startyear))), 10))}
            \draw (\yearcolumnwidth+2.5pt, \templength) -- (\yearcolumnwidth+7.5pt, \templength);
            \node[year] (year-##1) at (\yearcolumnwidth, \templength) {##1};
        }

        \draw ($(year-##1.east)+(2.5pt, 0pt)$) -- ($(year-##1.east)+(7.5pt, 0pt)$) -- ($(entry-\entrycounter.west)-(5pt,0)$) -- (entry-\entrycounter.west);
    }

    \newcommand{\plainentry}[2]{% plainentry won't print date in the timeline
        % #1 is the year
        % #2 is the entry text

        \pgfmathtruncatemacro{\lastentrycount}{\entrycounter}
        \pgfmathtruncatemacro{\entrycounter}{\entrycounter + 1}

        \ifdim \lastentrycount pt > 0 pt%
            \node[entry] (entry-\entrycounter) [below of=entry-\lastentrycount] {##2};
        \else%
            \pgfmathsetlengthmacro{\templength}{neg(add(multiply(subtract(\startyear, \startyear), divide(subtract(\timelineheight, 25), subtract(\tlendyear, \startyear))), 10))}
            \node[entry] (entry-\entrycounter) at (\yearcolumnwidth+\rulecolumnwidth+10pt, \templength) {##2};
        \fi

        \ifnodeundefined{invisible-year-##1}{%
            \pgfmathsetlengthmacro{\templength}{neg(add(multiply(subtract(##1, \startyear), divide(subtract(\timelineheight, 25), subtract(\tlendyear, \startyear))), 10))}
            \draw (\yearcolumnwidth+2.5pt, \templength) -- (\yearcolumnwidth+7.5pt, \templength);
            \node[year] (invisible-year-##1) at (\yearcolumnwidth, \templength) {};
        }

        \draw ($(invisible-year-##1.east)+(2.5pt, 0pt)$) -- ($(invisible-year-##1.east)+(7.5pt, 0pt)$) -- ($(entry-\entrycounter.west)-(5pt,0)$) -- (entry-\entrycounter.west);
    }

    \begin{tikzpicture}
        \tikzstyle{entry} = [%
            align=left,%
            text width=\entrycolumnwidth,%
            node distance=10mm,%
            anchor=west]
        \tikzstyle{year} = [anchor=east]
        \tikzstyle{timelinerule} = [%
            draw,%
            decoration={markings, mark=at position 1 with {\arrow[scale=1.5]{latex'}}},%
            postaction={decorate},%
            shorten >=0.4pt]

        \drawtimeline
}
{
    \end{tikzpicture}
    \let\startyear\@undefined
    \let\tlendyear\@undefined
    \let\yearcolumnwidth\@undefined
    \let\rulecolumnwidth\@undefined
    \let\entrycolumnwidth\@undefined
    \let\timelineheight\@undefined
    \let\entrycounter\@undefined
    \let\ifnodedefined\@undefined
    \let\ifnodeundefined\@undefined
    \let\drawtimeline\@undefined
    \let\entry\@undefined
}
\makeatother


% first timeline

\begin{document}

\begin{timeline}{1900}{1990}{2cm}{2.5cm}{5cm}{12cm}
	\entry{1903}{Wilbur and Orville Wright fly the first powered airplane}
	\entry{1914}{Assassination of Franz Ferdinand}
	\plainentry{1917}{The October Revolution}
	\entry{1928}{Discovery of Penicillin}
	\plainentry{1929}{Stock Market Crash of 1929}
	\entry{1941}{Attack on Pearl Harbor}
	\plainentry{1944}{D-Day}
	\entry{1945}{The Bombing of Hiroshima}
	\plainentry{1947}{Creation of Israel as a Jewish State}
	\entry{1963}{US president John F. Kennedy assassinated in Dallas}
	\entry{1969}{The Moon Landing}
	\plainentry{1989}{Fall of the Berlin Wall}
\end{timeline}

\bigskip

Text from: A Brief History of LaTeX http://www.xent.com/FoRK-archive/feb98/0307.html

\smallskip

% second timeline
\begin{timeline}{1974}{1985}{2cm}{7cm}{10cm}{0.45\textheight}
	\entry{1974}{Donald Knuth stops submitting papers to the AMS because ``the finished
	product was just too painful for me to look at''.}
	\entry{1977}{Knuth begins his research on typography.}
	\entry{1978}{Knuth delivers an AMS Gibbs Lecture entitled Mathematical Typography to the AMS membership at its annual meeting.}
	\entry{1979}{Digital Equipment Corporation and the AMS jointly publish Knuth's TeX and METAFONT: New Directions in Typesetting.}
	\entry{1980}{The first draft of Spivak's Joy of TeX is announced in TUGboat, vol. 1, no. 1.}
	% multiple events on a year
	\entry{1982}{Spivak announces AMS-TeX at the joint math meetings.}
	\entry{1982}{Version 0 of Spivak's Joy of TeX is released.}
	\entry{1982}{Knuth releases dvitype, a model DVI driver.}
	\entry{1983}{Lamport writes a LaTeX manual, the earliest known LaTeX manual in existence.}
	% multiple events on a year
	\entry{1984}{Addison-Wesley publishes Knuth's The TeXbook, destined to become the definitive TeX reference.}
	\entry{1984}{Lamport releases version 2.06a of the LaTeX macros.}
	% multiple events on a year
	\entry{1985}{The Computer Modern (CM) fonts replace the American Modern (AM) fonts in TeX.}
	\entry{1985}{Patashnik releases BibTeX version 0.98 for LaTeX 2.08. [``BibTeX 1.0'', TUGboat, vol. 15, no. 3, pp. 269--274, Sept. 1994.}
\end{timeline}

\end{document}
```
****

![](./src/time-year-event+timeline+set+foreach+learn.png)

  * [time-year-event+timeline+set+foreach+learn.tex](https://github.com/walmes/Tikz/blob/master/src/time-year-event+timeline+set+foreach+learn.pgf)

```tex
% https://tex.stackexchange.com/a/369484/173708
\documentclass[margin=10pt]{standalone}
\usepackage{tikz}

\usetikzlibrary{
    shapes.geometric
    ,positioning
}
\tikzset{
    zeitmarkernode/.style={
        isosceles triangle
        ,minimum height=2.5mm
        ,inner sep=0pt
        ,anchor=apex
    },
    zeitmarker/.pic={%
        \node[zeitmarkernode,pic actions,rotate=-90](-o){};
        \node[zeitmarkernode,pic actions,rotate=90](-u){};
    }
}
\begin{document}
    \begin{tikzpicture}[x=6cm,thick]
    % Achse und Beschriftung unterhalb
    \draw (11.9,0) -- (12,0) coordinate (s) -- (12+18/25,0) coordinate (a) 
        -- (12+27/25,0) coordinate (b) -- (14,0) coordinate (e) -- (14.2,0);
    \foreach \c/\zeit in {s/2000,a/2018,b/2027,e/2050}
        \draw (\c) node[below=.5cm of \c] {\zeit} -- +(0,.1) -- +(0,-.1);

    % Markierungen, Beschriftungen oberhalb und Verbindungen
    \foreach[count=\i] \descr/\c/\hshift in {%
        approach 1/s/5mm,%
        approach 2/a/5mm,%
        approach 3/b/5mm,%
        approach 4/e/3mm%
    }{
        \pic[fill=blue] (zm\i) at (\c) {zeitmarker};
        \node[above=1cm of zm\i-o,xshift=\hshift] (zm\i) {\emph{\descr}};
        \coordinate(h) at ([yshift=5mm]zm\i-o);
        \draw[blue](h) edge (zm\i) edge (zm\i-o);
    }
    \node[below left =.5cm and 1cm of s, text width=5em, align=center, text height=1.5ex,text depth=.25ex] {\emph{Year}};
    \node[above left =.5cm and 1cm of s, text width=5em, align=center] {\emph{Approaches}};
    \end{tikzpicture}
\end{document}
```
****

![](./src/transparent_circles+multi+pgf+set.png)

  * [transparent_circles+multi+pgf+set.tex](https://github.com/walmes/Tikz/blob/master/src/transparent_circles+multi+pgf+set.pgf)

```tex
% https://tex.stackexchange.com/a/48596/173708
\documentclass{scrartcl}
\usepackage{tikz}
\usetikzlibrary{calc}  

% split figures into pages
\usepackage[active,tightpage]{preview}
\PreviewEnvironment{tikzpicture}
\setlength\PreviewBorder{1pt}%

\begin{document} 

% If their areas of the circle nodes represent some numbers with proportionality 
% then you need to know exactly the radius. The radius depends of minimum width 
% and of \pgflinewidth.
%
% we have : radius = (minimum width + line width) / 2  if inner sep = 0pt
%
% In the next example, I choice first minimum width=2cm then minimum width=2cm,
% line width=5mm and finally line width=5mm,minimum width=2cm-\pgflinewidth 
% with in all cases inner sep= 0 pt.
%

	
\begin{tikzpicture} 
  \draw[help lines,step=0.1,,draw=orange] (0,0) grid (8,1); 
  \draw[help lines] (0,0) grid (8,1);     
  \node[minimum width=2cm,circle,inner sep=0pt,fill=blue!20,fill opacity=.5]{};
  \node[minimum width=2cm,circle,inner sep=0pt,fill=blue!20,fill opacity=.5,
        line width=5mm,draw=gray,opacity=.5] at (3,0){}; 
  \node[circle,inner sep=0pt,fill=blue!20,,fill opacity=.5,
        line width=5mm,draw=gray,opacity=.5,minimum width=2cm-\pgflinewidth]  at (6,0) {}; 
\end{tikzpicture}  

% Now if I want to get three circles with areas equal to pi, 2pi and 3pi 
% I created a macro `def\lw{2mm}` to change quickly the line width in all nodes

\tikzset{myrad/.style 2 args={circle,inner sep=0pt,minimum width=(2*(sqrt(#1)*1 cm ) - \pgflinewidth,fill=#2,draw=#2,fill opacity=.5,opacity=.8}}    

\begin{tikzpicture} 
	\def\lw{2mm}
	\draw[help lines,step=0.1,,draw=orange] (0,0) grid (8,1); 
	\draw[help lines] (0,0) grid (8,1);     
	\node[line width=\lw,myrad={1}{blue!20}]  at (0,0) {1}; 
	\node[line width=\lw,myrad={2}{red!20}]  at (3,0) {2};
	\node[line width=\lw, myrad={3}{green!20}]  at (7,0) {3};   
\end{tikzpicture}  

% Finally If you want nodes with areas equal to 1 cm^2, 2 cm^2 and 3 cm^2 : 
% I change the line width for the second group of nodes

\begin{tikzpicture} 
	\def\lw{2mm}
	\draw[help lines,step=0.1,,draw=orange] (0,0) grid (8,1); 
	\draw[help lines] (0,0) grid (8,1);     
	\node[line width=\lw,myrad={1}{blue!20}]  at (0,0) {1}; 
	\node[line width=\lw,myrad={2}{red!20}]  at (3,0) {2};
	\node[line width=\lw, myrad={3}{green!20}]  at (7,0) {3};   
\end{tikzpicture}    

\begin{tikzpicture} 
	\def\lw{5mm}
	\draw[help lines,step=0.1,,draw=orange] (0,0) grid (8,1); 
	\draw[help lines] (0,0) grid (8,1);     
	\node[line width=\lw,myrad={1}{blue!20}]  at (0,0) {1}; 
	\node[line width=\lw,myrad={2}{red!20}]  at (3,0) {2};
	\node[line width=\lw, myrad={3}{green!20}]  at (7,0) {3};   
\end{tikzpicture}

%To avoid this kind of problem, we can use circles instead of circle nodes. But we need to adjust the radius wit the pgflinewidth. In the next example,I want a radius = 2cm so I need to use : radius=2cm-0.5\pgflinewidth. Then I need to create a node with the same dimensions.
%
%Like the question about node and rectangle here, we can associate a node to the shape The main problem : we can't use scale but it's more easy to place a label.

\tikzset{set node/.style={insert path={% 
	\pgfextra{% 
		\node[inner sep=0pt,outer sep = 0pt,draw=black, % draw= none only to show what I do
		circle,
		minimum width=2*\pgfkeysvalueof{/tikz/x radius}+0.5\pgflinewidth](#1) {};
}}}}

\begin{tikzpicture}
	\draw[help lines] (-3,-3) grid (3,3);
	\draw[blue,line width=5mm,opacity=.2] (0,0) circle [radius=2cm-0.5\pgflinewidth,set node=C1]  ; 
	\draw[thick,->] (3,-3) -- (C1.east);
\end{tikzpicture}

\end{document} 
```
