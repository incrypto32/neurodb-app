import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neurodb/models/patient.dart';

class FirestoreService {
  FirebaseFirestore firestore;
  CollectionReference patientCollection;

  FirestoreService() {
    firestore = FirebaseFirestore.instance;
    patientCollection = firestore.collection('patients');
  }

  Future<List<Patient>> getPatients() async {
    QuerySnapshot snap = await patientCollection.get();

    var docs = snap.docs;
    List<Patient> patients = docs
        .map(
          (e) => Patient.fromJson(
            e.data(),
          ),
        )
        .toList();
    return patients;
  }
}
