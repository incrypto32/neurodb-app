import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neurodb/app/architecture/view_model.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';
import 'package:neurodb/logic/services/firebase/firesbase.dart';
import 'package:neurodb/logic/services/firebase/firestore.dart';
import 'package:neurodb/models/filter/filter.dart';
import 'package:neurodb/models/patient/patient.dart';
import 'package:neurodb/ui/widgets/search/filter_dialog.dart';

class SearchViewModel extends ViewModel {
  final FirestoreService store = locator<FirebaseService>().firestoreService;
  BuildContext context;
  List<Patient> patients = [];
  DocumentSnapshot lastDoc;
  bool initialized = false;
  int limit = 10;
  bool _isLoadingMore = false;
  Filter filters = Filter();

  SearchViewModel(this.context) {
    getInPatients();
  }

  showFilterDialog(BuildContext ctx) {
    showDialog(context: ctx, child: FilterDialog(this));
  }

  setSexFilter(String val) {
    filters.sexFilter = val;
    notifyListeners();
  }

  void getInPatients() async {
    print(
        "Get patients called current length : ${patients.length} , isLoadingMore : $_isLoadingMore , lastDoc :$lastDoc");
    if (_isLoadingMore) return;

    _isLoadingMore = true;
    final patientsResult = await store.getPatients(lastDoc, limit: limit);
    initialized = true;
    lastDoc = patientsResult.lastDoc;
    patients.addAll(patientsResult.patients);
    _isLoadingMore = false;
    notifyListeners();
  }

  void loadMore(int index) {
    print("Load More Called");
    if (lastDoc == null && initialized) {
      print("Not Worthy");
      return;
    }
    if (index == patients.length - 1) {
      getInPatients();
    }
  }
}
