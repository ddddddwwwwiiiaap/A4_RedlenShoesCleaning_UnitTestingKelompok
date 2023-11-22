// import 'package:flutter_test/flutter_test.dart';
// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:redlenshoescleaning/controller/pesanancontroller.dart';
// import 'package:redlenshoescleaning/model/pesananmodel.dart';

// void main() {
//   late FakeFirebaseFirestore fakeFirestore;
//   late PesananController pesananController;

//   setUp(() {
//     fakeFirestore = FakeFirebaseFirestore();
//     pesananController = PesananController(fakeFirestore.collection('pesanan'));
//   });

//   group('PesananController Tests', () {
//     test('Add Pesanan Test', () async {
//       final pesananModel = PesananModel(
//         // Create a PesananModel object with test data
//         selectedDate: "2021-06-01", // "2021-06-01
//         namapemilik: 'Test User',
//         notelepon: '1234567890',
//         sepatu: 'Sample Shoes',
//         harga: '50.00',
//         status: 'Pending',
//         listitem: 'Sepatu, Kaos Kaki, Tali Sepatu',
//       );

//       await pesananController.addPesanan(pesananModel);

//       final pesananDocs = await fakeFirestore.collection('pesanan').get();
//       expect(pesananDocs.docs.length, 1); // Expecting one document after adding

//       final addedPesanan = pesananDocs.docs.first;
//       expect(addedPesanan.exists, true);
//       expect(addedPesanan['namapemilik'], 'Test User');
//       expect(addedPesanan['status'], 'Pending');
//     });

//     test('Get Total Pendapatan Test', () async {
//       // Add some test data to the fake Firestore collection
//       await fakeFirestore.collection('pesanan').add({
//         'namapemilik': 'User 1',
//         'harga': '30.00',
//         'status': 'Finished',
//       });
//       await fakeFirestore.collection('pesanan').add({
//         'namapemilik': 'User 2',
//         'harga': '50.00',
//         'status': 'Finished',
//       });

//       final totalPendapatan = await pesananController.getTotalPendapatan();
//       expect(
//           totalPendapatan, '80.00'); // Expecting the total as a string '80.00'
//     });

//     test('Remove Pesanan Test', () async {
//       // Add a pesanan
//       final pesananModel = PesananModel(
//         selectedDate: "2021-06-01",
//         namapemilik: 'To Be Removed',
//         notelepon: '1234567890',
//         sepatu: 'Shoes to Remove',
//         harga: '50.00',
//         status: 'Pending',
//         listitem: 'Sepatu, Kaos Kaki, Tali Sepatu',
//       );
//       await pesananController.addPesanan(pesananModel);

//       // Retrieve added pesanan
//       final pesananDocs = await fakeFirestore.collection('pesanan').get();
//       final addedPesanan = pesananDocs.docs.first;

//       // Remove the pesanan
//       await pesananController.removePesanan(addedPesanan.id);

//       final removedPesanan =
//           await fakeFirestore.collection('pesanan').doc(addedPesanan.id).get();
//       expect(
//           removedPesanan.exists, false); // Expecting the document to be removed
//     });

//     test('Get Pesanan Test', () async {
//       // Add some test data
//       await fakeFirestore.collection('pesanan').add({
//         'namapemilik': 'User 1',
//         'harga': '30.00',
//         'status': 'Finished',
//       });
//       await fakeFirestore.collection('pesanan').add({
//         'namapemilik': 'User 2',
//         'harga': '50.00',
//         'status': 'Finished',
//       });

//       final pesananList = await pesananController.getPesanan();
//       expect(pesananList.length, 2); // Expecting two orders in the list
//     });

//     test('Get Total Pendapatan with No Finished Orders Test', () async {
//       final totalPendapatan = await pesananController.getTotalPendapatan();
//       expect(totalPendapatan,
//           '0.00'); // Expecting zero income when no orders are finished
//     });
//   });
// }