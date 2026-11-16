# ============================================================
# Template Skripsi Universitas AMIKOM Purwokerto (LaTeX/XeLaTeX)
# Butuh: latexmk, xelatex, biber (MiKTeX/TeX Live), GNU make.
# Pemakaian: make skripsi | make watch | make clean | make cleanall
# ============================================================

PREFIX   = skripsi
DOC      = main

# Ambil identitas dari config/variables.tex
NAMA = $(shell grep -oP '\\NamaMahasiswa\}\{\K[^}]+' config/variables.tex)
NIM  = $(shell grep -oP '\\NIM\}\{\K[^}]+' config/variables.tex)

.PHONY: skripsi watch clean cleanall output

# ── Compile skripsi lengkap ──────────────────────────────────
skripsi:
	latexmk main.tex

# ── Compile berulang saat file berubah ───────────────────────
watch:
	latexmk -pvc main.tex

# ── Salin hasil ke output/ dengan nama rapi ──────────────────
output: skripsi
	@mkdir -p output
	@cp build/$(DOC).pdf "output/$(PREFIX)_$(NAMA)_$(NIM)_$$(date +%Y%m%d-%H%M%S).pdf"
	@echo "PDF tersalin ke output/"

# ── Bersihkan file sampingan (PDF tetap ada) ─────────────────
clean:
	latexmk -c

# ── Bersihkan semua hasil build ──────────────────────────────
cleanall:
	latexmk -C
