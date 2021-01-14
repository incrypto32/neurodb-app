import 'package:firebase_core/firebase_core.dart';
import 'package:neurodb/logic/services/firebase/auth_service.dart';
import 'package:neurodb/logic/services/firebase/firestore.dart';

class FirebaseService {
  AuthService authService;
  FirestoreService firestoreService;

  FirebaseService() {
    initialize();
  }

  Future<FirebaseApp> initialize() async {
    var app = await Firebase.initializeApp();
    authService = AuthService();
    firestoreService = FirestoreService();
    return app;
  }
}
