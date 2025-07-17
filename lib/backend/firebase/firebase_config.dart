import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDUVXS6diNQOuRmHmTsqaZUWqYWVAF1CQo",
            authDomain: "smartsavings-3edab.firebaseapp.com",
            projectId: "smartsavings-3edab",
            storageBucket: "smartsavings-3edab.firebasestorage.app",
            messagingSenderId: "886762441686",
            appId: "1:886762441686:web:298ce2de9f049b78983277"));
  } else {
    await Firebase.initializeApp();
  }
}
