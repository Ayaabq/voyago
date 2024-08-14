import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/custom_floating_button.dart';
import 'package:voyago/core/widgets/dialog/dialog.dart';
import 'package:voyago/core/widgets/dialog/dialog_void.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/checkout_cubit/checkout_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/pages_cubit/page_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/pages_cubit/pages_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_2_cubit/trip_info_2_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_2_cubit/trip_info_2_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/floatin_checkout.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/pages_view.dart';
import '../../../../../../core/stripe_payment/payment_manager.dart';
import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
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
  // bool fromWaller=false;
  int dialog=0;

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

  void _onBookTaped() async {
   if(valid()) {
      _showPaymentTypeDialog();
      dialog++;
    }else{
     showFailureDialog(context,sutitle: "All field are required");
     await Future.delayed(const Duration(seconds: 2));
     dialog++;
   }
   while(dialog--!=0) {
     GoRouter.of(context).pop();
   }
  }
  void _onWalletPayChosen()async{
    dialog++;
    final subscription = manager.stream.listen((state) {
      if (state is CheckoutSuccess) {
        showSuccessDialog(context);
        dialog++;
      } else if (state is CheckoutError) {
        showFailureDialog(context, sutitle: state.message+ " make sure you have blance");
        dialog++;
      } else if (State is CheckoutLoading) {
        showWatingDialog(context);
        dialog++;
      }
    });
    await manager.submitCheckout(widget.tripModel.id,false);
    await Future.delayed(const Duration(seconds: 1));
    while(dialog--!=0) {
      GoRouter.of(context).pop();
    }
    return;
  }
  void _onStripePayChosen()async{
    int pay= manager.getTotalPrice(widget.tripModel.price.toDouble()).toInt();
    dialog++;
    await context.read<TripInfo2Cubit>().fetchTripDetailsInfo1(widget.tripModel.id);
      if(context.read<TripInfo2Cubit>().state is TripInfo2Failure){
        showFailureDialog(context, sutitle: "No enternet");
        dialog++;
        return;
      }else if(context.read<TripInfo2Cubit>().state is TripInfo2Success){
        if((context.read<TripInfo2Cubit>().state as TripInfo2Success).
        tripInfo2Model.capacity>=manager.child!+manager.adults!){
          print(pay);
          await PaymentManager.
          makePayment
            (pay,
              "USD");
          final subscription = manager.stream.listen((state) {
            if (state is CheckoutSuccess) {
              showSuccessDialog(context);
              dialog++;
            } else if (state is CheckoutError) {
              showFailureDialog(context, sutitle: state.message+ " make sure you have blance");
              dialog++;
            } else if (State is CheckoutLoading) {
              showWatingDialog(context);
              dialog++;
            }
          });
          await manager.submitCheckout(widget.tripModel.id,true);
        }else{
          showFailureDialog(context, sutitle: "Oop's, the number of travelers you need, is not available any more!");
          dialog++;
        }
      }
    while(dialog--!=0) {
      GoRouter.of(context).pop();
    }

      return;



  }
  void _showPaymentTypeDialog(){
    //DialogCustom
    showDialog(context: context, builder: (ctx){
      return  AlertDialog(
        title: const Text("select a payment method please"),
        content:  Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed:_onWalletPayChosen,
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.kMove[4], // Button color
              foregroundColor: CustomColors.kWhite[0], // Text color
              minimumSize: const Size(double.infinity, 35), // Width and height
              maximumSize: const Size(double.infinity, 35), // Width and height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Border radius
              ),
            ),
            child: const Text("Voyago wallet", style: Styles.textStyle16W700),
          ),
          ElevatedButton(
            onPressed: _onStripePayChosen,
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.kMove[4], // Button color
              foregroundColor: CustomColors.kWhite[0], // Text color
              minimumSize: const Size(double.infinity, 35), // Width and height
              maximumSize: const Size(double.infinity, 35), // Width and height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Border radius
              ),
            ),
            child: const Text("Credit card", style: Styles.textStyle16W700),
          ),
        ],
              ),
      );
    });

    return;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Checkout".tr()),
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
