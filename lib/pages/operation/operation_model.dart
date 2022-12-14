import 'dart:convert';

class OperationModel {
  String operationValue;
  bool paid;
  String description;
  DateTime date;
  String account;
  String operation;

  OperationModel({
    this.operationValue = '',
    this.paid = false,
    this.description = '',
    required this.date,
    this.account = '',
    this.operation = '',
  });

  OperationModel copyWith({
    String? operationValue,
    bool? paid,
    String? description,
    DateTime? date,
    String? account,
    String? operation,
  }) {
    return OperationModel(
      operationValue: operationValue ?? this.operationValue,
      paid: paid ?? this.paid,
      description: description ?? this.description,
      date: date ?? this.date,
      account: account ?? this.account,
      operation: operation ?? this.operation,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'operationValue': operationValue});
    result.addAll({'paid': paid});
    result.addAll({'description': description});
    result.addAll({'date': date.millisecondsSinceEpoch});
    result.addAll({'account': account});
    result.addAll({'operation': operation});

    return result;
  }

  factory OperationModel.fromMap(Map<String, dynamic> map) {
    return OperationModel(
      operationValue: map['operationValue'] ?? '',
      paid: map['paid'] ?? false,
      description: map['description'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      account: map['account'] ?? '',
      operation: map['operation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OperationModel.fromJson(String source) =>
      OperationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OperationModel(operationValue: $operationValue, paid: $paid, description: $description, date: $date, account: $account, operation: $operation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OperationModel &&
        other.operationValue == operationValue &&
        other.paid == paid &&
        other.description == description &&
        other.date == date &&
        other.account == account &&
        other.operation == operation;
  }

  @override
  int get hashCode {
    return operationValue.hashCode ^
        paid.hashCode ^
        description.hashCode ^
        date.hashCode ^
        account.hashCode ^
        operation.hashCode;
  }
}
