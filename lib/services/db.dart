import 'package:cloud_firestore/cloud_firestore.dart';

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
}