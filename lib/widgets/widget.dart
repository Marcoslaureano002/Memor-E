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

TextStyle whiteTextFieldStyle() {
  return TextStyle(
      color: Colors.white,
      fontSize: 17
  );
}
InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
      hintText: hintText ,
      hintStyle: TextStyle(
          color: Colors.white54,
          fontSize: 15
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white54)

      )
  );
}

///r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")    this is used for email validation