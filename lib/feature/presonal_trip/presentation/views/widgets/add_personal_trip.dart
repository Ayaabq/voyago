import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/presonal_trip/presentation/views/widgets/step_2_adding_trip.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/validator_manager.dart';
import '../../../../auth/login/presentation/views/widgets/custom_text_field.dart';
import '../../../../trip&booking/presentation/views/widgets/checkout/count_widget.dart';
import 'drop_down.dart';

class AddPersonalTrip extends StatefulWidget {
  const AddPersonalTrip({super.key});

  @override
  State<AddPersonalTrip> createState() => _AddPersonalTripState();
}

class _AddPersonalTripState extends State<AddPersonalTrip> {
  TextEditingController usernameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonAuth(
            title: "Next",
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Step2AddingTrip()));
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: CustomColors.kMove[3],
        title: const Text("Adding New Trip"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Add trip Name",
              textAlign: TextAlign.start,
              style: Styles.textStyle20W700.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? CustomColors.kWhite[0]
                    : CustomColors.kMove[8],
              ),
            ),
          ),
          TextFieldCustom(
            validator: (value) => ValidatorManager().validateName(value!),
            controller: usernameController,
            hint: "Trip Name".tr(),
            onPressedIcon: () {},
            icon: const Icon(FontAwesomeIcons.pencil),
            keyboardType: TextInputType.name,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Chose Destination",
              textAlign: TextAlign.start,
              style: Styles.textStyle20W700.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? CustomColors.kWhite[0]
                    : CustomColors.kMove[8],
              ),
            ),
          ),
          CustomDropdown(
            items: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
            onChanged: (value) {
              print('Selected: $value');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Start Date",
              textAlign: TextAlign.start,
              style: Styles.textStyle20W700.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? CustomColors.kWhite[0]
                    : CustomColors.kMove[8],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // _selectDate(context, true, context.read<FilterCubit>());
            },
            child: InputDecorator(
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xff636363)
                    : CustomColors.kWhite[3],
                prefixIcon:
                    Icon(Iconsax.calendar_1, color: CustomColors.kMove[4]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
              child: Text(DateFormat('d MMM').format(DateTime.now())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ItemCountWidget(
              textStyle: Styles.textStyle20W700.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? CustomColors.kWhite[0]
                    : CustomColors.kMove[8],
              ),
              title: "Duration:".tr(),
              initialCount: 0,
              onAddTap: () {
                // context.read<CheckoutCubit>().addChildOptionalChoice(widget.eventModel.id, 1);
              },
              onMidTap: () {
                // context.read<CheckoutCubit>().addChildOptionalChoice(widget.eventModel.id, -1);
              },
              max: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Additional note",
              textAlign: TextAlign.start,
              style: Styles.textStyle20W700.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? CustomColors.kWhite[0]
                    : CustomColors.kMove[8],
              ),
            ),
          ),
          TextField(
            controller: commentController,
            decoration: InputDecoration(
              hintText: "Write a review".tr(),

              filled: true,
              // fillColor: _isFocused
              //     ? CustomColors.kWhite[0]
              //     : CustomColors.kWhite[4],
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
          SizedBox(
            height: ScreenSizeUtil.dynamicHeight(.2),
          ),
        ],
      ),
    );
  }
}
