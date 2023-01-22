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

  Future<String> saveUser(SignUpModel usermodel) async {
    try {
      final credential = await _firebase.createUserWithEmailAndPassword(
        email: usermodel.email,
        password: usermodel.password,
      );
      await saveDataUser(usermodel, credential);

      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return 'error';
      }
    }
  }

  Future<bool> saveDataUser(
      SignUpModel usermodel, UserCredential credential) async {
    try {
      final collection = database.collection('users');
      collection.doc(credential.user!.uid.toString()).set({
        'name': usermodel.name,
        'email': usermodel.email,
        'cash': '0.00',
        'totalIncomes': '0.00',
        'totalExpenses': '0.00',
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
