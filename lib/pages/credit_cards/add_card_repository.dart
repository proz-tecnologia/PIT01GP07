import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'add_card_model.dart';

class AddCardRepository {
  final _firebase = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  Future<String> addCreditCard({required AddCardModel operation}) async {
    try {
      final userData =
      _database.collection('users').doc(_firebase.currentUser!.uid);
      userData
          .collection('card')
          .doc(operation.cardName)
          .set({
        'description': operation.description,
        'limit': operation.limit,
        'account': operation.account,
      });
      return 'success';
    } catch (e) {
      return 'error';
    }
  }
}