class BahanMakanan {
  String nama;
  double jumlahStok;
  DateTime tanggalKedaluwarsa;

  BahanMakanan(this.nama, this.jumlahStok, this.tanggalKedaluwarsa);

  bool sudahKedaluwarsa() => DateTime.now().isAfter(tanggalKedaluwarsa);

  @override
  String toString() {
    return "$nama - $jumlahStok kg (Kedaluwarsa: ${tanggalKedaluwarsa.toLocal().toShortDateString()})";
  }
}

class InventoriRestoran {
  List<BahanMakanan> bahanMakananList = [];


  void tambahBahan(String nama, double stok, DateTime tanggalKedaluwarsa) {
    bahanMakananList.add(BahanMakanan(nama, stok, tanggalKedaluwarsa));
    print("Bahan $nama berhasil ditambahkan ke inventori.");
  }

 
  void tampilkanSemuaBahan() {
    print("\n=== Daftar Bahan Makanan ===");
    if (bahanMakananList.isEmpty) {
      print("Inventori kosong.");
    } else {
      for (var bahan in bahanMakananList) {
        print(bahan);
      }
    }
  }


  void cekKedaluwarsa() {
    print("\n=== Status Kedaluwarsa ===");
    if (bahanMakananList.isEmpty) {
      print("Tidak ada bahan untuk diperiksa.");
      return;
    }

    for (var bahan in bahanMakananList) {
      if (bahan.sudahKedaluwarsa()) {
        print("${bahan.nama} sudah kedaluwarsa.");
      } else {
        print("${bahan.nama} masih aman.");
      }
    }
  }
}

extension DateTimeExtension on DateTime {
  String toShortDateString() {
    return "${this.day}/${this.month}/${this.year}";
  }
}

void main() {

  var inventori = InventoriRestoran();

  
  inventori.tambahBahan('Gurita ', 15, DateTime(2024, 12, 8));
  inventori.tambahBahan('Beras', 30, DateTime(2025, 6, 20));
  inventori.tambahBahan('Ayam potong', 50, DateTime(2024, 8, 7));
  inventori.tambahBahan('Minyak', 90, DateTime(2024, 8, 4));


  inventori.tampilkanSemuaBahan();

  inventori.cekKedaluwarsa();
}
