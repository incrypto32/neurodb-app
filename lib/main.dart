import 'package:flutter/material.dart';
import 'package:neurodb/arch/app.dart';
import 'package:neurodb/arch/dependency_injection/locator.dart';

void main() {
  setupLocator();
  runApp(NeuroDB());
}
