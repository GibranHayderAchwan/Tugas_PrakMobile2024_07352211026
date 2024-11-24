enum StatusMahasiswa { aktif, cuti, alumni }


abstract class Kehadiran {
  void absensi();
}

mixin AktivitasOrganisasi {
  List<String> daftarOrganisasi = [];

  void ikutOrganisasi(String organisasi) {
    daftarOrganisasi.add(organisasi);
    print('Ikut dalam organisasi $organisasi');
  }

  void tampilkanOrganisasi() {
    if (daftarOrganisasi.isEmpty) {
      print('Belum bergabung dengan organisasi manapun.');
    } else {
      print('Aktif dalam organisasi: ${daftarOrganisasi.join(', ')}');
    }
  }
}

class Mahasiswa {
  String nama;
  String _npm;
  String jurusan;
  StatusMahasiswa status;

  Mahasiswa(
      {required this.nama,
      required String npm,
      required this.jurusan,
      required this.status})
      : _npm = npm;

  String get npm => _npm;
  set npm(String value) {
    if (value.length == 10) {
      _npm = value;
    } else {
      print('NPM harus 10 karakter.');
    }
  }

  void belajar() {
    print('$nama sedang belajar di jurusan $jurusan.');
  }

  void menyelesaikanTugas(String tugas) {
    print('$nama telah menyelesaikan tugas $tugas.');
  }

  void cekStatus() {
    print('$nama memiliki status mahasiswa: ${status.name.toUpperCase()}');
  }

  @override
  String toString() {
    return 'Mahasiswa: $nama, NPM: $_npm, Jurusan: $jurusan, Status: ${status.name}';
  }
}


class MahasiswaAktif extends Mahasiswa
    with AktivitasOrganisasi
    implements Kehadiran {
  int semester;

  MahasiswaAktif(
      {required String nama,
      required String npm,
      required String jurusan,
      required StatusMahasiswa status,
      required this.semester})
      : super(nama: nama, npm: npm, jurusan: jurusan, status: status);


  @override
  void absensi() {
    print('$nama telah hadir di kelas untuk semester $semester.');
  }

  void ambilKRS() {
    print('$nama sedang mengambil KRS untuk semester $semester.');
  }
}


void main() {
  
  var mahasiswa = MahasiswaAktif(
      nama: 'Gibran',
      npm: '0352211026',
      jurusan: 'Informatika',
      status: StatusMahasiswa.aktif,
      semester: 5);

  
  print(mahasiswa);

  
  mahasiswa.belajar();
  mahasiswa.menyelesaikanTugas('PraktikumPemrograman Dart');
  mahasiswa.absensi();
  mahasiswa.ambilKRS();
  mahasiswa.ikutOrganisasi('Sanggar Baskara');
  mahasiswa.ikutOrganisasi('HMTI');
  mahasiswa.tampilkanOrganisasi();
  mahasiswa.cekStatus();
}
