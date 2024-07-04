import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_floating_button.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/floatin_checkout.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/step1_page.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/step2_page.dart';

import '../../../../core/widgets/back_icon_app_bar.dart';
import 'widgets/checkout/side_indicator.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  bool isFirst=true;
  void _onPageChanged(int page) {
    setState(() {
      _currentPage=page;
    });
  }


  void _onNextTapped() {

   _pageController.nextPage(duration:  const Duration(milliseconds: 300), curve: Curves.ease);

  }
  void _onBackTapped() {

  _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
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
      content: FloatingCheckout(currentPage: _currentPage, onBackTapped: _onBackTapped,
        onBookTapped: (){},
        onNextTapped: _onNextTapped),),
      body: Column(
        children: [
          StepIndicator(
            currentPage: _currentPage,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
             onPageChanged: _onPageChanged,
              children:   const [
                Step1Page(),

                Step2Page(),
                StepContent(step: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StepContent extends StatelessWidget {
  final int step;

  const StepContent({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Content for Step $step',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
