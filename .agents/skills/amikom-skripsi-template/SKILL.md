---
name: amikom-skripsi-template
description: LaTeX template for writing a Skripsi (undergraduate thesis) at Universitas AMIKOM Purwokerto. Use this skill when the user asks to edit, refactor, compile, or add content to the skripsi template in this repository.
version: 1.0.0
author: wawiwuwawu
license: MIT
institution: Universitas AMIKOM Purwokerto
guideline: Panduan Spesifikasi Teknis Template Skripsi AMIKOM Purwokerto (reference/panduan_master_template_skripsi_amikom_latex.md) + Template_Skripsi.docx resmi
---

# AMIKOM Purwokerto Skripsi Template (XeLaTeX)

## Project Structure

```
main.tex                — runner skripsi lengkap (XeLaTeX)
config/
  variables.tex         — identitas skripsi (mahasiswa, judul, pembimbing,
                          penguji, kaprodi, dekan, prodi, fakultas, tanggal)
  toggles.tex           — \duapembimbingtrue/false, \pengujitigatrue/false,
                          \daftaristilahtrue/false
  packages.tex          — paket (fontspec/Times New Roman, biblatex+biber)
  fonts.tex             — makro font
  formatting.tex        — semua aturan format + makro bantu
formats/                — cover, halaman_judul, persetujuan, pengesahan,
                          pernyataan, persembahan, motto
pages/                  — kata_pengantar, daftar_daftar, abstrak, abstract,
                          daftar_istilah, daftar_pustaka, lampiran
chapters/               — bab1.tex … bab5.tex (isi skripsi)
refs/references.bib     — BibTeX (biblatex gaya Amikom)
assets/amikom/          — logo kampus & contoh gambar
reference/              — template Word asli + panduan spesifikasi
```

## Core Principle

**Edit `config/variables.tex` sekali** — nama, judul, dosen, prodi, fakultas,
dan tanggal di semua halaman mengikuti otomatis. Jangan pernah hardcode
identitas di file lain.

## Common Tasks

### Edit identitas
Semua di `config/variables.tex`: `\NamaMahasiswa`, `\NIM`, `\JudulSkripsi`
(break baris dengan `\\` untuk piramida terbalik), `\JudulStudiKasus`,
`\NamaPembimbingSatu/Dua` + `\NIDN...`, `\NamaPengujiSatu/Dua/Tiga`,
`\NamaKaprodi` + `\NIKKaprodi`, `\NamaDekan` + `\NIKDekan` (default Fakultas
Ilmu Komputer), `\NamaProdi`, `\NamaFakultas`, `\TahunUjian`, `\TanggalACC`,
`\TanggalUjian`, `\KataKunci`, `\Keywords`.

### Ganti mode pembimbing / penguji / daftar istilah
`config/toggles.tex`: `\duapembimbingfalse` untuk pembimbing tunggal (Surat
Pernyataan Keaslian otomatis menulis `-` untuk Pembimbing 2),
`\pengujitigafalse` menghapus baris Penguji 3/Pendamping,
`\daftaristilahtrue` menampilkan Daftar Istilah.
Halaman Persetujuan menyusun KEDUA varian seperti template asli (2 pembimbing
lalu pembimbing tunggal) — pilih salah satu dengan berkomentar pada baris
`\PersetujuanSatuPembimbing` / `\PersetujuanDuaPembimbing` di
`formats/persetujuan.tex`.

### Menulis isi bab
Edit `chapters/bab1.tex`–`bab5.tex`. Struktur sub-bab AMIKOM pakai huruf:
`\section{Latar Belakang Masalah}` → "A. Latar Belakang Masalah".
Sub-sub-bab: `\subsection{...}` → "1. ..."; tingkat keempat → "a. ...".
Hanya BAB dan sub-bab yang masuk DAFTAR ISI (otomatis, tebal).

### Tabel (wajib: caption di atas, isi TNR 10 spasi 1, dirujuk di naskah)
```tex
\begin{tabel}{@{}c l l@{}}
  \caption{Data mahasiswa}\label{tab:data}\\
  \hline
  No & NIM & Nama Mahasiswa\\
  \hline
  \endfirsthead
  \TabelLanjutan{3}{Data mahasiswa}\\      % halaman lanjutan (auto)
  \hline
  No & NIM & Nama Mahasiswa\\
  \hline
  \endhead
  \hline
  \endfoot
  \endlastfoot
  1 & 11.11.0001 & Mahasiswa 1\\
\end{tabel}
```
Rujuk wajib: `...ditunjukkan pada Tabel~\ref{tab:data}`.

### Gambar (caption di bawah, dirujuk di naskah)
```tex
\begin{figure}[h]
  \centering
  \includegraphics[width=6cm]{assets/nama-gambar.png}
  \caption{Judul gambar}\label{fig:nama}
\end{figure}
```

### Sitasi & daftar pustaka
Tulis entri di `refs/references.bib`, lalu `\parencite{kunci}` →
`(Wibowo, A. R., 2020)`, `\textcite{kunci}` → `Wibowo, A. R. (2020)`.
Gaya akhir sudah mengikuti Amikom: `dan` (bukan `&`), `dkk.` (3+ pengarang),
alfabetis, tanpa gelar. Jenis rujukan yang diizinkan: `@book` (tanpa PT/CV di
penerbit), `@article` (nama jurnal italic), `@thesis` (type={Skripsi}),
`@online` (klausul "Diambil dari ..., diakses pada ..." di field `note`),
`@inproceedings` (klausul "Dipresentasikan di ..." di field `note`).
Modul/bahan ajar dan blogspot dilarang keras.

### Rumus
Wajib mode matematika LaTeX: inline `$x$`, display `\begin{equation}...\end{equation}`
dan rujuk `\eqref{eq:label}`. Dilarang pakai karakter Unicode mentah.

### Halaman landscape (kertas miring)
Bungkus konten dengan `\begin{landscape}...\end{landscape}` (paket `pdflscape`
sudah termuat): halaman PDF benar-benar dirotasi di viewer & cetak, nomor
halaman mengikuti orientasi miring (kanan atas, sesuai template asli).
Contoh nyata: Tabel 2.3 Penelitian Sebelumnya di `chapters/bab2.tex`.
Lebar teks saat landscape ≈ 22,7 cm — sesuaikan lebar kolom tabel agar tidak
melebihi batas. Longtable/(Lanjutan) tetap bekerja di dalamnya.

### Lampiran (kartu bimbingan WAJIB)
`\Lampiran{Judul}` otomatis bernomor & masuk Daftar Lampiran. Masukkan scan
dengan `\includepdf[pages=1]{assets/scan.pdf}` atau pakai `\KotakScan{...}`
sebagai penanda sementara.

## Compile

```bash
latexmk main.tex     # out_dir=build, xelatex + biber otomatis (.latexmkrc)
```
Overleaf: Compiler = **XeLaTeX**, Main document = `main.tex`.

Urutan compile latexmk: xelatex → biber → xelatex ×2. Kata-kata lokal
biblatex ("dan", "dkk.", dll.) disediakan oleh `indonesian.lbx` di root
proyek (lokalisasi bawaan repo — jangan dihapus atau dipindah).

## Formatting Rules (fixed)

- Margin: kiri 4 cm, atas 4 cm, kanan 3 cm, bawah 3 cm (A4).
- Times New Roman 12pt; spasi 2 (Bab I–V, termasuk judul bab);
  spasi 1,5 (daftar & halaman persetujuan/pengesahan); spasi 1 (abstrak,
  dalam tabel, dalam referensi).
- Nomor halaman: romawi bagian awal (sampul dihitung i, nomornya tak
  ditampilkan); arab mulai Bab I; awal bab & bagian awal bawah tengah,
  halaman lanjutan kanan atas; DAFTAR PUSTAKA & LAMPIRAN tanpa nomor.
- Halaman awal memuat teks putih `HALAMAN SAMPUL`, `HALAMAN JUDUL`,
  `HALAMAN PERSETUJUAN`, `HALAMAN PENGESAHAN`, `HALAMAN PERNYATAAN KEASLIAN`,
  `HALAMAN PERSEMBAHAN`, `HALAMAN MOTTO` agar masuk DAFTAR ISI (macro
  `\HalamanAwal`); halaman berjudul terlihat pakai `\TocHalaman`.
- Daftar Lampiran: tanpa titik-titik dan tanpa nomor halaman.
- Kata Pengantar diakhiri kota+tanggal dan kata "Penulis" kanan bawah,
  tanpa nama terang/tanda tangan.
- Materai Rp10.000 pada Surat Pernyataan Keaslian (kotak placeholder).

## What NOT to do

- Jangan compile file selain `main.tex` (file lain adalah bagian input).
- Jangan hardcode identitas mahasiswa/dosen di format atau bab.
- Jangan mengubah nilai kalibrasi format di `config/formatting.tex` tanpa
  dasar dari panduan (`reference/panduan_master_template_skripsi_amikom_latex.md`).
- Jangan menaruh logo/asset di luar `assets/`.
- Jangan menulis entri daftar pustaka manual — pakai BibTeX.
- Jangan memakai `pdflatex` — template bergantung `fontspec` (XeLaTeX).
