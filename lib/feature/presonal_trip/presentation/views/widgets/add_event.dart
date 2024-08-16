import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/validator_manager.dart';
import '../../../../auth/login/presentation/views/widgets/custom_text_field.dart';
import '../../../../trip&booking/data/models/itinerary/itinerary_day_model.dart';
import '../../../../trip&booking/presentation/views/widgets/checkout/count_widget.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key, required this.itineraryDays});
  final List<ItineraryDay> itineraryDays;


  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  late List<String> days ;
  int selectedIndex=0;
  late String selectedDay ;
  TextEditingController titleController=TextEditingController();
  TextEditingController actionController=TextEditingController();


  @override
  void initState() {
    days=widget.itineraryDays.map((iD)=>'${"Day".tr()} ${iD.orderOfDay}').toList();
    selectedDay=days[0];

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    actionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: SingleChildScrollView(
        child: Column(
          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          children: [
            DropdownButtonFormField<String>(
              borderRadius: BorderRadius.circular(20),
              decoration: InputDecoration(
                filled: true,
                fillColor: CustomColors.kMove[3],
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),

              icon: const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white),
              ),
              iconEnabledColor: CustomColors.kWhite[0],
              dropdownColor: CustomColors.kMove[3],
              isExpanded: true,
              value: selectedDay,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDay = newValue!;
                  for(int i=0; i<days.length ;i++){
                    if(selectedDay==days[i]) selectedIndex=i;
                  }

                });
              },
              items: days.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
            ),
            const SizedBox(height: 16,),
            TextFieldCustom(
              validator: (value) => ValidatorManager().validateName(value!),
              controller: actionController,
              hint: "Event Action  ".tr(),
              onPressedIcon: () {},
              icon: const Icon(FontAwesomeIcons.pencil),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16,),
            TextFieldCustom(
              validator: (value) => ValidatorManager().validateName(value!),
              controller: titleController,
              hint: "Event title ".tr(),
              onPressedIcon: () {},
              icon: const Icon(FontAwesomeIcons.pencil),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16,),

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
            ButtonAuth(title: "Add", onTap: (){}),
            SizedBox(height: MediaQuery.viewInsetsOf(context).bottom,)


          ],
        ),
      ),
    );
  }
}
