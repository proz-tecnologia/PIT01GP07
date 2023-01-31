import 'package:flutter/material.dart';
import 'package:teste/pages/pix/pix_model.dart';
import 'package:teste/pages/pix/pix_repository.dart';

import '../pix_states.dart';

class AddPixController {
  final PixRepository _pixRepository;

  ValueNotifier<List<String>> accounts = ValueNotifier([]);

  ValueNotifier<PixStates> state = ValueNotifier(PixInitialState());

  AddPixController([PixRepository? repository])
      : _pixRepository = repository ?? PixRepository();

  Future<String> createPix(PixModel pix) async {
    try {
      await _pixRepository.addPix(pix: pix);
      return 'Success';
    } catch (e) {
      return 'Error';
    }
  }

  Future<void> getAccounts() async {
    state.value = PixLoadingState();
    final accountsList = await _pixRepository.accountsList();
    if (accountsList != null) {
      for (var i = 0; i < accountsList.length; i++) {
        accounts.value.add(accountsList[i]['account']);
        state.value = PixSuccessState();
      }
    } else {
      state.value = PixErrorState();
    }
  }
}
