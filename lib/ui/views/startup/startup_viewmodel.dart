import 'package:neurodb/arch/architecture/view_model.dart';
import 'package:neurodb/logic/services/firebase/firesbase.dart';

class StartUpViewModel extends ViewModel {
  StartUpViewModel(this.firebaseService) {
    _init();
  }

  final FirebaseService firebaseService;

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  _setLoggedIn(bool val) {
    _isLoggedIn = val;
    notifyListeners();
  }

  void _init() async {
    setBusy(true);
    print("Initializing Startup View");
    try {
      await firebaseService.initialize();
      firebaseService.authService.onAuthStateChanged((user) {
        _setLoggedIn(user != null);
      });
    } catch (e) {
      print(e);
    }
    setBusy(false);
  }
}
