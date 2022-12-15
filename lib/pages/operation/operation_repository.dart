import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste/pages/operation/operation_model.dart';

class OperationRepository {
  late SharedPreferences preferences;

  OperationRepository() {
    //SharedPreferences.getInstance().then((value) => preferences);
  }

  Future<String> addOperationReturnBalance(
      {required OperationModel model}) async {
    try {
      preferences = await SharedPreferences.getInstance();
      String email = preferences.getString("lastLogged")!;
      String user = preferences.getString(email)!;
      final userMap = json.decode(user) as Map;

      // if (userMap.containsKey('cashHistory')) {
      //   final cashHistory = userMap['cashHistory'] as Map;
      //   if (cashHistory.containsKey(model.operation)) {
      //     userMap['cashHistory'][model.operation][model.date] = model;
      //   } else {
      //     userMap['cashHistory'][model.operation] = {};
      //     userMap['cashHistory'][model.operation][model.date] = model;
      //   }
      // } else {
      //   userMap['cashHistory'] = {};
      //   userMap['cashHistory'][model.operation] = {};
      //   userMap['cashHistory'][model.operation][model.date] = model;
      // }
      return userMap['cash'].toString();
    } catch (e) {
      return 'error';
    }
  }

  Future<void> setNewCashValue(String newCash) async {
    try {
      preferences = await SharedPreferences.getInstance();
      String email = preferences.getString("lastLogged")!;
      String user = preferences.getString(email)!;
      final userMap = json.decode(user) as Map;
      userMap['cash'] = newCash;
      preferences.setString(email, json.encode(userMap));
    } catch (e) {}
  }
}
