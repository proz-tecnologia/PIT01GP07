class PixModel {
  String? type;
  String? code;
  String? account;

  PixModel({
    this.type,
    this.code,
    this.account,
  });

  PixModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    code = json['code'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['code'] = code;
    data['account'] = account;

    return data;
  }
}
