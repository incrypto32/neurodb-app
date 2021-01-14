import 'package:get_it/get_it.dart';
import 'package:neurodb/app/utilities/flushbar_service.dart';
import 'package:neurodb/logic/services/firebase/firesbase.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => FirebaseService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => Utils());
}
