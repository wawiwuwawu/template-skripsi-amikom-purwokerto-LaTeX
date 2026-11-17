# Template Skripsi Universitas AMIKOM Purwokerto (LaTeX)

Template skripsi **Universitas AMIKOM Purwokerto** berbasis LaTeX, mengikuti
template resmi Word kampus (`reference/Template_Skripsi.docx`) dan spesifikasi
teknis (`reference/panduan_master_template_skripsi_amikom_latex.md`).

- **Engine**: XeLaTeX — font asli **Times New Roman** dari sistem.
- **Struktur**: satu file konten per bagian, identitas dikumpulkan di satu tempat.
- **Daftar pustaka**: BibTeX (biblatex + biber) dengan gaya Amikom
  (`dan`/`dkk.`, alfabetis, tanpa gelar kesarjanaan).

## Mulai Cepat

1. **Edit identitas** di `config/variables.tex` (nama, NIM, judul, pembimbing,
   penguji, prodi/fakultas, tahun & tanggal).
2. Atur pilihan di `config/toggles.tex` (dua pembimbing / tunggal, Penguji
   3/Pendamping, Daftar Istilah).
3. Tulis isi skripsi di `chapters/bab1.tex` … `bab5.tex`.
4. Kelola referensi di `refs/references.bib`, sitasi dengan
   `\parencite{...}` → `(Nama, Tahun)` atau `\textcite{...}` → `Nama (Tahun)`.
5. Compile.

### Compile (lokal)

Butuh **MiKTeX/TeX Live** dengan `latexmk`, `xelatex`, dan `biber`:

```bash
latexmk main.tex       # mengikuti .latexmkrc (out_dir=build)
# atau
make skripsi           # jika GNU make tersedia
make output            # compile + salin PDF ke output/ dengan nama rapi
```

Hasil PDF ada di `build/main.pdf`.

### Compile (Overleaf)

1. Upload seluruh isi repo (atau push ke GitHub lalu New Project from GitHub).
2. **Menu → Settings → Compiler → XeLaTeX**.
3. Main document: `main.tex`. Font Times New Roman sudah tersedia di Overleaf.

## Struktur Folder

```
main.tex                  — runner dokumen (jangan diubah besar)
indonesian.lbx            — lokalisasi biblatex bahasa Indonesia (bawaan repo)
config/
  variables.tex           — identitas skripsi (edit ini terlebih dahulu)
  toggles.tex             — pilihan halaman (2 pembimbing, Penguji 3, daftar istilah)
  packages.tex            — paket LaTeX + biblatex
  fonts.tex               — makro font
  formatting.tex          — semua aturan format + makro bantu
formats/
  cover.tex               — Halaman Sampul Depan (logo 4×5,5 cm, teks putih HALAMAN SAMPUL)
  halaman_judul.tex       — Halaman Judul Dalam (+ kalimat derajat Sarjana S1)
  persetujuan.tex         — Halaman Persetujuan Dosen Pembimbing (1/2 pembimbing)
  pengesahan.tex          — Halaman Pengesahan Dewan Penguji (+ NIDN)
  pernyataan.tex          — Surat Pernyataan Keaslian Penelitian (+ kotak materai Rp10.000)
  persembahan.tex         — Halaman Persembahan
  motto.tex               — Halaman Motto
pages/
  kata_pengantar.tex      — Kata Pengantar (diakhiri "Penulis" kanan bawah)
  daftar_daftar.tex       — Daftar Isi/Tabel/Gambar/(Istilah)/Lampiran
  daftar_istilah.tex      — Daftar Istilah (opsional, aktifkan di toggles)
  abstrak.tex / abstract.tex — Abstrak (spasi 1) & Abstract (italic)
  daftar_pustaka.tex      — Daftar Pustaka (tanpa nomor halaman)
  lampiran.tex            — Lampiran (tanpa nomor halaman)
chapters/
  bab1.tex … bab5.tex     — Pendahuluan, Tinjauan Pustaka, Metode,
                            Hasil dan Pembahasan, Penutup
refs/references.bib       — daftar pustaka BibTeX (5 jenis rujukan)
assets/amikom/            — logo kampus + contoh gambar (dari template asli)
reference/                — template Word asli + panduan spesifikasi
.agents/skills/amikom-skripsi-template/ — panduan untuk agent AI
```

## Aturan Format Penting (ringkasan)

| Aspek | Ketentuan |
|---|---|
| Kertas & margin | A4; kiri 4 cm, atas 4 cm, kanan 3 cm, bawah 3 cm |
| Font | Times New Roman 12pt seluruh naskah |
| Spasi | Bab I–V: 2; daftar: 1,5; abstrak: 1; tabel: 1 (font 10) |
| Sub-bab | Huruf: A., B., C. — lalu 1., 2. dan a., b. |
| Nomor halaman | Bagian awal: romawi (i…); Bab I dst.: arab; **Daftar Pustaka & Lampiran: tanpa nomor** |
| Posisi nomor | Awal bab & bagian awal: bawah tengah; halaman lanjutan: kanan atas |
| Teks tersembunyi | `HALAMAN SAMPUL`, `HALAMAN JUDUL`, dst. — putih, masuk DAFTAR ISI otomatis |
| Caption | Tabel di **atas** (`Tabel X.Y. Judul`), gambar di **bawah** (`Gambar X.Y. Judul`), wajib dirujuk di naskah |
| Tabel lanjutan | `Tabel X.Y. Judul (Lanjutan)` + kepala tabel berulang (pakai lingkungan `tabel`) |
| Judul skripsi | Uppercase, maks. 20 kata, piramida terbalik, kata asing italic |
| Daftar Pustaka | Alfabetis, nama belakang + inisial, `dan` (bukan `&`), `dkk.` (bukan et al.), tanpa gelar; antar-entri spasi 2, dalam entri spasi 1 |

## Makro Bantu

- `\begin{tabel}{kolom}...\end{tabel}` — tabel TNR 10 spasi 1; dukung
  halaman lanjutan dengan `\TabelLanjutan{n}{Judul}` di `\endhead`
  (contoh lengkap di `chapters/bab2.tex`).
- `\begin{landskape}...\end{landskape}` — halaman miring (landscape):
  halaman PDF benar-benar dirotasi di viewer & saat dicetak, nomor
  halaman otomatis horizontal di kanan atas orientasi miring (contoh:
  Tabel 2.3 Penelitian Sebelumnya). Lebar teks saat landscape ≈ 22,7 cm.
- `\TeksTersembunyi{teks}` — teks putih; `\HalamanAwal{NAMA}` — teks putih +
  entri daftar isi; `\TocHalaman{NAMA}` — entri daftar isi saja.
- `\Istilah{istilah}{penjelasan}` — entri Daftar Istilah.
- `\Lampiran{Judul}` — lampiran baru otomatis bernomor & masuk Daftar Lampiran.
- `\KotakMaterai` — kotak pengganti materai Rp10.000 (dicetak, lalu ditempel
  materai asli). `\KotakScan{...}` — kotak penanda tempat scan lampiran.
- `\includepdf[pages=1]{scan.pdf}` — masukkan hasil scan (kartu bimbingan)
  langsung sebagai halaman lampiran.

## Catatan Teknis

- **BibTeX vs biblatex**: template memakai biblatex + biber (`latexmk`
  menjalankan biber otomatis). Ekspor Mendeley/Zotero dalam format BibTeX bisa
  langsung ditempel ke `refs/references.bib`, lalu sesuaikan judul menjadi
  Title Case.
- **Lokalisasi Indonesia**: biblatex belum menyediakan `indonesian.lbx`, jadi
  repo menyertakan `indonesian.lbx` di root proyek (basis `english.lbx`
  biblatex dengan kata-kata sudah diubah: `dan`, `dkk.`, `Diambil dari`,
  `diakses pada`, `Daftar Pustaka`). Jangan hapus atau pindahkan file ini —
  tanpanya kata-kata di daftar pustaka berbahasa Inggris.
- **Daftar Pustaka akan dicek satu per satu saat VALIDASI di Perpustakaan** —
  bandingkan hasil compile dengan contoh di `reference/Template_Skripsi.docx`.

## Lisensi

Lisensi MIT — lihat `LICENSE`. Isi skripsi yang Anda tulis dengan template
ini tetap milik Anda.
