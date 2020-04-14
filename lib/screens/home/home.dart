import 'package:employee_activity_tracker/models/employee.dart';
import 'package:employee_activity_tracker/screens/home/employeeList.dart';
import 'package:employee_activity_tracker/screens/home/settingsForm.dart';
import 'package:employee_activity_tracker/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:employee_activity_tracker/services/db.dart';
import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Employee>>.value(
      value: DatabaseService().data,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Team'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await _auth.signout();
              },
              label: Text('logout'),
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: () {_showSettingsPanel();},
            ),
          ],
        ),
        body: EmployeeList()
      ),
    );
  }
}