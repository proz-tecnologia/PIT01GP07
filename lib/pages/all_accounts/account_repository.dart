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

  Future<List<AccountModel>> getAccounts() async {
    final userData = _database.collection('users').doc(_firebase.currentUser!.uid);
    final userAccounts = await userData.collection('metas').get();

    final allData = List<AccountModel>.from(userAccounts.docs.map((doc) => AccountModel.fromMap(doc.data())));

    print(allData);
    return allData;
  }
}
