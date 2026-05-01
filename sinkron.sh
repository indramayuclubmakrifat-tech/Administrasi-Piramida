#!/bin/bash

# --- PROTOKOL SINKRONISASI NUR ---
echo -e "\e[1;35m[PIRAMIDA GUARD]\e[0m Mendata perubahan sistem..."
git add .

# Otomatis membuat pesan commit dengan jam sekarang
JAM_SEKARANG=$(date "+%Y-%m-%d %H:%M:%S")
echo -e "\e[1;36m[PIRAMIDA GUARD]\e[0m Memberi catatan: Update Nur Master $JAM_SEKARANG"
git commit -m "Update Nur Master: $JAM_SEKARANG"

echo -e "\e[1;32m[PIRAMIDA GUARD]\e[0m Mengirim ke GitHub (Cloud)..."
git push

echo -e "\e[1;33m[SINKRON SELESAI]\e[0m Seluruh data sudah aman di dimensi GitHub."
