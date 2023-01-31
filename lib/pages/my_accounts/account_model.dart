import 'dart:convert';

class AccountModel {
  String value;
  String account;
  String type;
  String image;
  AccountModel({
    this.value = '',
    this.account = '',
    this.type = '',
    this.image = '',
  });

  AccountModel copyWith({
    String? value,
    String? account,
    String? type,
    String? image,
  }) {
    return AccountModel(
      value: value ?? this.value,
      account: account ?? this.account,
      type: type ?? this.type,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'value': value});
    result.addAll({'account': account});
    result.addAll({'type': type});
    result.addAll({'image': image});

    return result;
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      value: map['value'] ?? '',
      account: map['account'] ?? '',
      type: map['type'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AccountModel(value: $value, account: $account, type: $type, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountModel &&
        other.value == value &&
        other.account == account &&
        other.type == type &&
        other.image == image;
  }

  @override
  int get hashCode {
    return value.hashCode ^ account.hashCode ^ type.hashCode ^ image.hashCode;
  }
}
