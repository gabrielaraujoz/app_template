import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirebaseInitializer {
  // static Future<FirebaseApp> initialize() => Firebase.initializeApp();
  static Future<void> initialize() async {
    //TODO: replace this once firebase is configured
    await Firebase.initializeApp();
  }
}
