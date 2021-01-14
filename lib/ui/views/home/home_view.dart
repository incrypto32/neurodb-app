import 'package:flutter/material.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';
import 'package:neurodb/app/navigation/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              DefaultTextStyle(
                style: TextStyle(fontSize: 30),
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Row(children: <Widget>[
                    Text(
                      "Neuro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(" DB"),
                  ]),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      _inPatientCard(),
                      Expanded(
                        child: Row(
                          children: [
                            _smallCard(
                              title: "Search",
                              subtitle: "Search all patients",
                              view: Routes.searchView,
                            ),
                            _smallCard(
                              title: "History",
                              subtitle: "All patients",
                              view: Routes.inPatientsView,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inPatientCard() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            locator<NavigationService>().navigateTo(Routes.inPatientsView);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 35,
                color: Colors.indigo[900],
                fontWeight: FontWeight.bold,
              ),
              child: Row(
                children: [
                  Text("In "),
                  Text(
                    "Patients",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _smallCard(
      {@required String title, @required String subtitle, String view}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: RaisedButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {
            locator<NavigationService>().navigateTo(view);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.indigo[900],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
