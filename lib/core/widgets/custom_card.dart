import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title, required this.content});
  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

        ),
        child:   Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,
              vertical: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                style: Styles.textStyle20W700,),
                SizedBox(height: 5),
                content

            ],
          ),
        ),
      ),
    );
  }
}
