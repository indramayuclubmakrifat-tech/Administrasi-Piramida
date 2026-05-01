#!/bin/bash

# --- RUMAH BACKUP DENGAN ALARM ---
DEST="/data/data/com.termux/files/home/BACKUP_PIRAMIDA"
mkdir -p $DEST

echo "[RUMAH BACKUP] Memulai proses pengamanan data..."
cp -r ./* $DEST/
echo "[OK] Data sudah masuk ke Rumah Backup."

# Cek apakah termux-api terinstall untuk suara
if command -v termux-tts-speak &> /dev/null
then
    termux-tts-speak "Proses backup selesai. Piramida Guard aman dalam perlindungan Nur."
fi

echo "[SINKRON] Mengirim ke GitHub sebagai cadangan ketiga..."
./sinkron.sh
