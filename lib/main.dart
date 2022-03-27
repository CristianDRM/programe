import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBdb9IZvaJC2ZAZEYhoFdoIC9RfQQ1_R',
      authDomain: 'programe-8da8b.firebaseapp.com',
      databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
      projectId: 'programe-8da8b',
      storageBucket: 'programe-8da8b.appspot.com',
      messagingSenderId: '647741719679',
      appId: '1:647741719679:web:677c90020f1e8d762b6b4a',
      measurementId: 'G-WFQ7WSJNZS',
    ),
  );
  runApp(const App());
}
