import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_floating_button.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews/review_view_body.dart';



class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Reviews'),
        ),
        body: const ReviewsViewBody(),
        floatingActionButton: const CustomFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

