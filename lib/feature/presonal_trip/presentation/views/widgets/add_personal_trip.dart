// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:voyago/core/utils/confg.dart';
// import 'package:voyago/core/utils/custom_colors.dart';
// import 'package:voyago/core/utils/screen_size_util.dart';
// import 'package:voyago/core/utils/services_locater.dart';
// import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
// import 'package:voyago/feature/destination/data/models/destination_model.dart';
// import 'package:voyago/feature/destination/data/repo/destination_repo.dart';
// import 'package:voyago/feature/destination/data/repo/destination_repo_impl.dart';
// import 'package:voyago/feature/destination/presentation/manager/destination_cubit/destination_cubit.dart';
// import 'package:voyago/feature/destination/presentation/manager/destination_cubit/destination_state.dart';
// import 'package:voyago/feature/presonal_trip/presentation/views/widgets/step_2_adding_trip.dart';
//
// import '../../../../../core/utils/styles.dart';
// import '../../../../../core/utils/validator_manager.dart';
// import '../../../../auth/login/presentation/views/widgets/custom_text_field.dart';
// import '../../../../trip&booking/presentation/views/widgets/checkout/count_widget.dart';
// import 'drop_down.dart';
//
// class AddPersonalTrip extends StatefulWidget {
//   const AddPersonalTrip({super.key});
//
//   @override
//   State<AddPersonalTrip> createState() => _AddPersonalTripState();
// }
//
// class _AddPersonalTripState extends State<AddPersonalTrip> {
//   TextEditingController usernameController = TextEditingController();
//    TextEditingController commentController = TextEditingController();
//   late List<DestinationModel> destinations;
//   int sellected=0;
//   @override
//   void initState() async{
//     DestinationCubit desM=DestinationCubit(getIt.get<DestinationRepoImp>());
//     await desM.fetchDestinationInitial(Confg.allDestination);
//     if(desM.state is DestinationSuccess)
//     destinations=(desM.state as DestinationSuccess).destinationModels;
//     else
//       destinations=[];
//     super.initState();
//   }
//   @override
//   void dispose() {
//     usernameController.dispose();
//     commentController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ButtonAuth(
//             title: "Next",
//             onTap: () {
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (_) => Step2AddingTrip()));
//             }),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       appBar: AppBar(
//         backgroundColor: CustomColors.kMove[3],
//         title: const Text("Adding New Trip"),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         children: [
//           const SizedBox(
//             height: 30,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Add trip Name",
//               textAlign: TextAlign.start,
//               style: Styles.textStyle20W700.copyWith(
//                 color: Theme.of(context).brightness == Brightness.dark
//                     ? CustomColors.kWhite[0]
//                     : CustomColors.kMove[8],
//               ),
//             ),
//           ),
//           TextFieldCustom(
//             validator: (value) => ValidatorManager().validateName(value!),
//             controller: usernameController,
//             hint: "Trip Name".tr(),
//             onPressedIcon: () {},
//             icon: const Icon(FontAwesomeIcons.pencil),
//             keyboardType: TextInputType.name,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Chose Destination",
//               textAlign: TextAlign.start,
//               style: Styles.textStyle20W700.copyWith(
//                 color: Theme.of(context).brightness == Brightness.dark
//                     ? CustomColors.kWhite[0]
//                     : CustomColors.kMove[8],
//               ),
//             ),
//           ),
//           CustomDropdown(
//             items: destinations,
//             onChanged: (value) {
//               print('Selected: $value');
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Start Date",
//               textAlign: TextAlign.start,
//               style: Styles.textStyle20W700.copyWith(
//                 color: Theme.of(context).brightness == Brightness.dark
//                     ? CustomColors.kWhite[0]
//                     : CustomColors.kMove[8],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               // _selectDate(context, true, context.read<FilterCubit>());
//             },
//             child: InputDecorator(
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Theme.of(context).brightness == Brightness.dark
//                     ? const Color(0xff636363)
//                     : CustomColors.kWhite[3],
//                 prefixIcon:
//                     Icon(Iconsax.calendar_1, color: CustomColors.kMove[4]),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(32),
//                   borderSide: BorderSide.none,
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(vertical: 8),
//               ),
//               child: Text(DateFormat('d MMM').format(DateTime.now())),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ItemCountWidget(
//               textStyle: Styles.textStyle20W700.copyWith(
//                 color: Theme.of(context).brightness == Brightness.dark
//                     ? CustomColors.kWhite[0]
//                     : CustomColors.kMove[8],
//               ),
//               title: "Duration:".tr(),
//               initialCount: 0,
//               onAddTap: () {
//                 // context.read<CheckoutCubit>().addChildOptionalChoice(widget.eventModel.id, 1);
//               },
//               onMidTap: () {
//                 // context.read<CheckoutCubit>().addChildOptionalChoice(widget.eventModel.id, -1);
//               },
//               max: null,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Additional note",
//               textAlign: TextAlign.start,
//               style: Styles.textStyle20W700.copyWith(
//                 color: Theme.of(context).brightness == Brightness.dark
//                     ? CustomColors.kWhite[0]
//                     : CustomColors.kMove[8],
//               ),
//             ),
//           ),
//           TextField(
//             controller: commentController,
//             decoration: InputDecoration(
//               hintText: "Write a review".tr(),
//
//               filled: true,
//               // fillColor: _isFocused
//               //     ? CustomColors.kWhite[0]
//               //     : CustomColors.kWhite[4],
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: CustomColors.kWhite[4]),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                     color: CustomColors.kHighlightMove, width: 2.0),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//             maxLines: 5,
//           ),
//           SizedBox(
//             height: ScreenSizeUtil.dynamicHeight(.2),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import 'package:voyago/feature/attraction/data/repo/attraction_repo_impl.dart';
import 'package:voyago/feature/attraction/presentation/manager/attraction_state.dart';
import 'package:voyago/feature/attraction/presentation/manager/attractoin_cubit.dart';
import 'package:voyago/feature/presonal_trip/presentation/views/widgets/step_2_adding_trip.dart';

import '../../../../../core/utils/confg.dart';
import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/services_locater.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/validator_manager.dart';
import '../../../../auth/login/presentation/views/widgets/button_auth.dart';
import '../../../../auth/login/presentation/views/widgets/custom_text_field.dart';
import '../../../../destination/data/models/destination_model.dart';
import '../../../../destination/data/repo/destination_repo_impl.dart';
import '../../../../destination/presentation/manager/destination_cubit/destination_cubit.dart';
import '../../../../destination/presentation/manager/destination_cubit/destination_state.dart';
import '../../../../trip&booking/presentation/views/widgets/checkout/count_widget.dart';
import '../../manager/personal_cubit.dart';
import '../../manager/personal_state.dart';
import 'drop_down.dart';
class AddPersonalTrip extends StatefulWidget {
  const AddPersonalTrip({super.key, required this.destinations});
  final List<DestinationModel> destinations;


  @override
  State<AddPersonalTrip> createState() => _AddPersonalTripState();
}
class _AddPersonalTripState extends State<AddPersonalTrip> {
   PersonalTripCubit personalTripCubit=PersonalTripCubit();

  TextEditingController nameController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Add listeners to update cubit when text changes
    nameController.addListener(() {
      personalTripCubit.updateName(nameController.text);
    });

    notesController.addListener(() {
      personalTripCubit.updateNotes(notesController.text);
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    notesController.dispose();
    personalTripCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalTripCubit, PersonalTripState>(
      bloc: personalTripCubit,
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonAuth(
              title: "Next",
              onTap: () async{
                print(personalTripCubit.personalTrip.duration);
                print(personalTripCubit.personalTrip.destination.name);
                print(personalTripCubit.personalTrip.notes);
                print(personalTripCubit.personalTrip.name);
                print(personalTripCubit.personalTrip.startDate);
                List<AttractionModel> destinations=[];
                AttractionCubit desM=AttractionCubit(getIt.get<AttractionRepoImp>());

                await desM.fetchAttractionInitial(Confg.allDestinationAttraction+personalTripCubit.personalTrip.destination.id.toString());
                print(desM.state.runtimeType);
                if(desM.state is AttractionSuccess) {
                  destinations =(desM.state as AttractionSuccess).attractionModel;
                }else{
                  print((desM.state as AttractionFailure).errorMessage);
                }
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => BlocProvider
                      ( create: (_)=>personalTripCubit,
                        child:Step2AddingTrip(manager: personalTripCubit, attractions: destinations,)))
                );
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          appBar: AppBar(
            backgroundColor: CustomColors.kMove[3],
            title: const Text("Adding New Trip"),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              const SizedBox(height: 30),

              // Trip Name
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
                controller: nameController,
                hint: "Trip Name".tr(),
                icon: const Icon(FontAwesomeIcons.pencil),
                keyboardType: TextInputType.name, onPressedIcon: () {  },
              ),

              // Destination Dropdown
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Choose Destination",
                  textAlign: TextAlign.start,
                  style: Styles.textStyle20W700.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? CustomColors.kWhite[0]
                        : CustomColors.kMove[8],
                  ),
                ),
              ),
              CustomDropdown(
                items: widget.destinations,
                onChanged: (value) {

                  // Search for the destination model where the name matches the selected value
                  DestinationModel? selectedDestination = widget.destinations.firstWhere(
                        (destination) => destination.name == value,
                  );

                  // If a matching destination is found, update the cubit
                  if (selectedDestination != null) {
                    personalTripCubit.updateDestination(selectedDestination);
                  }
                },
              ),

              // Start Date
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
                onTap: () async {
                  // Show the date picker
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: CustomColors.kMove[4], // header background color
                            onPrimary: Colors.white, // header text color
                            onSurface: CustomColors.kMove[8], // body text color
                          ),
                          dialogBackgroundColor: CustomColors.kWhite[0], // background color of the date picker
                        ),
                        child: child!,
                      );
                    },
                  );

                  // If the user picks a date, update the cubit with the selected date
                  if (pickedDate != null) {
                    personalTripCubit.updateStartDate(pickedDate);
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xff636363)
                        : CustomColors.kWhite[3],
                    prefixIcon: Icon(Iconsax.calendar_1, color: CustomColors.kMove[4]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: BlocBuilder<PersonalTripCubit, PersonalTripState>(
                    builder: (context, state) {
                      // Display the selected date in the InputDecorator
                      return Text(
                        DateFormat('d MMM yyyy').format(personalTripCubit.personalTrip.startDate),
                      );
                    },
                  ),
                ),
              ),


              // Duration
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ItemCountWidget(
                  textStyle: Styles.textStyle20W700.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? CustomColors.kWhite[0]
                        : CustomColors.kMove[8],
                  ),
                  title: "Duration:".tr(),
                  initialCount: personalTripCubit.personalTrip.duration,
                  onAddTap: () {
                    personalTripCubit.updateDuration(
                       ( personalTripCubit.personalTrip.duration + 1)
                    );
                    setState(() {

                    });
                  },
                  onMidTap: () {
                    if (personalTripCubit.personalTrip.duration > 0) {
                      personalTripCubit.updateDuration(personalTripCubit.personalTrip.duration - 1);
                      setState(() {

                      });
                    }
                  },
                  max:1000,

                ),
              ),

              // Notes
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
                controller: notesController,
                decoration: InputDecoration(
                  hintText: "Write a review".tr(),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.kWhite[4]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: CustomColors.kHighlightMove,
                      width: 2.0,
                    ),
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
      },
    );
  }
}
