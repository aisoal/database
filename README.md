<pre align="center">

   ░███   ░██████                             ░██ 
  ░██░██    ░██                               ░██ 
 ░██  ░██   ░██  ░███████  ░███████  ░██████  ░██ 
░█████████  ░██ ░██       ░██    ░██      ░██ ░██ 
░██    ░██  ░██  ░███████ ░██    ░██ ░███████ ░██ 
░██    ░██  ░██        ░██░██    ░██░██   ░██ ░██ 
░██    ░██░██████░███████  ░███████  ░█████░██░██ 
</pre>

# Database

Repositori ini berisi struktur database (schema) untuk proyek **AIsoal**. File SQL yang disediakan di sini bersifat **bersih (clean)**, artinya hanya memuat struktur tabel dan relasinya tanpa data sampah (dummy data).

## 📂 Struktur Tabel

File `aisoal.sql` akan membuat 5 tabel utama yang saling berelasi:

1.  **`users`**
    - Menyimpan data pengguna (email, password hash, statistik generasi).
2.  **`generation_sessions`**
    - Menyimpan sesi pembuatan soal (judul, nama file PDF, model AI yang digunakan).
3.  **`prompt_templates`**
    - Menyimpan template instruksi untuk AI (Prompt Engineering).
4.  **`generation_logs`**
    - Mencatat log teknis proses generasi (durasi, token usage, halaman yang diproses).
5.  **`generated_questions`**
    - Menyimpan hasil output soal dari AI yang sudah di-parsing (pertanyaan, jawaban, pembahasan, dll).

## 🚀 Cara Import ke phpMyAdmin

Ikuti langkah-langkah berikut untuk memasang database di komputer lokal menggunakan XAMPP/WAMP/Laragon:

### 1. Persiapan

Pastikan server MySQL dan Apache/Nginx Anda sudah berjalan.

### 2. Buat Database Baru

1.  Buka browser dan masuk ke **phpMyAdmin** (biasanya di `http://localhost/phpmyadmin`).
2.  Klik menu **New** (Baru) di sidebar kiri.
3.  Masukkan nama database.
    - _Saran:_ Gunakan nama `aisoal` atau `aisoal_db`
4.  Pilih penyandian (collation): `utf8mb4_general_ci`.
5.  Klik tombol **Create** (Buat).

### 3. Import File SQL

1.  Klik nama database yang baru saja Anda buat di sidebar kiri.
2.  Pilih tab **Import** di menu bagian atas.
3.  Klik tombol **Choose File** (Pilih File).
4.  Cari dan pilih file `aisoal.sql` dari repositori ini.
5.  Gulir ke bawah dan klik tombol **Go** (Kirim/Impor).

### 4. Verifikasi

Setelah proses selesai, Anda akan melihat pesan sukses berwarna hijau. Pastikan kelima tabel di atas sudah muncul di daftar tabel database Anda.

---

## ⚙️ Konfigurasi AI

Lanjut [📄 Lihat Panduan](https://github.com/aisoal/ai)
