import 'dart:convert';

class OperationModel {
  String operationValue;
  String operation;
  DateTime date;
  bool paid;
  String account;
  String categorie;
  String description;
  String receipt;

  OperationModel({
    this.operationValue = '',
    this.operation = '',
    required this.date,
    this.paid = false,
    this.account = '',
    this.categorie = '',
    this.description = '',
    this.receipt = '',
  });

  OperationModel copyWith({
    String? operationValue,
    String? operation,
    DateTime? date,
    bool? paid,
    String? account,
    String? categorie,
    String? description,
    String? receipt,
  }) {
    return OperationModel(
      operationValue: operationValue ?? this.operationValue,
      operation: operation ?? this.operation,
      date: date ?? this.date,
      paid: paid ?? this.paid,
      account: account ?? this.account,
      categorie: categorie ?? this.categorie,
      description: description ?? this.description,
      receipt: receipt ?? this.receipt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'operationValue': operationValue});
    result.addAll({'operation': operation});
    result.addAll({'date': date.millisecondsSinceEpoch});
    result.addAll({'paid': paid});
    result.addAll({'account': account});
    result.addAll({'categorie': categorie});
    result.addAll({'description': description});
    result.addAll({'receipt': receipt});

    return result;
  }

  factory OperationModel.fromMap(Map<String, dynamic> map) {
    return OperationModel(
      operationValue: map['operationValue'] ?? '',
      operation: map['operation'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      paid: map['paid'] ?? false,
      account: map['account'] ?? '',
      categorie: map['categorie'] ?? '',
      description: map['description'] ?? '',
      receipt: map['receipt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OperationModel.fromJson(String source) =>
      OperationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OperationModel(operationValue: $operationValue, operation: $operation, date: $date, paid: $paid, account: $account, categorie: $categorie, description: $description, receipt: $receipt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OperationModel &&
        other.operationValue == operationValue &&
        other.operation == operation &&
        other.date == date &&
        other.paid == paid &&
        other.account == account &&
        other.categorie == categorie &&
        other.description == description &&
        other.receipt == receipt;
  }

  @override
  int get hashCode {
    return operationValue.hashCode ^
        operation.hashCode ^
        date.hashCode ^
        paid.hashCode ^
        account.hashCode ^
        categorie.hashCode ^
        description.hashCode ^
        receipt.hashCode;
  }
}
