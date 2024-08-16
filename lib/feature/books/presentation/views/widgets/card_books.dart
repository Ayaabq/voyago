import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/helper/date_time_helper.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/books/data/models/books_model.dart';
import 'package:voyago/feature/books/presentation/views/widgets/detiles_books_view.dart';
import 'package:voyago/feature/books/presentation/views/widgets/edit_book.dart';
import 'package:voyago/feature/images/presentation/views/custom)netowk_image.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/services_locater.dart';
import '../../../../images/data/repo/images_repo_impl.dart';
import '../../../../images/presentation/manager/images_cubit.dart';
import '../../../../trip&booking/presentation/views/widgets/over_view_card/icon_text_view.dart';
import '../../../data/repo/book_repo_imp.dart';
import '../../manger/detiles_book/cubit/detiles_book_cubit_cubit.dart';

class CardBooks extends StatelessWidget {
  const CardBooks(
      {super.key, required this.paymentState, required this.tripData});
  final String paymentState;

  final TripData tripData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditBook()));
        DetilesBooksCubit(getIt.get<BooksImpl>()).fetchDetilesBooks();
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const DetilesBooksView()));
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
