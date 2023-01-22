import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileBarRepository {
  final FirebaseAuth _firebase;

  final FirebaseFirestore database;

  ProfileBarRepository(this._firebase, this.database);

  Future<QuerySnapshot<Map<String, dynamic>>> getUserData() async {
    final userData = await database
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

  Future<String> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return 'Success';
    } catch (e) {
      return 'error';
    }
  }
}
