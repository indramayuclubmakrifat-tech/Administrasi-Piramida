const express = require('express');
const path = require('path');
const app = express();

// --- KONFIGURASI JALUR UTAMA 8080 ---
const PORT = 8080;

// Melayani file statis (HTML, CSS, JS)
app.use(express.static(path.join(__dirname, '.')));

// Route Utama ke Dashboard Nur 3
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// API Internal untuk cek kesehatan sistem
app.get('/health', (req, res) => {
    res.json({ status: "Jalur 8080 Lancar", nur: "Aktif" });
});

// Menjalankan server pada semua interface (0.0.0.0) agar bisa diakses browser HP
app.listen(PORT, '0.0.0.0', () => {
    console.clear();
    console.log("\x1b[32m%s\x1b[0m", "=============================================");
    console.log("       JALUR 8080 TELAH DIPERBAIKI           ");
    console.log("\x1b[32m%s\x1b[0m", "=============================================");
    console.log(` Status : Cahaya Nur Mengalir`);
    console.log(` Akses  : http://localhost:${PORT}`);
    console.log("=============================================");
});
