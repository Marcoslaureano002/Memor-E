import 'package:flutter/material.dart';
import 'package:flutter_app/view/signin.dart';
import 'package:flutter_app/view/signup.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1F1F1F ),
        primarySwatch: Colors.teal,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUp(),
    );
  }
}


