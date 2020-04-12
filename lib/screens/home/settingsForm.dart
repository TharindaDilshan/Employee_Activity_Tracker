import 'package:employee_activity_tracker/models/user.dart';
import 'package:employee_activity_tracker/services/db.dart';
import 'package:employee_activity_tracker/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();

  String _currentName;
  int _currentPriority;
  String _currentCurrentTask;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update Information',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blue,
                  ),
                ),
                TextFormField(
                  initialValue: userData.name,
                  validator: (val) => val.isEmpty ? 'Please enter a Name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Current Task(s)',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blue,
                  ),
                ),
                TextFormField(
                  initialValue: userData.currentTask,
                  validator: (val) => val.isEmpty ? 'Please enter a Task or None otherwise' : null,
                  onChanged: (val) => setState(() => _currentCurrentTask = val),
                ),
                SizedBox(height: 20.0),
                //Slider
                Text(
                  'Priority',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blue,
                  ),
                ),
                Slider(
                  min: 100,
                  max: 900,
                  activeColor: Colors.yellow[_currentPriority ?? userData.priority],
                  inactiveColor: Colors.yellow[_currentPriority ?? userData.priority],
                  divisions: 4,
                  onChanged: (val) => setState(() => _currentPriority = val.round()),
                  value: (_currentPriority ?? 100).toDouble(),
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white)
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentCurrentTask ?? userData.currentTask,
                        _currentName ?? userData.name,
                        _currentPriority ?? userData.priority
                      );
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          );
        }else{
          return Loading();
        }
        
      }
    );
  }
}