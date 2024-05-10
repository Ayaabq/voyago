import 'package:flutter/material.dart';
import 'package:voyago/feature/get_started/presentation/views/get_started.dart';

void main() {
  runApp(const VoyagoApp());
}

class VoyagoApp extends StatelessWidget {
  const VoyagoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: GetStarted(),
    );
  }
}
