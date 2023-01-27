import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountCardRepository {
  final _firebase = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>?> firstOperations() async {
    try {
      List<Map<String, dynamic>> expenseList = [];
      final userData = await _database
          .collection('users')
          .doc(_firebase.currentUser!.uid)
          .collection('accounts')
          .orderBy('account')
          .get();
      int count = 0;
      for (var element in userData.docs) {
        expenseList.add(element.data());
        count++;
        if (count == 3) {
          break;
        }
      }
      return expenseList;
    } catch (e) {
      return null;
    }
  }
}
