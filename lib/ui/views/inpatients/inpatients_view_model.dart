import 'package:neurodb/app/architecture/view_model.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';
import 'package:neurodb/logic/services/firebase/firesbase.dart';
import 'package:neurodb/logic/services/firebase/firestore.dart';
import 'package:neurodb/models/patient.dart';

class InPatientsViewModel extends ViewModel {
  final FirestoreService store = locator<FirebaseService>().firestoreService;
  List<Patient> patients = [];

  InPatientsViewModel() {
    getInPatients();
  }

  void getInPatients() async {
    setBusy(true);
    patients = await store.getPatients();
    setBusy(false);
  }
}
