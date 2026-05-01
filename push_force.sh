#!/bin/bash

# Masuk ke direktori project (opsional jika sudah di dalam folder)
# cd /data/data/com.termux/files/home/Folder_3_Administrasi

echo "🚀 Memulai proses Push Force ke Dimensi GitHub..."

# Menambahkan semua perubahan
git add .

# Membuat commit otomatis dengan timestamp
git commit -m "Update otomatis Piramida Guard: $(date)"

# Melakukan push force ke branch main
# PERINGATAN: Ini akan menimpa semua data di repo GitHub sesuai dengan yang ada di HP Anda
git push origin main --force

echo "✅ Berhasil dipaksa masuk ke repositori!"

