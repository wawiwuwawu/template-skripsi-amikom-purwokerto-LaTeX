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
`\daftaristilahfalse` menyembunyikan Daftar Istilah (default tampil, sesuai
template asli).
Halaman Persetujuan menyusun KEDUA varian seperti template asli (2 pembimbing
lalu pembimbing tunggal) — pilih salah satu dengan berkomentar pada baris
`\PersetujuanSatuPembimbing` / `\PersetujuanDuaPembimbing` di
`formats/persetujuan.tex`.

### Menulis isi bab
Edit `chapters/bab1.tex`–`bab5.tex`. Struktur sub-bab AMIKOM pakai huruf:
`\section{Latar Belakang Masalah}` → "A. Latar Belakang Masalah".
Sub-sub-bab: `\subsection{...}` → "1. ..."; tingkat keempat → "a. ...".
Hanya BAB dan sub-bab yang masuk DAFTAR ISI (otomatis, tebal).

**Paragraf isi BAB wajib dibungkus lingkungan `isi`** — indentasi template
asli: baris lanjutan menjorok kiri 0,75cm, baris pertama total 1,75cm dari
margin (kolom isi 13,25cm). Sub-bab tetap di margin. Daftar di dalam isi
pakai `leftmargin=0cm` agar sejajar dengan indent paragraf.

**Teks contoh di semua halaman disalin verbatim dari
`reference/Template_Skripsi.docx`** (BAB I–V, abstrak, abstract, kata
pengantar, persembahan, motto) — jangan diparafrase; ganti dengan naskah
mahasiswa. Daftar bernomor di template asli: Batasan & Tujuan memakai
huruf (a., b.), Manfaat/Landasan/Penelitian Sebelumnya memakai angka
(1., 2., ...), tanpa tanda baca di ujung butir.

### Tabel (wajib: caption di atas, isi TNR 10 spasi 1, kepala abu-abu, dirujuk di naskah)
```tex
\begin{tabel}{@{}c l l@{}}
  \caption{Data mahasiswa}\label{tab:data}\\
  \hline
  \rowcolor{gray!25}                     % kepala tabel abu-abu (template asli)
  No & NIM & Nama Mahasiswa\\
  \hline
  \endfirsthead
  \TabelLanjutan{3}{Data mahasiswa}\\    % halaman lanjutan (auto)
  \hline
  \rowcolor{gray!25}
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
Contoh tabel yang melewati halaman (Tabel 2.3 xyz di `chapters/bab2.tex`)
memakai `\pagebreak` **di antara baris** longtable agar pemutusan halaman
terlihat di template — pada halaman lanjutan judul
"Tabel X.Y. ... (Lanjutan)" + kepala berulang muncul otomatis dari
`\TabelLanjutan` di `\endhead`. Catatan: `\caption*` di longtable tetap
menaikkan counter tabel, dan `\addtocounter` di dalam longtable memicu
`Misplaced \noalign` — koreksi nomor dilakukan di luar lingkungan tabel.

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
- Halaman dengan penanda putih (teks tersembunyi, masuk DAFTAR ISI lewat
  `\HalamanAwal`): `HALAMAN SAMPUL`, `HALAMAN JUDUL`, `HALAMAN
  PERSETUJUAN`, `HALAMAN PENGESAHAN`, `HALAMAN PERNYATAAN KEASLIAN`.
  Halaman PERSEMBAHAN & MOTTO memakai judul TERLIHAT bold + `\TocHalaman`
  (sesuai template asli), begitu juga KATA PENGANTAR dan semua DAFTAR-*.
- Halaman PERSETUJUAN memuat judul terlihat "PERSETUJUAN" di atas penanda
  putih; nama dosen di blok tanda tangan otomatis tebal + bergaris bawah
  (macro `\NamaTTD`, bisa pindah baris); blok 2 pembimbing rata kiri.
- Halaman PENGESAHAN: tiap penguji = nama bergaris bawah + NIDN di kiri
  dan garis tanda tangan di kolom kanan (label "Penguji N" tidak dicetak —
  nama menggantikannya, sesuai versi terisi template asli).
- Daftar Lampiran: tanpa titik-titik dan tanpa nomor halaman.
- Kata Pengantar diakhiri kota+tanggal dan kata "Penulis" RATA KIRI
  (sesuai template asli), tanpa nama terang/tanda tangan.
- Kata kunci/Keywords (abstrak) tanpa bold; judul ABSTRACT miring.
- Materai Rp10.000 pada Surat Pernyataan Keaslian (kotak placeholder,
  blok tanda tangan vertikal di kanan bawah).

## What NOT to do

- Jangan compile file selain `main.tex` (file lain adalah bagian input).
- Jangan hardcode identitas mahasiswa/dosen di format atau bab.
- Jangan mengubah nilai kalibrasi format di `config/formatting.tex` tanpa
  dasar dari panduan (`reference/panduan_master_template_skripsi_amikom_latex.md`).
- Jangan menaruh logo/asset di luar `assets/`.
- Jangan menulis entri daftar pustaka manual — pakai BibTeX.
- Jangan memakai `pdflatex` — template bergantung `fontspec` (XeLaTeX).
