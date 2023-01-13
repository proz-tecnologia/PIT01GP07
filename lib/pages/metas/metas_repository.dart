import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste/pages/metas/metas_model.dart';

class MetasRepository {
  final _firebase = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  Future<List<MetasModel>> getMetas() async {
    final userData =
        _database.collection('users').doc(_firebase.currentUser!.uid);

    final userMetas = userData.collection('metas');
    QuerySnapshot querySnapshot = await userMetas.get();

    final allData = List<MetasModel>.from(querySnapshot.docs
        .map((doc) => MetasModel.fromJson(doc.data() as Map<String, dynamic>)));
    return allData;
  }

  Future<String> addMeta({required MetasModel meta}) async {
    try {
      final userData =
          _database.collection('users').doc(_firebase.currentUser!.uid);
      userData.collection('metas').doc().set(meta.toJson());
      return 'success';
    } catch (e) {
      return 'error';
    }
  }
}
