import 'package:flutter/cupertino.dart';

import 'metas_model.dart';
import 'metas_repository.dart';

class MetasController {
  List<MetasModel> metas = [];
  final MetasRepository _metasRepository;
  final state = ValueNotifier(MetasState.start);

  MetasController([MetasRepository? repository])
      : _metasRepository = repository ?? MetasRepository();

  Future start() async {
    state.value = MetasState.loading;
    try {
      metas = await _metasRepository.fetchMetas();
      state.value = MetasState.success;
    } catch (e) {
      state.value = MetasState.error;
    }
  }

  Future<void> createMeta(MetasModel meta) async {
    final result = await _metasRepository.createMeta(meta: meta);
  }
}

enum MetasState { start, loading, success, error }
