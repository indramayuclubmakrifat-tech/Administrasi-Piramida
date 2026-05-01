import csv
import os

# Konfigurasi Jalur Folder Proyek 3
FOLDER = 'Folder_3_Administrasi'
FILE_NAME = os.path.join(FOLDER, 'badges.csv')

def inisialisasi_sistem():
    """Memastikan folder dan file database sudah siap."""
    if not os.path.exists(FOLDER):
        os.makedirs(FOLDER)
        print(f"[*] Folder {FOLDER} berhasil dibuat.")
    
    if not os.path.exists(FILE_NAME):
        with open(FILE_NAME, mode='w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            writer.writerow(['badge_id','badge_name','granted_at','post_id','seq','granted_manually','notification_id','featured_rank'])
        print(f"[*] Database {FILE_NAME} diinisialisasi.")

def tampilkan_tabel():
    if not os.path.exists(FILE_NAME):
        print("Data belum tersedia.")
        return
    
    with open(FILE_NAME, 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        header = next(reader)
        print(f"\n{'ID':<5} | {'NAMA BADGE':<25} | {'STATUS'}")
        print("-" * 45)
        for row in reader:
            if len(row) >= 2:
                print(f"{row[0]:<5} | {row[1]:<25} | Aktif")

def tambah_badge(b_id, b_name):
    with open(FILE_NAME, mode='a', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        # Menjaga konsistensi 8 kolom sesuai standar database kamu
        writer.writerow([b_id, b_name, '', '', '', '', '', ''])
    print(f"\n[√] Berhasil mencatat lencana baru: {b_name}")

# Interface Menu
if __name__ == "__main__":
    inisialisasi_sistem()
    print("\n=== NUR SEMESTA: ADMINISTRASI MEMBER ===")
    print("1. Lihat Daftar Lencana (Tabel)")
    print("2. Daftarkan Lencana Baru")
    print("3. Keluar")
    
    pilihan = input("\nPilih menu (1/2/3): ")

    if pilihan == '1':
        tampilkan_tabel()
    elif pilihan == '2':
        b_id = input("Masukkan ID Badge: ")
        b_name = input("Masukkan Nama Badge: ")
        tambah_badge(b_id, b_name)
    else:
        print("Sistem Standby.")

