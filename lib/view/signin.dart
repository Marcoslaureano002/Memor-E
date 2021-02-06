
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/widget.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context) ,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 75,
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24) ,
                child: Column (
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    TextField(
                      style: simpleTextFieldStyle(),
                      decoration: textFieldInputDecoration("Email"),
                    ),

                    TextField(
                      style: simpleTextFieldStyle(),
                      decoration: textFieldInputDecoration("Password"),
                    ),

                    SizedBox(height: 8,),

                    Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: Text("Forgot Password", style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              decoration: TextDecoration.underline
                          ),)
                      ),
                    ),

                    SizedBox(height: 16,),

                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Sign in", style: TextStyle(
                          color: Colors.black,
                          fontSize: 17
                      ),),
                    ),

                    SizedBox(height: 16,),

                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Sign in with Google", style: TextStyle(
                          color: Colors.black,
                          fontSize: 17
                      ),),
                    ),

                    SizedBox(height: 16,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ", style: mediumTextFieldStyle(),),
                        Text("Register now",style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            decoration: TextDecoration.underline
                        ),)
                      ],
                    ),

                    SizedBox(height: 100,),
                  ],
                )
            ),
          ),
        )
    );
  }
}
    