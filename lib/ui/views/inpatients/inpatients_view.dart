import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:neurodb/app/architecture/view_builder.dart';
import 'package:neurodb/ui/views/inpatients/inpatients_view_model.dart';
import 'package:neurodb/ui/widgets/cards/patient_card.dart';
import 'package:neurodb/ui/widgets/gradient_scaffold.dart';
import 'package:neurodb/ui/widgets/heading.dart';

class InPatientsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Heading(
              boldedText: "In",
              normalText: " Patients",
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ViewBuilder<InPatientsViewModel>(
                modelBuilder: (ctx) => InPatientsViewModel(),
                builder: (context, model, child) => model.isBusy
                    ? Center(
                        child: SpinKitRing(
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          model.loadMore(index);
                          return PatientCard(
                            patient: model.patients[index],
                          );
                        },
                        itemCount: model.patients.length,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
