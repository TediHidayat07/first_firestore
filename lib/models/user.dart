import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? id;
  String name;
  String email;
  String phone;

  User({this.id, required this.name, required this.email, required this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    final newUser = User.fromJson(snapshot.data() as Map<String, dynamic>);
    newUser.id = snapshot.reference.id;
    return newUser;
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
    };
  }
}
