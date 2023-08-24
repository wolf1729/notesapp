import 'package:flutter/material.dart';
import 'package:notesapp/views/loginview.dart';
import 'package:notesapp/views/addnotespage.dart';
import 'views/notespage.dart';
import 'package:notesapp/views/registerview.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notesapp/views/seenotepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: loginview(),
    routes: {
      '/login/': (context) => loginview(),
      '/register/': (context) =>  registrationview(),
      '/notespage/': (context) =>  notespage(),
      '/addnotespage/':(context) =>  addnotespage(),
    },
  ));
}

