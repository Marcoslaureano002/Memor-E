import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context){
  return AppBar(
   title: Image.asset("assets/images/logo.png", height: 50 ,) ,
  );

}
TextStyle simpleTextFieldStyle() {
  return TextStyle(
      color: Colors.white,
          fontSize: 15
  );
}

TextStyle mediumTextFieldStyle() {
  return TextStyle(
      color: Colors.grey,
      fontSize: 17
  );
}
