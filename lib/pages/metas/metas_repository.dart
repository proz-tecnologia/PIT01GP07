import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste/pages/metas/metas_model.dart';

class MetasRepository {
  final _firebase = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getUserData() async {
    final userData = await _database
        .collection('users')
        .where('email', isEqualTo: _firebase.currentUser!.email)
        .get();
    return userData;
  }

  Future<String> createMeta({required MetasModel meta}) async {
    try {
      final userData =
          _database.collection('users').doc(_firebase.currentUser!.uid);
      userData
          .collection(metas.meta)
          .doc(meta.conclusao.millisecond.toString())
          .set({
        ''
            'done': meta.realizado,
        'title': meta.titulo,
        'value': meta.valor
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
}
