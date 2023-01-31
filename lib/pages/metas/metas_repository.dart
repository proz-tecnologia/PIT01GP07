import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste/pages/metas/metas_model.dart';

class MetasRepository {
  final _firebase = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  Future<List<MetasModel>> getMetas() async {
    final userData =
        _database.collection('users').doc(_firebase.currentUser!.uid);

    final userMetas = await userData.collection('metas').get();

    final allData = List<MetasModel>.from(
        userMetas.docs.map((doc) => MetasModel.fromJson(doc.data())));

    return allData;
  }

  Future<String> addMeta({required MetasModel meta}) async {
    try {
      final userData =
          _database.collection('users').doc(_firebase.currentUser!.uid);
      userData.collection('metas').doc(meta.titulo).set(meta.toJson());
      return 'success';
    } catch (e) {
      return 'error';
    }
  }

  Future<String> deleteMeta(String titutlo) async {
    try {
      final userData = await _database
          .collection('users')
          .doc(_firebase.currentUser!.uid)
          .collection('metas')
          .doc(titutlo)
          .get();
      await userData.reference.delete();
      return 'Success';
    } catch (e) {
      return 'Error';
    }
  }
}
