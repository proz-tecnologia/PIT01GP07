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
      userData
          .collection(operation.operation)
          .doc(operation.date.millisecond.toString())
          .set({
        'cashvalue': operation.operationValue,
        'paid/received': operation.paid,
        'account': operation.account,
        'categorie': operation.categorie,
        'receipt': operation.receipt
      });
      return 'success';
    } catch (e) {
      return 'error';
    }
  }

  Future<String> setNewCashValue(String newCash) async {
    try {
      final userData =
          _database.collection('users').doc(_firebase.currentUser!.uid);
      userData.set({'cash': newCash}, SetOptions(merge: true));
      return 'success';
    } catch (e) {
      return 'error';
    }
  }
}
//Shared Prefrences Stack
// late SharedPreferences preferences;
 //SharedPreferences.getInstance().then((value) => preferences);
  // }

  // Future<String> addOperationReturnBalance(
  //     {required OperationModel model}) async {
  //   try {
  //     preferences = await SharedPreferences.getInstance();
  //     String email = preferences.getString("lastLogged")!;
  //     String user = preferences.getString(email)!;
  //     final userMap = json.decode(user) as Map;

  //     // if (userMap.containsKey('cashHistory')) {
  //     //   final cashHistory = userMap['cashHistory'] as Map;
  //     //   if (cashHistory.containsKey(model.operation)) {
  //     //     userMap['cashHistory'][model.operation][model.date] = model;
  //     //   } else {
  //     //     userMap['cashHistory'][model.operation] = {};
  //     //     userMap['cashHistory'][model.operation][model.date] = model;
  //     //   }
  //     // } else {
  //     //   userMap['cashHistory'] = {};
  //     //   userMap['cashHistory'][model.operation] = {};
  //     //   userMap['cashHistory'][model.operation][model.date] = model;
  //     // }
  //     return userMap['cash'].toString();
  //   } catch (e) {
  //     return 'error';
  //   }
  // }

  // Future<void> setNewCashValue(String newCash) async {
  //   try {
  //     preferences = await SharedPreferences.getInstance();
  //     String email = preferences.getString("lastLogged")!;
  //     String user = preferences.getString(email)!;
  //     final userMap = json.decode(user) as Map;
  //     userMap['cash'] = newCash;
  //     preferences.setString(email, json.encode(userMap));
  //   } catch (e) {}
  // }