import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redlenshoescleaning/controller/treatmentcontroller.dart';
import 'package:redlenshoescleaning/model/treatmentmodel.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late TreatmentController treatmentController;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    treatmentController =
        TreatmentController(fakeFirestore.collection('treatments'));
  });

  group('TreatmentController Tests', () {
    test('Remove Treatment Test', () async {
      // Add a treatment
      final treatmentModel =
          TreatmentModel(jenistreatment: 'To Be Removed', harga: "75.00");
      await treatmentController.addTreatment(treatmentModel);

      // Retrieve added treatment
      final treatmentDocs = await fakeFirestore.collection('treatments').get();
      final addedTreatment = treatmentDocs.docs.first;

      // Remove the treatment
      await treatmentController.removeTreatment(addedTreatment.id);

      final removedTreatment = await fakeFirestore
          .collection('treatments')
          .doc(addedTreatment.id)
          .get();
      expect(removedTreatment.exists,
          false); // Expecting the document to be removed
    });

    test('Get Treatment Test', () async {
      // Add some test data
      await fakeFirestore.collection('treatments').add({
        'jenistreatment': 'Test Treatment 1',
        'harga': 30.00,
      });
      await fakeFirestore.collection('treatments').add({
        'jenistreatment': 'Test Treatment 2',
        'harga': 50.00,
      });

      final treatmentList = await treatmentController.getTreatment();
      expect(treatmentList.length, 2); // Expecting two treatments in the list
    });

    test('Get Treatment with No Treatments Test', () async {
      final emptyTreatmentList = await treatmentController.getTreatment();
      expect(emptyTreatmentList.isEmpty,
          true); // Expecting an empty treatment list
    });

    test('Get Treatment with Single Treatment Test', () async {
      // Add a single treatment
      final treatmentModel = TreatmentModel(
        jenistreatment: 'Single Treatment',
        harga: "200.00",
      );
      await treatmentController.addTreatment(treatmentModel);

      final singleTreatmentList = await treatmentController.getTreatment();
      expect(singleTreatmentList.length,
          1); // Expecting a single treatment in the list
      expect(singleTreatmentList.first['jenistreatment'], 'Single Treatment');
      expect(singleTreatmentList.first['harga'], "200.00");
    });
  });
}
