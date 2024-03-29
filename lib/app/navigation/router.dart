import 'package:auto_route/auto_route_annotations.dart';
import 'package:neurodb/ui/views/home/home_view.dart';
import 'package:neurodb/ui/views/inpatients/inpatients_view.dart';
import 'package:neurodb/ui/views/search/search_view.dart';
import 'package:neurodb/ui/views/startup/startup_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: HomeView),
  MaterialRoute(page: SearchView),
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: InPatientsView)
])
class $NeuroRouter {}
