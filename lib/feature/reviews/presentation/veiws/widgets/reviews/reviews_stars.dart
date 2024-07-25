import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class ReviewsStars extends StatelessWidget {
  const ReviewsStars({super.key, required this.starCount, required this.count, required this.total});
  final int starCount;
  final int count;
  final int total;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const  EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Row(
            children: List.generate(
              starCount,
                  (index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: Icon(
                      FontAwesomeIcons.solidStar,
                                    color: Color(0xffFFDD4F),
                                    size: 16,
                                  ),
                  ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: CustomColors.kGrey[0],

              ),
              height: 14,
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: total>0?count / total: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffFFDD4F),

                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
