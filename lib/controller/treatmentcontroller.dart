import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redlenshoescleaning/model/treatmentmodel.dart';

class TreatmentController {
  final treatmentCollection =
      FirebaseFirestore.instance.collection('treatments');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Future<void> addTreatment(TreatmentModel tmodel) async {
    final treatment = tmodel.toMap();

    final DocumentReference docRef = await treatmentCollection.add(treatment);

    final String docID = docRef.id;

    final TreatmentModel treatmentModel = TreatmentModel(
        id: docID, jenistreatment: tmodel.jenistreatment, harga: tmodel.harga);

    await docRef.update(treatmentModel.toMap());
  }

  Future<void> updateTreatment(TreatmentModel tmodel) async {
    final TreatmentModel treatmentModel = TreatmentModel(
        jenistreatment: tmodel.jenistreatment,
        harga: tmodel.harga,
        id: tmodel.id);

    await treatmentCollection.doc(tmodel.id).update(treatmentModel.toMap());
  }

  Future<void> removeTreatment(String id) async {
    await treatmentCollection.doc(id).delete();
  }

  Future getTreatment() async {
    final treatment = await treatmentCollection.get();
    streamController.sink.add(treatment.docs);
    return treatment.docs;
  }
}
