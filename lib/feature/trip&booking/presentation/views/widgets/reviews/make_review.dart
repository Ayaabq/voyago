import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';

class MakeReview extends StatefulWidget {
  const MakeReview({super.key});

  @override
  _MakeReviewState createState() => _MakeReviewState();
}

class _MakeReviewState extends State<MakeReview> {
  int _selectedRating = 0;
  bool _isFocused = false;

  void _setRating(int rating) {
    setState(() {
      _selectedRating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return

    SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please, share with us your opinion',
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
                  decoration: InputDecoration(
                    hintText: 'Write a review',
                    filled: true,
                    fillColor: _isFocused ? CustomColors.kWhite[0] : CustomColors.kWhite[4],
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColors.kWhite[4]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: CustomColors.kHighlightMove, width: 2.0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  maxLines: 5,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'What is your rate?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
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
                }),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.kMove[4], // Button color
                    foregroundColor: CustomColors.kWhite[0], // Text color
                    minimumSize: const Size(320, 35), // Width and height
                    maximumSize: const Size(320, 35), // Width and height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // Border radius
                    ),
                  ),
                  child: const Text("Send your review", style: Styles.textStyle16W700),
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

