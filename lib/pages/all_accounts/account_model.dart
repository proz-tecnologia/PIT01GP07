import 'dart:convert';

class AccountModel {
  String value;
  String account;
  String description;
  String type;
  AccountModel({
    this.value = '',
    this.account = '',
    this.description = '',
    this.type = '',
  });

  AccountModel copyWith({
    String? value,
    String? account,
    String? description,
    String? type,
  }) {
    return AccountModel(
      value: value ?? this.value,
      account: account ?? this.account,
      description: description ?? this.description,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'value': value});
    result.addAll({'account': account});
    result.addAll({'description': description});
    result.addAll({'type': type});

    return result;
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      value: map['value'] ?? '',
      account: map['account'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AccountModel(value: $value, account: $account, description: $description, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountModel &&
        other.value == value &&
        other.account == account &&
        other.description == description &&
        other.type == type;
  }

  @override
  int get hashCode {
    return value.hashCode ^
        account.hashCode ^
        description.hashCode ^
        type.hashCode;
  }
}
