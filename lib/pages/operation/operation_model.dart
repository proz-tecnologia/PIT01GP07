import 'dart:convert';

class OperationModel {
  String operationValue;
  String operation;
  DateTime date;
  String account;
  String categorie;
  String description;

  OperationModel({
    this.operationValue = '',
    this.operation = '',
    required this.date,
    this.account = '',
    this.categorie = '',
    this.description = '',
  });

  OperationModel copyWith({
    String? operationValue,
    String? operation,
    DateTime? date,
    String? account,
    String? categorie,
    String? description,
    String? receipt,
  }) {
    return OperationModel(
      operationValue: operationValue ?? this.operationValue,
      operation: operation ?? this.operation,
      date: date ?? this.date,
      account: account ?? this.account,
      categorie: categorie ?? this.categorie,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'operationValue': operationValue});
    result.addAll({'operation': operation});
    result.addAll({'date': date.millisecondsSinceEpoch});

    result.addAll({'account': account});
    result.addAll({'categorie': categorie});
    result.addAll({'description': description});

    return result;
  }

  factory OperationModel.fromMap(Map<String, dynamic> map) {
    return OperationModel(
      operationValue: map['operationValue'] ?? '',
      operation: map['operation'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      account: map['account'] ?? '',
      categorie: map['categorie'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OperationModel.fromJson(String source) =>
      OperationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OperationModel(operationValue: $operationValue, operation: $operation, date: $date, account: $account, categorie: $categorie, description: $description,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OperationModel &&
        other.operationValue == operationValue &&
        other.operation == operation &&
        other.date == date &&
        other.account == account &&
        other.categorie == categorie &&
        other.description == description;
  }

  @override
  int get hashCode {
    return operationValue.hashCode ^
        operation.hashCode ^
        date.hashCode ^
        account.hashCode ^
        categorie.hashCode ^
        description.hashCode;
  }
}
