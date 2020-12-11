import 'package:flutter/material.dart';
import 'package:neurodb/models/patient.dart';
import 'package:neurodb/ui/widgets/gradient_scaffold.dart';
import 'package:neurodb/ui/widgets/heading.dart';

class PatientView extends StatelessWidget {
  final Patient patient;
  const PatientView(this.patient);
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Heading(
                boldedText: "Neuro ",
                normalText: "DB",
              ),
              Container(
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
              ),
              Card(
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
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
                        title: "Contact Number",
                        content: patient.phone,
                      ),
                      buildDetailsExpansionTile(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ExpansionTile buildDetailsExpansionTile(BuildContext context) {
    return ExpansionTile(
      title: Text("Details"),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeading(context, "Data"),
        buildSubHeading(context, "Diagnosis"),
        buildContent(patient.diagnosis.pd1),
        buildContent(patient.diagnosis.pd2),
        buildContent(patient.diagnosis.pd3),
        buildContent(patient.diagnosis.finalDiagnosis),
        buildSubHeading(context, "History"),
        buildHistoryRow(patient.presentHistory.ph1),
        buildHistoryRow(patient.presentHistory.ph2),
        buildHistoryRow(patient.presentHistory.ph3),
        buildSubHeading(context, "Medication"),
        buildContent(patient.currentMedication),
        buildHeading(context, "Vitals"),
        buildSubHeading(context, "BP : ${patient.vitals.bp}"),
        buildSubHeading(
          context,
          "Respiration Rate : ${patient.vitals.respRate}",
        ),
        buildSubHeading(context, "SP02 : ${patient.vitals.sp02}"),
        buildSubHeading(context, "GRBS : ${patient.vitals.grbs}"),
        buildPersonalHistoryBox(patient),
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
