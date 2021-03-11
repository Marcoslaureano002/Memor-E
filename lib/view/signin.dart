import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/helper/helperfunction.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/services/database.dart';
import 'package:flutter_app/view/chatroomscreen.dart';
import 'package:flutter_app/view/forgetpassword.dart';
import 'package:flutter_app/widgets/widget.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn(this.toggleView);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  bool isLoading = false;
  QuerySnapshot snapshotUserInfo;

  signIn() {
    if (formKey.currentState.validate()) {
      HelperFunctions.saveUserEmailSharedPreference(
          emailTextEditingController.text);

      setState(() {
        isLoading = true;
      });

      databaseMethods.getUserInfo(emailTextEditingController.text)
          .then((val){
        snapshotUserInfo = val;
        HelperFunctions
            .saveUserNameSharedPreference(snapshotUserInfo.docs[0].data()["name"]);
      });

      authMethods
          .signInWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((val) {
        if (val != null) {

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        }
        });
      }
  }

  //   if (formKey.currentState.validate()) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //
  //     await authService
  //         .signInWithEmailAndPassword(
  //         emailEditingController.text, passwordEditingController.text)
  //         .then((result) async {
  //       if (result != null)  {
  //         QuerySnapshot userInfoSnapshot =
  //         await DatabaseMethods().getUserInfo(emailEditingController.text);
  //
  //         HelperFunctions.saveUserLoggedInSharedPreference(true);
  //         HelperFunctions
  //             .saveUserNameSharedPreference(userInfoSnapshot.docs[0].data()["userName"]);
  //         HelperFunctions
  //             .saveUserEmailSharedPreference(userInfoSnapshot.docs[0].data()["userEmail"]);
  //
  //         Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (context) => ChatRoom()));
  //       } else {
  //         setState(() {
  //           isLoading = false;
  //           //show snackbar
  //         });
  //       }
  //     });
  //   }
  // }


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
                    Form(
                      key: formKey,
                      child: Column(children: [
                        TextFormField(
                          validator: (val) {
                            return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val)
                                ? null
                                : "Please provide a valid email address";
                          },
                          controller: emailTextEditingController,
                          style: simpleTextFieldStyle(),
                          decoration: textFieldInputDecoration("Email"),
                        ),

                        TextFormField(
                          obscureText: true,
                          validator: (val) {
                            return val.length > 6
                                ? null
                                : "Password must be larger than 6 characters";
                          },
                          controller: passwordTextEditingController,
                          style: simpleTextFieldStyle(),
                          decoration: textFieldInputDecoration("Password"),
                        ),
                      ],),
                    ),

                    SizedBox(height: 8,),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                      },
                      child: Container(
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
                    ),

                    SizedBox(height: 16,),

                    GestureDetector(
                      onTap: (){
                        signIn();
                      },
                      child: Container(
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
                        GestureDetector(
                          onTap: (){
                            widget.toggleView();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text("Register now",style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                decoration: TextDecoration.underline
                            ),),
                          ),
                        )
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
    