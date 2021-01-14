// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/views/home/home_view.dart';
import '../../ui/views/inpatients/inpatients_view.dart';
import '../../ui/views/search/search_view.dart';
import '../../ui/views/startup/startup_view.dart';

class Routes {
  static const String homeView = '/home-view';
  static const String searchView = '/search-view';
  static const String startUpView = '/';
  static const String inPatientsView = '/in-patients-view';
  static const all = <String>{
    homeView,
    searchView,
    startUpView,
    inPatientsView,
  };
}

class NeuroRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.searchView, page: SearchView),
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.inPatientsView, page: InPatientsView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    SearchView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchView(),
        settings: data,
      );
    },
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartUpView(),
        settings: data,
      );
    },
    InPatientsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => InPatientsView(),
        settings: data,
      );
    },
  };
}
