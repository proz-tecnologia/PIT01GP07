import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste/pages/pix/pix_model.dart';

class PixRepository {
  final _firebase = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  Future<List<PixModel>> getPix() async {
    final userData =
        _database.collection('users').doc(_firebase.currentUser!.uid);

    final userPix = await userData.collection('pix').get();

    final allData = List<PixModel>.from(
        userPix.docs.map((doc) => PixModel.fromJson(doc.data())));

    return allData;
  }

  Future<String> addPix({required PixModel pix}) async {
    try {
      final userData =
          _database.collection('users').doc(_firebase.currentUser!.uid);
      userData.collection('pix').doc().set(pix.toJson());
      return 'success';
    } catch (e) {
      return 'error';
    }
  }
}
