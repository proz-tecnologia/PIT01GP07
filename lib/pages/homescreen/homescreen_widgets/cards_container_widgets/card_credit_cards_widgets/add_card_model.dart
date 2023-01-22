import 'dart:convert';

class AddCardModel {
  String cardName;
  String description;
  String limit;
  String account;
  AddCardModel({
    this.cardName = '',
    this.description = '',
    this.limit = '',
    this.account = '',
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'cardName': cardName});
    result.addAll({'description': description});
    result.addAll({'limit': limit});
    result.addAll({'account': account});

    return result;
  }

  factory AddCardModel.fromMap(Map<String, dynamic> map) {
    return AddCardModel(
      description: map['description'] ?? '',
      limit: map['email'] ?? '',
      account: map['account'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddCardModel.fromJson(String source) =>
      AddCardModel.fromMap(json.decode(source));
}
