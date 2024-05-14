import 'package:flutter/material.dart';
import 'package:voyago/feature/home/presentation/views/widgets/distenations/destination_item.dart';



class DestinationListView extends StatelessWidget {
  const DestinationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Row(
            children: [
              DestinationItem(),
              SizedBox(width: 5,)
            ],
          );
        },
      ),
    );
  }
}
