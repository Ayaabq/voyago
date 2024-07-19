import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/feature/reviews/presentation/widgets/reviews/review_card.dart';
import 'package:voyago/feature/trip&booking/data/models/review_model.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/styles.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: "Reviews",
      onTap: (){
        GoRouter.of(context).push(AppRouter.kReviewsView);
      },
      content: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
            decoration: BoxDecoration(
              color: CustomColors.kMove[2],
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                const CustomRating(
                  rate: 4.8,
                  iconSize: 16,
                  fontStyle: Styles.textStyle14W600,
                ),
                const Spacer(),
                Text(
                  '118 Reviews',
                  style: Styles.textStyle14W400
                      .copyWith(color: CustomColors.kGrey[2]),
                ),
              ],
            ),
          ),
          ReviewCard(
            reviewModel: ReviewModel(
                userName: 'Rolana',
                rate: 4.5,
                review:
                    'It was a great trip with amazing guide, '
                        'the cruise was good and comfortable and the view was wonderful.',
                reviewedAt: DateTime.now()),
          ),
          const Divider(),
          ReviewCard(
            reviewModel: ReviewModel(
                userName: 'Rolana',
                rate: 4.5,
                review:
                    'It was a great trip with amazing guide, '
                        'the cruise was good and comfortable and the view was wonderful.',
                reviewedAt: DateTime.now()),
          )
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Reviews'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ReviewsWidget(),
//         ),
//       ),
//     );
//   }
// }
//
// class ReviewsWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Reviews',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 'View all',
//                 style: TextStyle(
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16),
//         Container(
//           padding: EdgeInsets.all(8.0),
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Row(
//             children: [
//               Icon(
//                 Icons.star,
//                 color: Colors.orange,
//                 size: 24,
//               ),
//               SizedBox(width: 8),
//               Text(
//                 '4.8/5',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(width: 8),
//               Text(
//                 '118 Reviews',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 16),
//         Row(
//           children: [
//             FilterChip(
//               label: Text('All'),
//               onSelected: (bool selected) {},
//             ),
//             SizedBox(width: 8),
//             FilterChip(
//               label: Text('Latest'),
//               onSelected: (bool selected) {},
//             ),
//             SizedBox(width: 8),
//             FilterChip(
//               label: Text('Positive reviews'),
//               onSelected: (bool selected) {},
//             ),
//             SizedBox(width: 8),
//             FilterChip(
//               label: Text('Negative reviews'),
//               onSelected: (bool selected) {},
//             ),
//           ],
//         ),
//         SizedBox(height: 16),
//         ReviewItem(
//           name: 'Rolana',
//           rating: 4.5,
//           date: 'Sep 12, 2023',
//         ),
//       ],
//     );
//   }
// }
//
