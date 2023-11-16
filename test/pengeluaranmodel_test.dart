import 'package:flutter_test/flutter_test.dart';
import 'package:redlenshoescleaning/model/pengeluaranmodel.dart';

void main() {
  // Membuat objek PengeluaranModel dengan data contoh
  final pengeluaran = PengeluaranModel(
    id: '1',
    selectedDate: '2023-11-12',
    namabarang: 'Buku',
    hargabarang: '50000',
  );

  // Menguji method toMap()
  test('toMap() should return a map of the object', () {
    // Mengharapkan hasil toMap() sama dengan map yang diharapkan
    expect(pengeluaran.toMap(), {
      'id': '1',
      'selectedDate': '2023-11-12',
      'namabarang': 'Buku',
      'hargabarang': '50000',
    });
  });

  // Menguji method fromMap()
  test('fromMap() should return an object from a map', () {
    // Membuat map dengan data contoh
    final map = {
      'id': '2',
      'selectedDate': '2023-11-13',
      'namabarang': 'Pulpen',
      'hargabarang': '10000',
    };

    // Mengharapkan hasil fromMap() sama dengan objek yang diharapkan
    expect(PengeluaranModel.fromMap(map), isA<PengeluaranModel>());
    expect(PengeluaranModel.fromMap(map).id, '2');
    expect(PengeluaranModel.fromMap(map).selectedDate, '2023-11-13');
    expect(PengeluaranModel.fromMap(map).namabarang, 'Pulpen');
    expect(PengeluaranModel.fromMap(map).hargabarang, '10000');
  });

  // Menguji method toJson()
  test('toJson() should return a JSON string of the object', () {
    // Mengharapkan hasil toJson() sama dengan string JSON yang diharapkan
    expect(pengeluaran.toJson(),
        '{"id":"1","selectedDate":"2023-11-12","namabarang":"Buku","hargabarang":"50000"}');
  });

  // Menguji method fromJson()
  test('fromJson() should return an object from a JSON string', () {
    // Membuat string JSON dengan data contoh
    final json =
        '{"id":"3","selectedDate":"2023-11-14","namabarang":"Pensil","hargabarang":"5000"}';

    // Mengharapkan hasil fromJson() sama dengan objek yang diharapkan
    expect(PengeluaranModel.fromJson(json), isA<PengeluaranModel>());
    expect(PengeluaranModel.fromJson(json).id, '3');
    expect(PengeluaranModel.fromJson(json).selectedDate, '2023-11-14');
    expect(PengeluaranModel.fromJson(json).namabarang, 'Pensil');
    expect(PengeluaranModel.fromJson(json).hargabarang, '5000');
  });
}