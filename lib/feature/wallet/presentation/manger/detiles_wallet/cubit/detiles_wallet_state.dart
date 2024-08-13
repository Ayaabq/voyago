import 'package:equatable/equatable.dart';

import '../../../../data/models/ditels_histroy_wallet.dart';

abstract class TransactionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final Transaction transactionModel;

  TransactionSuccess(this.transactionModel);
 static TransactionSuccess fromJson(Map<String, dynamic> response) {
    return TransactionSuccess(response['data']);
  }
  
}

class TransactionFailure extends TransactionState {
  final String errorMessage;
  TransactionFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static TransactionFailure fromJson(Map<String, dynamic> response) {
    return TransactionFailure(response['err'] ?? 'Unknown error');
  }
}
