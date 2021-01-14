import 'package:flutter/material.dart';
import 'package:neurodb/app/architecture/view_model.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';
import 'package:neurodb/app/utilities/custom_exception.dart';
import 'package:neurodb/app/utilities/flushbar_service.dart';
import 'package:neurodb/logic/services/firebase/firesbase.dart';
import 'package:neurodb/logic/services/firebase/firestore.dart';
import 'package:neurodb/models/patient/patient.dart';
import 'package:neurodb/models/round/round.dart';
import 'package:neurodb/ui/widgets/rounds/roundsform.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientViewModel extends ViewModel {
  final BuildContext context;
  final Patient patient;
  final NavigationService _navigationService = locator<NavigationService>();
  final Utils _utils = locator<Utils>();
  List<RoundsData> roundsData = [];

  final FirestoreService firestore =
      locator<FirebaseService>().firestoreService;
  PatientViewModel(this.context, this.patient) {
    getRounds();
  }
  void showRoundsFormSheet() {
    showDialog(context: context, child: RoundsFormSheet(submit: addRoundData));
  }

  Future<List<PatientFile>> getFiles(Patient patient) async {
    return (await firestore.fileCollection(patient.id).get())
        .docs
        .map(
          (e) => PatientFile.fromJson(e.data()),
        )
        .toList();
  }

  void addRoundData(RoundsData roundsData) async {
    await firestore.addRoundsData(
      id: patient.docId,
      roundsData: roundsData,
      onSuccess: () {
        print("onSuccess called");
        _navigationService.popRepeated(1);
        _utils.showBasicFlushBar(context, content: "Successfully added");
        getRounds();
      },
      onError: () {
        _utils.showBasicFlushBar(context,
            content: "An error occured", icon: Icon(Icons.error));
      },
    );
  }

  void getRounds() async {
    setError(false);
    setBusy(true);
    try {
      var roundsResult = await firestore.getRounds(
        this.patient.docId,
        RoundsResult(null, null),
      );
      roundsData = roundsResult.rounds;
      notifyListeners();
    } catch (e) {
      if (e is NoRounds) {
        print("No rounds");
      }
      setError(true);
      print(e);
    }
    setBusy(false);
  }
}
