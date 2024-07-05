import 'package:flutter/material.dart';

class RulesSection extends StatefulWidget {
  const RulesSection({super.key});

  @override
  _RulesSectionState createState() => _RulesSectionState();
}

class _RulesSectionState extends State<RulesSection> {
  bool _agree = false;

  void _toggleAgreement(bool? value) {
    setState(() {
      _agree = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rules',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        const Text(
          'Please read the rules before continue the booking and make sure that you understand everything.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16.0),
        const Text(
          'Cancellation',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        const Text(
          '• Up to 24 hours in advance.\n'
              '• For a full refund, you must cancel at least 24 hours before the trip\'s start time.\n'
              '• This trip requires a minimum number of travelers. If it’s canceled because the minimum isn’t met, you’ll be offered a different date/trip or a full refund.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16.0),
        const Text(
          'Health',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        const Text(
          '• No wheelchair accessible.\n'
              '• Not recommended for travelers with back problems.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Checkbox(
              value: _agree,
              onChanged: _toggleAgreement,
            ),
            const Expanded(
              child: Text(
                'I read and agree and understand the rules',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}