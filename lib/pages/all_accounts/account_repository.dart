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
        'account': accountModel.account,
        'cashvalue': accountModel.value,
        'description': accountModel.description,
        'type': accountModel.type
      });
      return 'success';
    } catch (e) {
      return 'error';
    }
  }

  Future<List<Map<String, dynamic>>?> accountsList() async {
    try {
      List<Map<String, dynamic>> accountsList = [];
      final userData = await _database
          .collection('users')
          .doc(_firebase.currentUser!.uid)
          .collection('accounts')
          .orderBy('account')
          .get();
      for (var element in userData.docs.reversed) {
        accountsList.add(element.data());
      }
      return accountsList;
    } catch (e) {
      return null;
    }
  }
}
