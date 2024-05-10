import 'package:flutter/material.dart';

import 'package:voyago/feature/get_started/presentation/views/widgets/on_boarding.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  static const List<Widget> bodies = [
    Text("data"),
    Text("data"),
    Text("data"),
    Text("data"),
    Text("data"),
  ];

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:  OnBoarding(),
    );
  }
}
