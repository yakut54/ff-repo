import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDdd6pH31AD3zTBFMP23IS5ZFLyxxL6um0",
            authDomain: "marta-ng-womens-council.firebaseapp.com",
            projectId: "marta-ng-womens-council",
            storageBucket: "marta-ng-womens-council.appspot.com",
            messagingSenderId: "1091831851490",
            appId: "1:1091831851490:web:dfd9b814bed7cf182b71bb",
            measurementId: "G-338HZSQRR5"));
  } else {
    await Firebase.initializeApp();
  }
}
