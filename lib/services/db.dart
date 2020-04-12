import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_activity_tracker/models/employee.dart';
import 'package:employee_activity_tracker/models/user.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  // Collection Reference
  final CollectionReference employeeCollection = Firestore.instance.collection('employees');

  Future updateUserData(String currentTask, String name, int priority) async{
    return await employeeCollection.document(uid).setData({
      'currentTask': currentTask,
      'name': name,
      'priority': priority,
    });
  }

  // Get employee list from snapshot
  List<Employee> _employeeListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((item){
      return Employee(
        name: item.data['name'] ?? '',
        currentTask: item.data['currentTask'] ?? 'None',
        priority: item.data['priority'] ?? 0
      );
    }).toList();
  }

  // Get user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid:uid,
      name: snapshot.data['name'],
      currentTask: snapshot.data['currentTask'],
      priority: snapshot.data['priority']
    );
  }

  Stream<List<Employee>> get data{
    return employeeCollection.snapshots().map(_employeeListFromSnapshot);
  }

  Stream<UserData> get userData{
    return employeeCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}