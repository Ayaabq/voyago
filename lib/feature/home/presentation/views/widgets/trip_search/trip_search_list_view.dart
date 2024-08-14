// import 'package:flutter/material.dart';
// import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_search_card.dart';
//
// import '../../../../../../core/utils/screen_size_util.dart';
//
// class SearchTripsListView extends StatelessWidget {
//   const SearchTripsListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     ScreenSizeUtil.init(context);
//     return SizedBox(
//       height: 180,
//       child: ListView.builder(
//         padding: EdgeInsets.all(10),
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return const Row(
//             children: [
//               TripSearchCard(
//
//                 fromPrice: '80',
//               ),
//               SizedBox(
//                 width: 3,
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
