import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/widget.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUp> {

  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
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
                      controller: userNameTextEditingController,
                      style: TextStyle(
                          color: Colors.white
                      ) ,
                      decoration: InputDecoration(
                          hintText: "Username" ,
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          )

                      ),

                    ),
                    TextField(
                        controller: emailTextEditingController,
                      style: TextStyle(
                          color: Colors.white
                      ) ,
                      decoration: InputDecoration(
                          hintText: "Email" ,
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          )

                      ),

                    ),
                    TextField(
                        controller: passwordTextEditingController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          )
                      ),
                    ),
                    SizedBox(height: 24,),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
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
                    SizedBox(height: 16,),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
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


