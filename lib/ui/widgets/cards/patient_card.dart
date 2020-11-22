import 'package:flutter/material.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';
import 'package:neurodb/models/patient.dart';
import 'package:neurodb/ui/views/patient/patient_view.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    Key key,
    @required this.patient,
  }) : super(key: key);
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        onPressed: () {
          locator<NavigationService>().navigateToView(PatientView(patient));
        },
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.blueGrey[800]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${patient.name}",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text("${patient.age} ${patient.sex}"),
                    Text("Diagnosis : ${patient.diagnosis.finalDiagnosis}"),
                    Text("${patient.date}")
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Room No:",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "${patient.room}",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
