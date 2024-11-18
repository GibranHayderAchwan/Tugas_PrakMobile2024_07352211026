class BahanMakanan {
  String nama;
  double jumlahStok;
  DateTime tanggalKedaluwarsa;

  BahanMakanan(this.nama, this.jumlahStok, this.tanggalKedaluwarsa);

  // Mengecek apakah bahan sudah kedaluwarsa
  bool cekKedaluwarsa() {
    return DateTime.now().isAfter(tanggalKedaluwarsa);
  }

  // Menambah stok bahan
  void tambahStok(double jumlah) {
    jumlahStok += jumlah;
    print(
        "Stok $nama berhasil ditambahkan. Total stok sekarang: $jumlahStok kg.");
  }

  // Mengurangi stok bahan
  void kurangiStok(double jumlah) {
    if (jumlahStok >= jumlah) {
      jumlahStok -= jumlah;
      print("Stok $nama berhasil dikurangi. Sisa stok: $jumlahStok kg.");
    } else {
      print("Stok tidak mencukupi untuk $nama.");
    }
  }
}

class InventoriRestoran {
  List<BahanMakanan> daftarBahan = [];

  // Menambahkan bahan ke dalam inventori
  void tambahBahan(BahanMakanan bahan) {
    daftarBahan.add(bahan);
  }

  // Mengecek semua bahan yang sudah kedaluwarsa
  void cekSemuaKedaluwarsa() {
    for (var bahan in daftarBahan) {
      if (bahan.cekKedaluwarsa()) {
        print("${bahan.nama} sudah kedaluwarsa.");
      } else {
        print("${bahan.nama} masih aman.");
      }
    }
  }
}

void main() {
  // Membuat objek inventori restoran
  var inventori = InventoriRestoran();

  // Menambahkan beberapa bahan makanan dengan tanggal kedaluwarsa yang berbeda
  inventori
      .tambahBahan(BahanMakanan('Ikan Salmon', 10, DateTime(2024, 10, 20)));
  inventori.tambahBahan(BahanMakanan('Tepung', 20, DateTime(2025, 5, 15)));
  inventori.tambahBahan(BahanMakanan('Susu', 5, DateTime(2024, 8, 1)));
  inventori.tambahBahan(BahanMakanan('Mentega', 8, DateTime(2024, 12, 1)));

  // Cek kedaluwarsa bahan makanan
  print("\nStatus Kedaluwarsa Bahan Makanan:");
  inventori.cekSemuaKedaluwarsa();
}
