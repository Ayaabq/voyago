import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/custom_floating_button.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_2_cubit/trip_info_2_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/floatin_checkout.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/pages_view.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/step1_page.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/step2_page.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/step3_payment_page.dart';

import '../../../../../../core/utils/services_locater.dart';
import '../../../../../../core/widgets/back_icon_app_bar.dart';
import '../../../../data/repo/trip_details_repo/trip_details_repo_impl.dart';
import '../../maneger/optional_choices_cubit/optional_choices_cubit.dart';
import '../../maneger/trip_info_2_cubit/trip_info_2_cubit.dart';
import 'side_indicator.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key, required this.tripModel});
  final TripModel tripModel;
  @override
  _CheckoutViewBodyState createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  bool isFirst = true;
  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onNextTapped() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _onBackTapped() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: const BackIconAppBar(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(
        content: FloatingCheckout(
            currentPage: _currentPage,
            onBackTapped: _onBackTapped,
            onBookTapped: () {},
            onNextTapped: _onNextTapped),
      ),
      body: Column(
        children: [
          StepIndicator(
            currentPage: _currentPage,
          ),
          MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) =>
                      TripInfo2Cubit(getIt.get<TripDetailsRepoImp>()),
                ),
                BlocProvider(
                  create: (_) => CheckoutCubit(getIt.get<TripDetailsRepoImp>()),
                ),
                BlocProvider(
                  create: (_) => OptionalEventsCubit(getIt.get<TripDetailsRepoImp>()),
                ),
              ],
              child: PagesView(
                tripModel: widget.tripModel,
                pageController: _pageController,
                onPageChanged: _onPageChanged,
              ))
        ],
      ),
    );
  }
}
