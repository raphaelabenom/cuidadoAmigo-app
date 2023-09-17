import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDLkjAn_cGz5Q5V74S6n-ZcVaxmBcxSVg4",
            authDomain: "cuidado-amigo.firebaseapp.com",
            projectId: "cuidado-amigo",
            storageBucket: "cuidado-amigo.appspot.com",
            messagingSenderId: "830578133656",
            appId: "1:830578133656:web:dd0ba11f73e139ba2b1eed"));
  } else {
    await Firebase.initializeApp();
  }
}
