import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/step1_page.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/step2_page.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/step3_payment_page.dart';

import '../../../../../../core/widgets/custom_failure_error.dart';
import '../../maneger/trip_info_2_cubit/trip_info_2_cubit.dart';
import '../../maneger/trip_info_2_cubit/trip_info_2_state.dart';

class PagesView extends StatelessWidget {
  const PagesView({super.key, required this.pageController,  required this.tripModel,});
  final PageController pageController;
  final TripModel tripModel;
  @override
  Widget build(BuildContext context) {
    context.read<TripInfo2Cubit>().fetchTripDetailsInfo1(tripModel.id);

    return  Expanded(
      child: BlocBuilder<TripInfo2Cubit, TripInfo2State>(
        builder: (_, state) {
          if (state is TripInfo2Success) {
            return PageView(

              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children:  [
                Step1Page(id:tripModel.id,),
                Step2Page(tripModel: tripModel,trip: state.tripInfo2Model,name:tripModel.name ,),
                Step3PaymentPage(tripPrice: tripModel.price.toDouble(),),
              ],
            );
          } else if (state is TripInfo2Failure) {
            return Center(
                child:
                CustomFailureError(errMessage: state.errorMessage));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
