# Panduan Spesifikasi Teknis & Arsitektur Template Skripsi 
## Universitas Amikom Purwokerto (Standar LaTeX / Overleaf)

Dokumen ini adalah **Spesifikasi Master** yang ditujukan untuk Agen AI, pengembang, atau penulis yang ingin mereplikasi atau mengonversi pedoman penulisan skripsi resmi Universitas Amikom Purwokerto ke dalam sistem pengelolaan dokumen berbasis LaTeX.

---

## 1. Konfigurasi Dokumen Dasar & Prasyarat (Global Setup)
*   **Engine & Kelas Dokumen:** Menggunakan `\documentclass[12pt,a4paper]{report}` atau *custom class* berbasis `report`.
*   **Margin Halaman (Geometry):** Mengikuti standar baku institusi (biasanya: Kiri 4 cm, Atas 4 cm, Kanan 3 cm, Bawah 3 cm untuk penjilidan skripsi).
*   **Jenis Huruf (Font):** Times New Roman (menggunakan engine `XeLaTeX` atau `LuaLaTeX` agar mendukung font sistem secara native via paket `fontspec`).
*   **Pengaturan Spasi (Line Spacing):**
    *   Teks Utama (Bab I - V): Spasi 2 (`\doublespacing` atau kustom `\linespread{2.0}`).
    *   Abstrak, Kutipan Blok, Tabel, dan Catatan Kaki: Spasi 1 atau 1.5 sesuai konteks.
    *   Sebelum dan sesudah judul bab / sub-bab: *Before/After Space* dikontrol ketat agar tidak ada jarak berlebih yang merusak estetika.

---

## 2. Struktur Bagian Awal (*Front Matter*)
Bagian awal menggunakan penomoran halaman Romawi kecil (`\pagenumbering{roman}`) mulai dari halaman judul hingga daftar lampiran.

### A. Halaman Sampul Depan (Cover)
*   **Judul Skripsi:** Huruf Kapital (Uppercase), maksimal 20 kata, berbentuk piramida terbalik (huruf V) jika lebih dari 1 baris. Istilah asing dicetak miring (`\emph{}`).
*   **Teks Tersembunyi:** Terdapat teks putih bertuliskan `HALAMAN SAMPUL` di antara judul dan keterangan skripsi (bertujuan agar terbaca secara otomatis oleh generator daftar isi).
*   **Logo Kampus:** Tinggi 4 cm, lebar 5,5 cm, diletakkan di tengah.
*   **Identitas Penulis:** Nama mahasiswa (Capitalize Each Word, font ukuran 12, tebal), NIM, Program Studi (Huruf Kapital), Fakultas (Fakultas Ilmu Komputer atau Fakultas Bisnis dan Ilmu Sosial), institusi "UNIVERSITAS AMIKOM PURWOKERTO", kota "PURWOKERTO", dan Tahun Ujian.

### B. Halaman Judul Dalam
*   Mirip dengan Halaman Sampul, tetapi dilengkapi teks putih `HALAMAN JUDUL` serta tambahan kalimat persyaratan: 
    *   *"Untuk memenuhi sebagian persyaratan mencapai derajat Sarjana S1 pada Program Studi ... Fakultas ..."*.
    *   Spasi baris 1 (`\singlespacing`).

### C. Halaman Persetujuan Dosen Pembimbing
*   Mendukung opsi **1 Pembimbing** (Pembimbing Tunggal) atau **2 Pembimbing**.
*   Memuat: Judul skripsi, nama mahasiswa, NIM, tanggal ACC terakhir, blok tanda tangan dosen lengkap dengan gelar terbaru dan nomor NIDN (tidak disingkat), serta mengetahui Dekan Fakultas Ilmu Komputer (`Prof. Dr. Eng. Ir. Imam Tahyudin, M.M., NIK. 2012.09.1.009`) dan Kaprodi terkait.

### D. Halaman Pengesahan Dewan Penguji
*   Memuat tanggal ujian skripsi, tabel daftar penguji (Penguji 1, Penguji 2, Penguji 3/Pendamping beserta NIDN), pernyataan bahwa skripsi telah diterima untuk gelar Sarjana Komputer (S.Kom.), serta tanda tangan Dekan.

### E. Surat Pernyataan Keaslian Penelitian
*   Pernyataan resmi bahwa naskah asli dan belum pernah dibuat orang lain.
*   Dilengkapi keterangan tempat dan tanggal, kotak keterangan materai Rp10.000, tanda tangan mahasiswa, serta NIM.

### F. Halaman Persembahan & Motto
*   Ditulis singkat, resmi, dan terstruktur. Menggunakan spasi 2.

### G. Kata Pengantar
*   Berisi ucapan terima kasih resmi kepada pihak terkait (tanpa pihak yang tidak relevan). Diakhiri dengan kota, tanggal, dan kata **"Penulis"** di sebelah kanan bawah (tanpa nama terang dan tanda tangan).

### H. Daftar-Daftar (Contents, Tables, Figures, Terms, Appendices)
*   **Daftar Isi:** Memuat seluruh Bab dan Sub-Bab utama. Sub-bab yang masuk daftar isi dicetak tebal (`\textbf`), sedangkan yang tidak masuk dicetak normal.
*   **Daftar Tabel & Daftar Gambar:** Memuat nomor, judul, dan halaman.
*   **Daftar Lampiran:** Tidak menggunakan titik-titik dan nomor halaman.

### I. Abstrak & Abstract
*   **Abstrak (Bahasa Indonesia):** 1 paragraf, 150–250 kata, jarak 1 spasi, font Times New Roman 12. Memuat latar belakang, metode, hasil, dan kesimpulan. Dilengkapi 3–5 kata kunci (`Kata kunci:`).
*   **Abstract (Bahasa Inggris):** Diterjemahkan dari abstrak Indonesia, dicetak miring total (`\textit{`), dilengkapi `Keywords:`.

---

## 3. Struktur Bagian Inti (*Main Body* - Bab I s.d. Bab V)
Penomoran halaman berubah menjadi angka Arab (`\pagenumbering{arabic}`) dimulai dari Bab I.
*   **Posisi Nomor Halaman:**
    *   Halaman awal setiap bab: Di **bawah tengah** (`\pagestyle{plain}`).
    *   Halaman selanjutnya: Di **sisi kanan atas** (`\fancyhead[R]{\thepage}`).
*   **Spasi Isi:** Spasi 2 (`\doublespacing`).

### Rincian Bab:
1.  **BAB I PENDAHULUAN:** Latar Belakang Masalah, Rumusan Masalah, Batasan Masalah, Tujuan Penelitian, Manfaat Penelitian (Teoritik & Aplikatif).
2.  **BAB II TINJAUAN PUSTAKA:** Landasan Teori, Penelitian Sebelumnya (wajib menyajikan tabel perbandingan minimal 3 artikel: 2 jurnal nasional, 1 jurnal internasional).
3.  **BAB III METODE PENELITIAN:** Tempat dan Waktu (jika ada), Metode Pengumpulan Data, Alat dan Bahan Penelitian, Konsep Penelitian.
4.  **BAB IV HASIL DAN PEMBAHASAN:** Pemaparan temuan ilmiah dan penjabaran hasil sesuai tahapan konsep di Bab III.
5.  **BAB V PENUTUP:** Kesimpulan (menjawab rumusan masalah) dan Saran (rekening masukan untuk penelitian lanjutan).

---

## 4. Aturan Spesifik Tabel, Gambar, dan Rumus Matematika

### A. Tabel
*   **Caption/Judul Tabel:** Terletak di **atas** tabel dengan jarak 1 spasi. Format nomor: `Tabel X.Y. Judul Tabel`.
*   **Isi Tabel:** Menggunakan font Times New Roman ukuran **10**, jarak spasi **1**, dan posisi rata kanan-kiri (*justify*).
*   **Tabel Lanjutan (Multi-page Tables):** Jika tabel terpotong ke halaman berikutnya, wajib diberi label ulang dengan format: `Tabel X.Y. Judul Tabel (Lanjutan)` lengkap dengan kepala tabel (*header*) di halaman baru.

### B. Gambar
*   **Caption/Judul Gambar:** Terletak di **bawah** gambar dengan jarak 1 spasi. Format nomor: `Gambar X.Y. Judul Gambar`.
*   **Wajib Rujukan:** Setiap tabel dan gambar *harus* dipanggil di dalam paragraf naskah (contoh: "...ditunjukkan pada Gambar 2.1").

### C. Rumus & Notasi Ilmiah (LaTeX Math Mode)
*   Semua simbol matematika, variabel, persamaan, atau notasi sains **wajib** menggunakan sintaks LaTeX standar (Inline menggunakan `$ ... $$` dan Display menggunakan `$$ ... $$`). Dilarang keras menggunakan karakter Unicode mentah untuk rumus.

---

## 5. Aturan Daftar Pustaka (*Bibliography / References*)
*   **Format Sistem:** Diatur menggunakan BibTeX (`.bib`) dengan *style* yang disesuaikan atau dikustomisasi agar memenuhi gaya Amikom:
    *   Disusun secara alfabetis tanpa gelar kesarjanaan.
    *   Nama belakang penulis ditulis di depan, diikuti inisial nama depan/tengah.
    *   Penulis lebih dari satu dihubungkan dengan kata **"dan"** (bukan `&`).
    *   Penulis 3 orang atau lebih ditulis penulis pertama diikuti **"dkk."** (bukan `et al.`).
    *   Jarak antar referensi 2 spasi, di dalam referensi 1 spasi.
*   **Jenis Rujukan yang Diizinkan:** Buku (tanpa kata PT/CV di penerbit), Jurnal Ilmiah (nama jurnal italic, tanpa vol/no/hal italic), Skripsi/Tesis/Disertasi, Internet/Web, dan Seminar/Prosiding. Modul/bahan ajar dan blogspot dilarang keras.
*   *Catatan Halaman:* Bagian Daftar Pustaka **tidak menggunakan nomor halaman**.

---

## 6. Lampiran (*Appendices*)
*   Berisi Kartu Bimbingan Dosen Pembimbing 1 & 2 (Wajib dan bertanda tangan), surat keterangan instansi, blangko kuesioner, *listing* program, dll.
*   Format judul lampiran: `Lampiran 1. Kartu Bimbingan Dosen Pembimbing 1`.
*   Bagian Lampiran **tidak menggunakan nomor halaman**.