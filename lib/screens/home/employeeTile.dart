import 'package:flutter/material.dart';
import 'package:employee_activity_tracker/models/employee.dart';

class EmployeeTile extends StatelessWidget {

  final Employee emp;

  EmployeeTile({this.emp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.yellow[emp.priority],
            backgroundImage: AssetImage('assets/border.png'),
          ),
          title: Text(emp.name),
          subtitle: Text(emp.currentTask),
        ),
      ),
    );
  }
}