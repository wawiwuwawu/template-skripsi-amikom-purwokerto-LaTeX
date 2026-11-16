# latexmk config — engine XeLaTeX + biber (biblatex)
# Pemakaian: latexmk main.tex   (mengikuti config ini otomatis)
$out_dir  = 'build';
$aux_dir  = 'build';
$pdf_mode = 5;                # 5 = xelatex
$xelatex  = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';
$biber    = 'biber %O %B';
