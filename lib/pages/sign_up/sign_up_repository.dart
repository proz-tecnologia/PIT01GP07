import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../sign_up/sign_up_model.dart';

class SignUpRepository {
  final FirebaseAuth _firebase;

  final FirebaseFirestore database;

  SignUpRepository(
    this._firebase,
    this.database,
  );

  Future<String> saveUser(SignUpModel user) async {
    final collection = database.collection('users');

    try {
      final credential = await _firebase.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      collection.doc(credential.user!.uid.toString()).set({
        'name': user.name,
        'email': user.email,
        'cash': '0.00',
        'totalIncomes': '0.00',
        'totalExpenses': '0.00',
      });
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return 'error';
      }
    }
  }
}
