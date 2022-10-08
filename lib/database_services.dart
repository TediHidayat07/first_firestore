import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/user.dart';

class DatabaseServices {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot> getListUsers() {
    return collection.snapshots();
  }

  Future<DocumentReference> addUser(User user) {
    return collection.add(user.toMap());
  }

  void deleteUser(User user) async {
    await collection.doc(user.id).delete();
  }
}
