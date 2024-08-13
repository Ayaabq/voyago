import 'package:intl/intl.dart';

class HistoryWalletModel {
  int id;
  String status;
  String type;
  int amount;
  DateTime date;

  HistoryWalletModel(
      {required this.id,
      required this.status,
      required this.type,
      required this.date,
      required this.amount});

  factory HistoryWalletModel.fromJson(Map<String, dynamic> json) {
    return HistoryWalletModel(
      id: json['id'],
      status: json['status'],
      type: json['type'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'type': type,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }
}
