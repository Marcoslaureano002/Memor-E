import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/widgets/widget.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      authMethods.signUpWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((val){
        print("$val");
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
                        Text("Already have an account?", style: TextStyle(
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



