import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste/pages/operation/operation_model.dart';

class OperationRepository {
  final _firebase = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  Future<String> addOperation({required OperationModel operation}) async {
    try {
      final userData =
          _database.collection('users').doc(_firebase.currentUser!.uid);
      userData.collection(operation.operation).doc().set({
        'date': operation.date,
        'cashvalue': operation.operationValue,
        'account': operation.account,
        'categorie': operation.categorie,
        'description': operation.description,
        'receipt': operation.receipt
      });
      return 'success';
    } catch (e) {
      return 'error';
    }
  }

  Future<String> setNewCashIncomesExpenses({
    required String newCash,
    required String totalOperations,
    required String operation,
  }) async {
    try {
      final userData =
          _database.collection('users').doc(_firebase.currentUser!.uid);
      userData.set({
        'cash': newCash,
        operation: totalOperations,
      }, SetOptions(merge: true));
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
          .get();
      for (var element in userData.docs) {
        accountsList.add(element.data());
      }
      return accountsList;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getAccountCashValue(String account) async {
    try {
      final cashValue = await _database
          .collection('users')
          .doc(_firebase.currentUser!.uid)
          .collection('accounts')
          .doc(account)
          .get();
      return cashValue.data();
    } catch (e) {
      return null;
    }
  }

  Future<String> setNewAccountCashValue(String account, String newCash) async {
    try {
      await _database
          .collection('users')
          .doc(_firebase.currentUser!.uid)
          .collection('accounts')
          .doc(account)
          .update({'cashvalue': newCash});
      return 'Success';
    } catch (e) {
      return 'Error';
    }
  }
}
