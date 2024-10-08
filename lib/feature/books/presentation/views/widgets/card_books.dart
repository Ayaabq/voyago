import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/helper/date_time_helper.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/books/data/models/books_model.dart';
import 'package:voyago/feature/images/presentation/views/custom)netowk_image.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/services_locater.dart';
import '../../../../images/data/repo/images_repo_impl.dart';
import '../../../../images/presentation/manager/images_cubit.dart';
import '../../../../trip&booking/presentation/views/widgets/over_view_card/icon_text_view.dart';

import '../../../data/models/detiles_books.dart';

import '../../../data/repo/book_repo_imp.dart';
import '../../manger/detiles_book/cubit/detiles_book_cubit_cubit.dart';
import '../../manger/detiles_book/cubit/detiles_book_cubit_state.dart';


class CardBooks extends StatelessWidget {
  const CardBooks(
      {super.key,
      required this.paymentState,
      required this.tripData,
    //  required this.tripDetails
});
  final String paymentState;

  final TripData tripData;
  //final TripDetails tripDetails;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditBook()));
      //   final manager=
      //   DetilesBooksCubit(getIt.get<BooksImpl>());
      //  await manager.fetchDetilesBooks();
      //   if(manager.state is BookDetilesSuccess ) {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
      //        EditBook(tripData: (manager.state as BookDetilesSuccess).model, tripId: 1,)));
      //   }else{
      //     print("noooo");
      //     print("noooo");
      //     print((manager.state as BookDetilesFailure).errorMessage);
      //   }
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const DetilesBooksView()));
        //  DetilesBooksCubit(getIt.get<BooksImpl>()).fetchDetilesBooks();
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//           return BlocProvider(
//             create: (context) =>
//                 DetilesBooksCubit(getIt.get<BooksImpl>())..fetchDetilesBooks(),
//             child: DetilesBooksView(model:tripData. ,),
//           );
//         }

// //=>
//             ));

        GoRouter.of(context)
            .push(AppRouter.kDetilesBooksView, extra: tripData);

// GoRouter.of(context).push(AppRouter.kDetilesBooksView);

      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BlocProvider(
                      create: (context) =>
                          ImageCubit(getIt.get<ImagesRepoImpl>()),
                      child: CustomNetworkImage(
                        id: tripData.id,
                        url: Confg.reservationImage,
                        height: 180,
                        width: ScreenSizeUtil.dynamicWidth(.40),
                      ))
                  // Image.asset(
                  //   HomeAssets.dummyOffers, // replace with your image asset path
                  //   height: 170,
                  //   width: ScreenSizeUtil.dynamicWidth(.30),
                  //   fit: BoxFit.cover,
                  // ),
                  ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  IconText(
                      icon: Iconsax.location,
                      title: tripData.trip.name,
                      iconColor: CustomColors.kMove[5]),
                  IconText(
                      icon: Iconsax.calendar_tick,
                      title: DateTimeHelper.formatDateDMMM(
                          DateTime.parse(tripData.trip.startDate)),
                      iconColor: CustomColors.kMove[5]),
                  IconText(
                    icon: Iconsax.user,
                    title:
                        tripData.adult.toString() + tripData.child.toString(),
                    iconColor: CustomColors.kMove[5],
                  ),
                  IconText(
                      icon: Iconsax.wallet,
                      title: 'Payment status:',
                      iconColor: CustomColors.kMove[5]),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        color: CustomColors.kMove[5],
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      paymentState,
                      style: Styles.textStyle14W600
                          .copyWith(color: CustomColors.kWhite[0]),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
