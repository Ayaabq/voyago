class Transaction {
  final int amount;
  final String status;
  final String type;
  final DateTime date;
  final int newBalance;
  final int lastBalance;

  Transaction({
    required this.amount,
    required this.status,
    required this.type,
    required this.date,
    required this.newBalance,
    required this.lastBalance,
  });

  
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      amount: json['amount'],
      status: json['status'],
      type: json['type'],
      date: DateTime.parse(json['date']),
      newBalance: json['new_balance'],
      lastBalance: json['last_balance'],
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'status': status,
      'type': type,
      'date': date.toIso8601String(),
      'new_balance': newBalance,
      'last_balance': lastBalance,
    };
  }
}
