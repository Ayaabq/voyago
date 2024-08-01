import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/reviews/data/models/review_model.dart';
import 'package:voyago/feature/reviews/presentation/manager/single_review_cubit/single_review_cubit.dart';
import 'package:voyago/feature/reviews/presentation/manager/single_review_cubit/single_review_state.dart';
import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/dialog/dialog_void.dart';
import '../../../../data/repo/review_repo_impl.dart';

class MakeReview extends StatefulWidget {
  const MakeReview({super.key, required this.url});
  final String url;
  @override
  _MakeReviewState createState() => _MakeReviewState();
}

class _MakeReviewState extends State<MakeReview> {
  int _selectedRating = 0;
  bool _isFocused = false;
  final TextEditingController commentController = TextEditingController();
  void _setRating(int rating) {
    setState(() {
      _selectedRating = rating;
    });
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void onSubmitted() async {
    int dialog=0;
    final SingleReviewCubit singleReviewCubit =
        SingleReviewCubit(getIt.get<ReviewRepoImp>());
    if (_selectedRating > 0 && commentController.text.isNotEmpty) {
      dialog++;
      var review =
          ReviewModel(rate: _selectedRating, review: commentController.text);

    final subscription = singleReviewCubit.stream.listen(
      
        (state) {
          if (state is SingleReviewSuccess) {
            showSuccessDialog(context);
            dialog++;

          } else if (state is SingleReviewFailure) {
            showFailureDialog(context);
            dialog++;

          } else {
            showWatingDialog(context);
            dialog++;

          }
        },
      );
      await singleReviewCubit.postReview(widget.url, review);

    } else {
      showFailureDialog(context);
      dialog++;
      await Future.delayed(const Duration(seconds: 1));

    }
    await Future.delayed(const Duration(seconds: 1));

    while(dialog--!=0)
    GoRouter.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Please, share with us your opinion".tr(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  _isFocused = hasFocus;
                });
              },
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                  hintText: "Write a review".tr(),

                  filled: true,
                  fillColor: _isFocused
                      ? CustomColors.kWhite[0]
                      : CustomColors.kWhite[4],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.kWhite[4]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: CustomColors.kHighlightMove, width: 2.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                maxLines: 5,
              ),
            ),
            const SizedBox(height: 16.0),
             Text(
              "What is your rate?".tr(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) {
                  return IconButton(
                    icon: Icon(
                      index < _selectedRating
                          ? FontAwesomeIcons.solidStar
                          : FontAwesomeIcons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                    onPressed: () => _setRating(index + 1),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: onSubmitted,
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.kMove[4], // Button color
                  foregroundColor: CustomColors.kWhite[0], // Text color
                  minimumSize: const Size(320, 35), // Width and height
                  maximumSize: const Size(320, 35), // Width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Border radius
                  ),
                ),
                child:  Text("Send your review".tr(),
                    style: Styles.textStyle16W700),
              ),
            ),
            if (_isFocused)
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}
