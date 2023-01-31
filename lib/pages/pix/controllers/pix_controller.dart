import 'package:flutter/cupertino.dart';
import 'package:teste/pages/pix/pix_model.dart';

import '../pix_repository.dart';

class PixController {
  List<PixModel> pix = [];
  final PixRepository _pixRepository;
  final state = ValueNotifier(PixState.start);

  PixController([PixRepository? repository])
      : _pixRepository = repository ?? PixRepository();

  Future start() async {
    state.value = PixState.loading;
    try {
      pix = await _pixRepository.getPix();
      state.value = PixState.success;
    } catch (e) {
      state.value = PixState.error;
    }
  }

  Future<String> deletePix(String code) async {
    String deleted = await _pixRepository.deletePix(code);
    return deleted;
  }
}

enum PixState { start, loading, success, error }
