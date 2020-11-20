import 'package:neurodb/arch/architecture/view_model.dart';

class LoginViewModel extends ViewModel {
  String _email;
  String _password;

  String get email => _email;
  String get password => _password;

  void setEmail(val) {
    _email = val;
  }

  void setPassword(val) {
    _password = val;
  }

  void submit() {
    print("$email : $password");
  }
}
