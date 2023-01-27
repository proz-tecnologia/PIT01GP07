import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExpensesIncomesCardRepository {
  final _firebase = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getUserData() async {
    final userData = await _database
        .collection('users')
        .where('email', isEqualTo: _firebase.currentUser!.email)
        .get();
    return userData;
  }

  Future<Map?> userData() async {
    final userDdata = await getUserData();
    try {
      final name = userDdata.docs.first.data();
      return name;
    } catch (e) {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> firstOperations(String operation) async {
    try {
      List<Map<String, dynamic>> expenseList = [];
      final userData = await _database
          .collection('users')
          .doc(_firebase.currentUser!.uid)
          .collection(operation)
          .get();
      int count = 0;
      for (var element in userData.docs.reversed) {
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
