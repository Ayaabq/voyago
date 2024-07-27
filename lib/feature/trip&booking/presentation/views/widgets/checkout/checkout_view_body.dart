import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/custom_floating_button.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/pages_cubit/page_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/pages_cubit/pages_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/floatin_checkout.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/pages_view.dart';

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
  late PageController _pageController ;
  late int _currentPage ;

  @override
  void initState() {
    _pageController= PageController();
    _currentPage=0;
    super.initState();

  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  void _onNextTapped() {
    _currentPage++;
    context.read<PageCubit>().setPage(_currentPage);
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );

  }

  void _onBackTapped() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    _currentPage--;
    context.read<PageCubit>().setPage(_currentPage);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: const BackIconAppBar(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  BlocBuilder<PageCubit, PageState>(builder: (_,state){
        return CustomFloatingButton(
          content: FloatingCheckout(
            currentPage: context.read<PageCubit>().imageIndex,
            onBackTapped: _onBackTapped,
            onBookTapped: () {},
            onNextTapped: _onNextTapped,
          ),
        );
      }),
      body: Column(
        children: [
          BlocBuilder<PageCubit, PageState>(builder: (_,state){
              return StepIndicator(
                currentPage: context.read<PageCubit>().imageIndex,
              );
          }),
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => TripInfo2Cubit(getIt.get<TripDetailsRepoImp>()),
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
            ),
          ),
        ],
      ),
    );
  }


  }

