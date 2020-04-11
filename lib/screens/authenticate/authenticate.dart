import 'package:employee_activity_tracker/screens/authenticate/register.dart';
import 'package:employee_activity_tracker/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleAuth(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleAuth: toggleAuth);
    }else{
      return Register(toggleAuth: toggleAuth);
    }
  }
}