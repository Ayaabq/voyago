import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/custom_floating_button.dart';
import 'package:voyago/core/widgets/dialog/dialog_void.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/pages_cubit/page_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/pages_cubit/pages_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/floatin_checkout.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/pages_view.dart';
import '../../../../../../core/utils/validator_manager.dart';
import '../../../../../../core/widgets/back_icon_app_bar.dart';
import 'side_indicator.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key, required this.tripModel});
  final TripModel tripModel;

  @override
  _CheckoutViewBodyState createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController _pageController;
  late int _currentPage;
  late CheckoutCubit manager;
  @override
  void initState() {
    manager = context.read<CheckoutCubit>();
    _pageController = PageController();
    _currentPage = 0;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool valid() {
    var validator = ValidatorManager();
    if (_currentPage == 0) {
      return (manager.agree && manager.adults! > 0 && manager.adults != null);
    } else if (_currentPage == 1) {
      String? email = manager.email;
      String? phoneNumber = manager.phoneNumber;
      return (email != null &&
          email.isNotEmpty &&
          validator.validateEmail(email) == null &&
          phoneNumber != null &&
          phoneNumber.isNotEmpty &&
          validator.validatePhone(phoneNumber) == null);
    } else if (_currentPage == 2) {
      return (manager.password != null &&
          manager.password!.isNotEmpty &&
          validator.validatePassword(manager.password!) == null);
    }
    return true;
  }

  void _onNextTapped() {
    if (valid()) {
      _currentPage++;
      context.read<PageCubit>().setPage(_currentPage);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      showFailureDialog(context);
    }
  }

  void _onBackTapped() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    _currentPage--;
    context.read<PageCubit>().setPage(_currentPage);
  }

  void _onBookTaped() {
    if(valid()){
      print("yeeeeeeeeeesssssssss");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: const BackIconAppBar(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          BlocBuilder<PageCubit, PageState>(builder: (_, state) {
        return CustomFloatingButton(
          content: FloatingCheckout(
            currentPage: context.read<PageCubit>().imageIndex,
            onBackTapped: _onBackTapped,
            onBookTapped: _onBookTaped,
            onNextTapped: _onNextTapped,
          ),
        );
      }),
      body: Column(
        children: [
          BlocBuilder<PageCubit, PageState>(builder: (_, state) {
            return StepIndicator(
              currentPage: context.read<PageCubit>().imageIndex,
            );
          }),
          PagesView(
            tripModel: widget.tripModel,
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}
