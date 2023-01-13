import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'account_model.dart';

class AccountRepository {
  final _firebase = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  Future<String> saveAccount({required AccountModel accountModel}) async {
    try {
      final userData =
          _database.collection('users').doc(_firebase.currentUser!.uid);
      userData.collection('accounts').doc(accountModel.account).set({
        'value': accountModel.value,
        'description': accountModel.description,
        'type': accountModel.type
      });
      return 'success';
    } catch (e) {
      return 'error';
    }
  }
}
