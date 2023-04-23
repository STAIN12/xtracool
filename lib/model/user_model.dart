import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String emailAddress;
  final String uid;
  final String displayName;
  final String photoURL;
  final String accountType;

  UserModel({
    required this.uid,
    required this.displayName,
    required this.photoURL,
    required this.emailAddress,
    required this.accountType,
  });

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "emailAddress": emailAddress,
        "uid": uid,
        "photoURL": photoURL,
        "accountType":accountType
      };

  static UserModel fromSnap(DocumentSnapshot snapshot) {
    if (snapshot.data() == null) {
      return UserModel(
          uid: "", displayName: "", photoURL: "", emailAddress: "",accountType: "");
    } else {
      var snap = snapshot.data() as Map<String, dynamic>;

      return UserModel(
        emailAddress: snap["emailAddress"],
        uid: snap["uid"],
        displayName: snap["displayName"],
        photoURL: snap["photoURL"],
        accountType: snap["accountType"]
      );
    }
  }
}
