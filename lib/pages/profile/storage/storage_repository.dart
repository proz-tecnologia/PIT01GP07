import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:teste/pages/profile/storage/base_storage_repository.dart';
import 'dart:io';

class StorageRepository extends BaseStorageRepository {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadImage(XFile image) async {
    try {
      await storage.ref('user_1/${image.path}').putFile(
            File(image.path),
          );
    } catch (_) {}
  }
}
