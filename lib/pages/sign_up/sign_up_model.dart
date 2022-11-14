import 'dart:convert';

class SignUpModel {
  String userName;
  String userEmail;
  String userPassword;

  SignUpModel({
    this.userName = '',
    this.userEmail = '',
    this.userPassword = '',
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userNname': userName});
    result.addAll({'userEmail': userEmail});
    result.addAll({'userPassword': userPassword});

    return result;
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      userName: map['userNname'] ?? '',
      userEmail: map['userEmail'] ?? '',
      userPassword: map['userPassword'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) =>
      SignUpModel.fromMap(json.decode(source));

  SignUpModel copyWith({
    String? userNname,
    String? userEmail,
    String? userPassword,
  }) {
    return SignUpModel(
      userName: userNname ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      userPassword: userPassword ?? this.userPassword,
    );
  }

  @override
  String toString() =>
      'SignUpModel(userNname: $userName, userEmail: $userEmail, userPassword: $userPassword)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpModel &&
        other.userName == userName &&
        other.userEmail == userEmail &&
        other.userPassword == userPassword;
  }

  @override
  int get hashCode =>
      userName.hashCode ^ userEmail.hashCode ^ userPassword.hashCode;
}
