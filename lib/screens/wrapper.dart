import 'package:employee_activity_tracker/models/user.dart';
import 'package:employee_activity_tracker/screens/authenticate/authenticate.dart';
import 'package:employee_activity_tracker/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // Return either home or authenticate
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}