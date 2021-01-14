import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neurodb/app/utilities/custom_exception.dart';
import 'package:neurodb/models/patient/patient.dart';
import 'package:neurodb/models/round/round.dart';

class FirestoreService {
  FirebaseFirestore firestore;
  CollectionReference patientCollection;

  FirestoreService() {
    firestore = FirebaseFirestore.instance;
    patientCollection = firestore.collection('patients');
  }

  CollectionReference roundsCollection(String id) {
    return patientCollection.doc(id).collection("rounds");
  }

  CollectionReference fileCollection(String patientID) {
    return patientCollection.doc(patientID).collection('files');
  }

  // GetPatients From firebase
  Future<PatientsResult> getPatients(DocumentSnapshot startAfterDoc,
      {limit: 10}) async {
    Query query = patientCollection.orderBy("date", descending: true);

    if (startAfterDoc != null) {
      print("StartAfter Doc");
      query = query.startAfterDocument(startAfterDoc);
    }
    query = query.limit(limit);
    QuerySnapshot snap = await query.get();
    print("${snap.size}");

    var docs = snap.docs;
    List<Patient> patients = docs
        .map(
          (e) => Patient.fromJson(
            e.data(),
          ).setId(e.id),
        )
        .toList();

    return PatientsResult(
      snap.docs.length == 0 ? null : snap.docs[snap.docs.length - 1],
      patients,
    );
  }

  Future<RoundsResult> getRounds(String id, RoundsResult roundsResult,
      {int limit = 10}) async {
    var lastDoc = roundsResult.doc;
    CollectionReference rounds = roundsCollection(id);

    var query = rounds.orderBy("timeStamp", descending: true).limit(limit);

    if (lastDoc != null) {
      query = query.startAfterDocument(lastDoc);
    }
    var snap = await query.get();
    print(snap.docs.length);
    if (snap.docs.length == 0) throw NoRounds();
    lastDoc = snap.docs[snap.docs.length - 1];
    return RoundsResult(
        snap.docs.map((e) => RoundsData.fromJson(e.data())).toList(), lastDoc);
  }

  Future<void> addRoundsData({
    @required String id,
    @required RoundsData roundsData,
    @required Function onError,
    @required Function onSuccess,
  }) async {
    CollectionReference rounds = roundsCollection(id);
    try {
      roundsData.timeStamp = FieldValue.serverTimestamp();
      print("=========");
      print(roundsData.toJson());
      await rounds.add(roundsData.toJson());
      onSuccess();
    } catch (e) {
      print(e);
      onError();
    }
  }
}

class RoundsResult {
  final List<RoundsData> rounds;
  final DocumentSnapshot doc;
  RoundsResult(this.rounds, this.doc);
}

class PatientsResult {
  final List<Patient> patients;
  final DocumentSnapshot lastDoc;
  PatientsResult(this.lastDoc, this.patients);
}
