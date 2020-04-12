import 'package:employee_activity_tracker/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'employeeTile.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {

    final employees = Provider.of<List<Employee>>(context) ?? [];
    
    return ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        return EmployeeTile(emp: employees[index]);
      },
    );
  }
}