
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServis {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get users
  Stream<List<Map<String, dynamic>>> getUsers() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send messege
  

  //get messege


}