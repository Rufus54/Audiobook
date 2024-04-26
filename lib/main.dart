
import 'package:audiobook/book_home.dart';

import 'package:audiobook/login.dart';
import 'package:audiobook/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:FirebaseOptions(
      apiKey: "AIzaSyBxoCadTZoFYrniOJKNXV9FSLyVLo8nIoE",
      authDomain: "login-44aef.firebaseapp.com",
      projectId: "login-44aef",
      storageBucket: "login-44aef.appspot.com",
      messagingSenderId: "307404888780",
      appId: "1:307404888780:web:ab56c13cce1459302e0069"


  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audiobook App',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "SourceSansPro"),
      home: signup(),
      debugShowCheckedModeBanner: false,
      routes: {



        '/home': (context) => login(),
        '/submit': (context) => BooksHome(),
      },
    );
  }
}
