import 'package:flutter/material.dart';
import 'package:voyago/feature/books/data/models/books_model.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/widgets/custom_rate.dart';
import '../../../data/models/destination_model.dart';

class ReviewCardDes extends StatelessWidget {
  const ReviewCardDes({
    super.key,
    required this.destinationRev,
  });
  final DestinationRev destinationRev;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    destinationRev.comment,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.kMove[3],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'View',
                      style: TextStyle(color: CustomColors.kGrey[0]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  CustomRating(
                    rate: destinationRev.rate.toDouble(),
                  ),
                  const Spacer(),
                  Text(
                   destinationRev.createdAt.toString(),
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Text(
              //   description,
              //   style: TextStyle(
              //     fontSize: 14,
              //     color: Colors.grey[800],
              //   ),
              // ),
              // const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
