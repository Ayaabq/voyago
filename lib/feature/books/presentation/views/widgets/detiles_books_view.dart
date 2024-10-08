import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/books/presentation/manger/detiles_book/cubit/detiles_book_cubit_cubit.dart';
import 'package:voyago/feature/books/presentation/views/widgets/edit_book.dart';

import '../../../../../core/domain/services/api.dart';
import '../../../../../core/helper/date_time_helper.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/confg.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/services_locater.dart';
import '../../../../../core/widgets/dialog/dialog_void.dart';
import '../../../../images/data/repo/images_repo_impl.dart';
import '../../../../images/presentation/manager/images_cubit.dart';
import '../../../../images/presentation/views/custom)netowk_image.dart';
import '../../../../profile/presentation/views/widgets/appbar_profile.dart';
import '../../../../trip&booking/presentation/views/widgets/checkout/price_details_section.dart';
import '../../../../trip&booking/presentation/views/widgets/over_view_card/icon_text_view.dart';
import '../../../data/models/books_model.dart';
import '../../../data/models/detiles_books.dart';
import '../../manger/detiles_book/cubit/detiles_book_cubit_state.dart';

class DetilesBooksView extends StatelessWidget {
  const DetilesBooksView({
    super.key,
    required this.tripData,
    //  required this.model,
  });
  //final TripDetails model;
  final TripData tripData;
  @override
  Widget build(BuildContext context) {
    context
        .read<DetilesBooksCubit>()
        .fetchDetilesBooks(Confg.detailsreservation + tripData.id.toString());
    return Scaffold(body: BlocBuilder<DetilesBooksCubit, DetilesBookState>(
        builder: (context, state) {
      if (state is BookDetilesSuccess) {
        return ListView(
          children: [
            Column(children: [
              ProfileAppBar(
                titel: 'My bookings'.tr(),
              ),
              const SizedBox(height: 30),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? CustomColors.kMove[3]
                        : CustomColors.kWhite[4],
                    borderRadius: BorderRadius.circular(32)),
                child: Text(
                  "${"Booking id:".tr()} 32146021",
                  style: Styles.textStyle16W400,
                ),
              ),
              const SizedBox(height: 10),
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
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(16),
                  //   child: Image.asset(
                  //     HomeAssets.dummyOffers, // replace with your image asset path
                  //     height: 170,
                  //     width: ScreenSizeUtil.dynamicWidth(.90),
                  //     fit: BoxFit.cover,
                  //   ),
                  ),
              const SizedBox(height: 10),
              // ColumuDetilesBook(model: model),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    DetilesColoumn(model: state.model.details),
                    const Divider(
                        // color: CustomColors.kGrey[0],
                        ),
                    IconText(
                        icon: Iconsax.clock,
                        title: 'cancellation date:'.tr() +
                            state.model.dateToDisableEditAndCancellation,
                        iconColor: CustomColors.kMove[5]),
                    const SizedBox(height: 10),

                    /// TODO:  ekhty hety el trip price
                    // const PriceDetailsSection(
                    //   tripPrice: 0,
                    // ),
                    Card(
                        color: Theme.of(context).cardColor,
                        child: Column(
                          children: [
                            const Text(
                              "Price Details",
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Travelers:"),
                                  Column(
                                    children: [
                                      Text(
                                          "${state.model.details.tripPrice} x ${state.model.details.children}"
                                          " children"),
                                      Text(
                                          "${state.model.details.tripPrice} x ${state.model.details.adults}"
                                          " adults"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            // const Text("Optional choices:"),
                            // const SizedBox(height: 10),
                            // Text(
                            //     "${state.model.reservedEvents[0].event.priceAdult ?? "0"} x ${state.model.reservedEvents[0].adult}  Adult"),
                            // Text(
                            //     "${state.model.reservedEvents[0].event.priceChild ?? "0"} x ${state.model.reservedEvents[0].child}  child"),
                            // const Divider(),
                            Text("Total:  ${state.model.details.tripPrice}"),
                          ],
                        )),

                    const SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 75),
                            backgroundColor: CustomColors.kMove[5],
                            foregroundColor: CustomColors.kWhite[0],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => EditBook(
                                    tripData: state.model,
                                    tripId: tripData.tripId)));
                          },
                          child: const Icon(Iconsax.edit),
                        ),
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     padding: const EdgeInsets.symmetric(horizontal: 75),
                        //     backgroundColor: CustomColors.kMove[5],
                        //     foregroundColor: CustomColors.kWhite[0],
                        //     shape: const RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.all(
                        //         Radius.circular(16),
                        //       ),
                        //     ),
                        //   ),
                        //   onPressed: () async {
                        //     showWatingDialog(context);

                        //     var res = await getIt.get<ApiServices>().delete(
                        //           Confg.deleteResv + tripData.id.toString(),
                        //           hasToken: true,
                        //         );
                        //     var deta = DateTime.now();
                        //     if (deta ==
                        //         state.model.dateToDisableEditAndCancellation) {
                        //       showFailureDialog(context, sutitle: res['msg']);
                        //     }
                        //     GoRouter.of(context).pop();
                        //     showSuccessDialog(context, subtitle: res['msg']);
                        //   },
                        //   child: const Icon(Iconsax.trash),
                        // ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            backgroundColor: CustomColors.kMove[5],
                            foregroundColor: CustomColors.kWhite[0],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (DateTime.now()
                                .isAfter(DateTime.parse(state.model.dateToDisableEditAndCancellation))) {
                              // إذا كانت الرحلة منتهية، قم بإظهار رسالة خطأ
                              showFailureDialog(context,
                                  sutitle: "The trip has already ended.");
                            } else {
                              // تنفيذ عملية الحذف
                              showWatingDialog(context);

                              var res = await getIt.get<ApiServices>().delete(
                                    Confg.deleteResv + tripData.id.toString(),
                                    hasToken: true,
                                  );

                              GoRouter.of(context).pop();
                              showSuccessDialog(context, subtitle: res['msg']);
                            }
                          },
                          child: const Icon(Iconsax.trash),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    // ButtonAuth(
                    //     title: "See the full trip details",
                    //     onTap: () {
                    //       GoRouter.of(context)
                    //           .pushReplacement(AppRouter.kTripDetailsView);
                    //     }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ]),
          ],
        );
      } else if (state is BookDetilesFailure) {
        print(state.errorMessage);
        return const Center(
          child: Text("Eror"),
        );
      } else if (state is BookDetilesLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return const Center(
          child: Text("Eror"),
        );
      }
    }));
  }
}

class DetilesColoumn extends StatelessWidget {
  const DetilesColoumn({
    super.key,
    required this.model,
  });

  final TripDetails model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.tripName,
          style: Styles.textStyle16W400,
        ),
        const SizedBox(height: 10),
        IconText(
            icon: Iconsax.location,
            title: model.destination,
            iconColor: CustomColors.kMove[5]),
        IconText(
            icon: Iconsax.calendar_tick,
            title: "Form:".tr() +
                DateTimeHelper.formatDateMMMDY(
                    DateTime.parse(model.from.toString())),
            iconColor: CustomColors.kMove[5]),
        IconText(
            icon: Iconsax.calendar_tick,
            title:
                "${"To:".tr()}${DateTimeHelper.formatDateMMMDY(DateTime.parse(model.to.toString()))}",
            iconColor: CustomColors.kMove[5]),
        IconText(
          icon: Iconsax.user,
          title:
              '${model.adults} ${"Adult".tr()},  ${model.children} ${"Child".tr()}',
          iconColor: CustomColors.kMove[5],
        ),
        IconText(
            isLast: false,
            icon: Iconsax.location,
            title: 'Meeting point:'.tr() + model.meetingPoint,
            iconColor: CustomColors.kMove[5]),
        IconText(
            icon: Icons.phone_outlined,
            title: 'phone:'.tr() + model.phoneNumber,
            iconColor: CustomColors.kMove[5]),
        IconText(
            icon: Icons.email_outlined,
            title: 'Email:'.tr() + model.email,
            iconColor: CustomColors.kMove[5]),
        Row(
          children: [
            IconText(
                isLast: false,
                icon: Iconsax.wallet,
                title: 'Payment status:'.tr(),
                iconColor: CustomColors.kMove[5]),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: CustomColors.kMove[5],
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                "payment",
                style: Styles.textStyle14W600
                    .copyWith(color: CustomColors.kWhite[0]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// class ColumuDetilesBook extends StatelessWidget {
//   const ColumuDetilesBook({
//     super.key,
//     required this.model,
//   });

//   final TripDetails model;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [

//       ],
//     );
//   }
// }
