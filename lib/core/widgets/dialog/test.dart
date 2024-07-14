import 'package:flutter/material.dart';

import '../../../feature/wallet/presentation/views/detiles_wallet_history.dart';
import '../../../feature/wallet/presentation/views/widgets/history_wallet_body.dart';
import '../../utils/assets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TransactionDetailsScreen(),
    );
  }
}

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: const CardTransactionDetails(),
    );
  }
}

