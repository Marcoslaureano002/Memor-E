import 'package:flutter/material.dart';
import 'package:flutter_app/helper/helperfunction.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/services/database.dart';
import 'package:flutter_app/view/chatroomscreen.dart';
import 'package:flutter_app/widgets/widget.dart';


class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;


  signMeUp() async {

    if (formKey.currentState.validate()) {
      setState(() {

        isLoading = true;
      });

      await authMethods.signUpWithEmailAndPassword(emailTextEditingController.text,
          passwordTextEditingController.text).then((result){
        if(result != null){

          Map<String, String> userInfoMap = {
            "name" : userNameTextEditingController.text,
            "email" : emailTextEditingController.text,
          };

          databaseMethods.addUserInfo(userInfoMap);

      HelperFunctions.saveUserLoggedInSharedPreference(true);
      HelperFunctions.saveUserEmailSharedPreference(emailTextEditingController.text);
      HelperFunctions.saveUserEmailSharedPreference(userNameTextEditingController.text);

      Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => ChatRoom()
          ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),
        body: isLoading ? Container(
            child: Center(child: CircularProgressIndicator())
        ) : SingleChildScrollView(
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height - 75,
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                          children: [
                            TextFormField(
                              validator: (val) {
                                return val.isEmpty || val.length < 2
                                    ? "Username invalid try again."
                                    : null;
                              },
                              controller: userNameTextEditingController,
                              style: simpleTextFieldStyle(),
                              decoration: textFieldInputDecoration("Username"),
                            ),

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
                          ]
                      ),
                    ),

                    SizedBox(height: 24,),

                    GestureDetector(
                      onTap: () {
                        signMeUp();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text("Sign Up", style: TextStyle(
                            color: Colors.black,
                            fontSize: 17
                        ),),
                      ),
                    ),

                    SizedBox(height: 16,),

                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Sign Up with Google", style: TextStyle(
                          color: Colors.black,
                          fontSize: 17
                      ),),
                    ),

                    SizedBox(height: 16,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            widget.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text("Already have an account?", style: TextStyle(
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



