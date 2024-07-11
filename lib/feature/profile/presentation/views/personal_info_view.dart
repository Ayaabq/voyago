import 'package:flutter/material.dart';


import 'widgets/personal_info_body.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: PersonalInformationBody());
  }
}
