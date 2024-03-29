import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';
import 'package:neurodb/app/navigation/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

class NeuroDB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neuro DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.copyWith(
              headline5: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo[800],
              ),
              bodyText2: TextStyle(
                color: Colors.indigo[700],
              ),
              subtitle1: TextStyle(
                color: Colors.indigo[700],
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      builder: ExtendedNavigator.builder(
        navigatorKey: locator<NavigationService>().navigatorKey,
        router: NeuroRouter(),
        builder: (context, child) => Builder(
          builder: (ctx) => child,
        ),
      ),
    );
  }
}
