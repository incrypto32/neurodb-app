import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:neurodb/app/architecture/view_builder.dart';
import 'package:neurodb/models/patient/patient.dart';
import 'package:neurodb/ui/views/patient/patient_view_model.dart';
import 'package:neurodb/ui/widgets/cards/rounds_card.dart';
import 'package:neurodb/ui/widgets/gradient_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class PatientView extends StatelessWidget {
  final Patient patient;
  const PatientView(this.patient);

  @override
  Widget build(BuildContext context) {
    final PatientViewModel vm = PatientViewModel(context, patient);

    return GradientScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: vm.showRoundsFormSheet,
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
        body: ViewBuilder<PatientViewModel>(
          modelBuilder: (ctx) => vm,
          builder: (context, vm, snapshot) {
            if (vm.isBusy)
              return Center(
                child: SpinKitRing(
                  color: Colors.white,
                  size: 40,
                ),
              );
            return ListView.builder(
              itemBuilder: (context, index) => index == 0
                  ? buildPatient(context, vm)
                  : RoundsCard(
                      data: vm.roundsData[index - 1],
                    ),
              itemCount: vm.roundsData.length + 1,
            );
          },
        ),
      ),
    );
  }

  Container buildPatient(BuildContext context, PatientViewModel vm) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPatientHeading(),
          buildPatientCard(context),
          buildPatientFilesCard(context, vm),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Rounds",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (vm.roundsData.length == 0)
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "No rounds data available",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
        ],
      ),
    );
  }

  Card buildPatientCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeading(
              context,
              "Patient Details",
            ),
            buildContentBox(
              context,
              title: "Address",
              content: patient.address,
            ),
            buildContentBox(
              context,
              title: "Phone Number",
              content: patient.phone,
            ),
            buildContentBox(
              context,
              title: "Alternate Phone Number",
              content: patient.alternatePhone,
            ),
            buildDetailsExpansionTile(context),
          ],
        ),
      ),
    );
  }

  Card buildPatientFilesCard(BuildContext context, PatientViewModel vm) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeading(
              context,
              "Patient Files",
            ),
            FutureBuilder<List<PatientFile>>(
              future: vm.getFiles(patient),
              builder: (context, snap) => snap.hasData
                  ? Column(
                      children: snap.data
                          .map(
                            (e) => Row(
                              children: [
                                Text("${e.title.toUpperCase()}"),
                                Spacer(),
                                IconButton(
                                  color: Theme.of(context).accentColor,
                                  icon: Icon(Icons.download_sharp),
                                  onPressed: () async {
                                    if (await canLaunch(e.url)) {
                                      await launch(e.url);
                                    } else {
                                      print("Cannot Launch URl");
                                    }
                                  },
                                )
                              ],
                            ),
                          )
                          .toList(),
                    )
                  : SpinKitRing(
                      color: Colors.blue,
                      size: 35,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildPatientHeading() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "${patient.name}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "${patient.age} ${patient.sex}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            child: Column(
              children: [
                Text(
                  "Room No:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${patient.room}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ExpansionTile buildDetailsExpansionTile(BuildContext context) {
    return ExpansionTile(
      title: Text("Details"),
      tilePadding: EdgeInsets.all(0),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSubHeading(context, "Diagnosis"),
        Text("Provsional Diagnosis 1 : ${patient.diagnosis.pd1}"),
        Text("Provsional Diagnosis 2 : ${patient.diagnosis.pd2}"),
        Text("Provsional Diagnosis 3 : ${patient.diagnosis.pd2}"),
        Text("Final Diagnosis  : ${patient.diagnosis.finalDiagnosis}"),
        SizedBox(height: 20),
        buildSubHeading(context, "History"),
        buildHistoryRow(patient.presentHistory.ph1),
        buildHistoryRow(patient.presentHistory.ph2),
        buildHistoryRow(patient.presentHistory.ph3),
        buildHistoryRow(patient.presentHistory.ph4),
        buildHistoryRow(patient.presentHistory.ph5),
        SizedBox(height: 20),
        buildSubHeading(context, "Medication"),
        buildContent(patient.currentMedication),
        SizedBox(height: 20),
        buildSubHeading(context, "Vitals"),
        buildVitalsRow("BP :", patient.vitals.bp),
        buildVitalsRow("Respiration Rate : ", patient.vitals.respRate),
        buildVitalsRow("SP02 :  ", patient.vitals.sp02),
        buildVitalsRow("GRBS : ", patient.vitals.grbs),
        SizedBox(height: 20),
        buildSubHeading(context, "Personal History"),
        buildPersonalHistoryBox(patient),
        SizedBox(height: 20),
        buildSubHeading(context, "Higher Mental Function"),
        Text(
            "Level of consiousness : ${patient.higherMentalFunction.levelOfConsiousness}"),
        Text("Memory : ${patient.higherMentalFunction.memory}"),
        Text("Attention : ${patient.higherMentalFunction.attention}"),
        // Text("MMSE  : ${patient.higherMentalFunction.mmse}"),
        SizedBox(height: 20),
        buildSubHeading(context, "Cranial Nerve"),
        Text("Motor System : ${patient.cranialNerve.motorSystem}"),
        Text("Cerebral Sign : ${patient.cranialNerve.cerebralSign}"),
        Text("Meningial Sign : ${patient.cranialNerve.meningialSign}"),
        Text("Periferal Nerves : ${patient.cranialNerve.motorSystem}"),
        SizedBox(height: 30)
      ],
    );
  }

  Row buildHistoryRow(History history) {
    return Row(
      children: [
        Expanded(
          child: Text("${history.description}"),
        ),
        SizedBox(
          width: 20,
        ),
        Text("${history.duration}")
      ],
    );
  }

  Row buildVitalsRow(String title, String value) {
    return Row(
      children: [
        Expanded(
          child: Text("$title"),
        ),
        SizedBox(
          width: 20,
        ),
        Text("$value")
      ],
    );
  }

  Container buildContent(String content) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text("${content ?? ""}"),
    );
  }

  Container buildHeading(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Container buildContentBox(BuildContext context,
      {@required String title, String content}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [buildSubHeading(context, title), Text("$content")],
      ),
    );
  }

  Container buildSubHeading(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildPersonalHistoryBox(Patient patient) {
    return Text("${patient.personalHistory.personalHistory()}");
  }
}
