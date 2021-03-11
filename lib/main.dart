import 'package:flutter/material.dart';
import 'package:flutter_app/helper/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/helper/helperfunction.dart';
import 'package:flutter_app/view/chatroomscreen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memor-E',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1F1F1F ),
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        home: userIsLoggedIn != null ?  userIsLoggedIn ? ChatRoom() : Authenticate()
            : Container(
         child: Center(
          child: Authenticate(),
        ),
      ),
    );
  }
}
