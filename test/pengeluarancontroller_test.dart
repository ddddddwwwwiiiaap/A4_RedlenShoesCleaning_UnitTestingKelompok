import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redlenshoescleaning/controller/pengeluarancontroller.dart';
import 'package:redlenshoescleaning/model/pengeluaranmodel.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late PengeluaranController pengeluaranController;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    pengeluaranController =
        PengeluaranController(fakeFirestore.collection('pengeluaran'));
  });

  group('PengeluaranController Tests', () {
    test('Add Pengeluaran Test', () async {
      final pengeluaranModel = PengeluaranModel(
        id: '123',
        selectedDate: "2023-11-16", // 
        namabarang: 'Test Item',
        hargabarang: '50.00',
      );

      await pengeluaranController.addPengeluaran(pengeluaranModel);

      final addedPengeluaran =
          fakeFirestore.collection('pengeluaran').doc('123');
      expect(await addedPengeluaran.get(), isNotNull);
    });

    test('Update Pengeluaran Test', () async {
      final pengeluaranModel = PengeluaranModel(
        id: '123',
        selectedDate: "2023-11-16", // "2023-11-16
        namabarang: 'Initial Item',
        hargabarang: '50.00',
      );

      await fakeFirestore
          .collection('pengeluaran')
          .doc('123')
          .set(pengeluaranModel.toMap());

      final updatedPengeluaran = PengeluaranModel(
        id: '123',
        selectedDate: "2023-11-16", // "2023-11-16
        namabarang: 'Updated Item',
        hargabarang: '75.00',
      );

      await pengeluaranController.updatePengeluaran(updatedPengeluaran);

      final snapshot = await fakeFirestore.collection('pengeluaran').doc('123').get();
      final updatedData = snapshot.data() as Map<String, dynamic>;

      expect(updatedData['namabarang'], 'Updated Item');
      expect(updatedData['hargabarang'], '75.00');
    });

    test('Remove Pengeluaran Test', () async {
      final pengeluaranId = '123';
      await fakeFirestore.collection('pengeluaran').doc(pengeluaranId).set({
        'selectedDate': DateTime.now(),
        'namabarang': 'Test Item',
        'hargabarang': '50.00',
      });

      await pengeluaranController.removePengeluaran(pengeluaranId);

      final deletedPengeluaran =
          fakeFirestore.collection('pengeluaran').doc(pengeluaranId);
      final snapshot = await deletedPengeluaran.get();
      expect(snapshot.exists, false);
    });

    test('Get Total Pengeluaran Test', () async {
      final pengeluaranModel1 = PengeluaranModel(
        id: '1',
        selectedDate: "2023-11-16", // "2023-11-16
        namabarang: 'Item 1',
        hargabarang: '50.00',
      );

      final pengeluaranModel2 = PengeluaranModel(
        id: '2',
        selectedDate: "2023-11-16", // "2023-11-16
        namabarang: 'Item 2',
        hargabarang: '75.00',
      );

      await fakeFirestore
          .collection('pengeluaran')
          .doc('1')
          .set(pengeluaranModel1.toMap());
      await fakeFirestore
          .collection('pengeluaran')
          .doc('2')
          .set(pengeluaranModel2.toMap());

      final totalPengeluaran =
          await pengeluaranController.getTotalPengeluaran();

      expect(totalPengeluaran, '125.00');
    });
  });
}