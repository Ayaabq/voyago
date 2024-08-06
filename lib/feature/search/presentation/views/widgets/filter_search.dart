import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/feature/search/presentation/views/widgets/search_elv.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../auth/login/presentation/views/widgets/button_auth.dart';
import 'package:intl/intl.dart';

class FilterSearchTrips extends StatefulWidget {
  const FilterSearchTrips({super.key});

  @override
  _FilterSearchTripsState createState() => _FilterSearchTripsState();
}

class _FilterSearchTripsState extends State<FilterSearchTrips> {
  TextEditingController whereController =
      TextEditingController(text: 'Damascus');
  DateTime checkInDate = DateTime.now();
  DateTime checkOutDate = DateTime.now().add(const Duration(days: 2));
  int travelers = 3;
  double minPrice = 0;
  double maxPrice = 1000;
  String sortBy = "Price (low to high)".tr();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Where

              Text("Where?".tr(),
                  style: Styles.textStyle16W400
                      .copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),

//search
              Padding(
                padding: const EdgeInsetsDirectional.all(1),
                child: SearchElevated(
                  onTap: () {},
                  fillColor: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xff636363)
                      /// TODO put the right controller
                      : CustomColors.kWhite[3], searchController: TextEditingController(),
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              // Check-In & Check-Out

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("Check-In".tr(), style: Styles.textStyle16W400),
                        const SizedBox(height: 10), // مسافة بين النص والحقل
                        InkWell(
                          onTap: () => _selectDate(context, true),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xff636363)
                                  : CustomColors.kWhite[3], // لون الخلفية للحقل
                              prefixIcon: Icon(
                                Iconsax.calendar_1,
                                color: CustomColors.kMove[4],
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    32), // زاوية مستديرة للحواف
                                borderSide:
                                    BorderSide.none, // إزالة الخط المحيط
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8), // التحكم بالطول
                            ),
                            child:
                                Text(DateFormat('d MMM').format(checkInDate)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  checkOut(context),
                ],
              ),

              const SizedBox(height: 20),

              const Text('Travelers', style: TextStyle(fontSize: 16)),
              // Travelers
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xff636363)
                        : CustomColors.kWhite[3],
                    borderRadius: BorderRadius.circular(32)),
                width: MediaQuery.of(context).size.width * 0.44,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Iconsax.profile_circle,
                        color: CustomColors.kMove[4],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '$travelers',
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    IconButton(
                      padding: EdgeInsetsDirectional.zero,
                      icon: Icon(
                        Iconsax.minus_cirlce,
                        color: CustomColors.kMove[4],
                      ),
                      onPressed: () {
                        if (travelers > 1) {
                          setState(() {
                            travelers--;
                          });
                        }
                      },
                    ),
                    IconButton(
                      padding: EdgeInsetsDirectional.zero,
                      icon: Icon(
                        Iconsax.add_circle,
                        color: CustomColors.kMove[4],
                      ),
                      onPressed: () {
                        setState(() {
                          travelers++;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Price
              const Text('Price', style: TextStyle(fontSize: 16)),
              RangeSlider(
                values: RangeValues(minPrice, maxPrice),
                min: 0,
                max: 1000,
                divisions: 100,
                labels: RangeLabels(
                    '\$${minPrice.round()}', '\$${maxPrice.round()}'),
                onChanged: (RangeValues values) {
                  setState(() {
                    minPrice = values.start;
                    maxPrice = values.end;
                  });
                },
                activeColor: CustomColors.kMove[5],
                inactiveColor: CustomColors.kGrey[0],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$0'),
                  Text('\$1000'),
                ],
              ),
              const SizedBox(height: 18),

              // Sort by
              const Text('Sort by', style: Styles.textStyle16W400),
              const SizedBox(height: 8),
              //  radiolistTile(),
              RadiosTitle(
                titel: Text('Price (low to high)',
                    style: Styles.textStyle13W400.copyWith(fontSize: 14)),
                value: 'Price (low to high)',
              ),

              const SizedBox(
                height: 14,
              ),
              RadioListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.5, horizontal: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                activeColor: CustomColors.kMove[5],
                //selectedTileColor: Colors.cyan,
                tileColor: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xff636363)
                    : CustomColors.kWhite[3],

                title: Text('Price (high to low)',
                    style: Styles.textStyle13W400.copyWith(fontSize: 14)),
                value: 'Price (high to low)',
                groupValue: sortBy,
                onChanged: (value) {
                  setState(() {
                    sortBy = value.toString();
                  });
                },
              ),
              const SizedBox(
                height: 14,
              ),
              // RadioListTile(
              // visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
              // contentPadding:
              //     const EdgeInsets.symmetric(vertical: 0.5, horizontal: 16),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(32)),
              // activeColor: CustomColors.kMove[5],
              //selectedTileColor: Colors.cyan,
              //   tileColor: CustomColors.kWhite[3],
              //   title: Text(
              //     'Most visited',
              //     style: Styles.textStyle13W400.copyWith(fontSize: 14),
              //   ),
              //   value: 'most visited',

              //   groupValue: sortBy,
              //   onChanged: (value) {
              //     setState(() {
              //       sortBy = value.toString();
              //     });
              //   },
              // ),

              RadiosTitle(
                titel: Text(
                  'Most visited',
                  style: Styles.textStyle13W400.copyWith(fontSize: 14),
                ),
                value: 'most visited',
              ),
              const SizedBox(height: 20),

              // Search Button
              ButtonAuth(title: "Search", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  // RadioListTile<String> radiolistTile() {
  //   final Text text;
  //   return RadioListTile(
  //     visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
  //     contentPadding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 16),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
  //     activeColor: CustomColors.kMove[5],
  //     //selectedTileColor: Colors.cyan,
  //     tileColor: CustomColors.kWhite[3],
  //     title: Text('Price (low to high)',
  //         style: Styles.textStyle13W400.copyWith(fontSize: 14)),
  //     value: 'Price (low to high)',
  //     groupValue: sortBy,
  //     onChanged: (value) {
  //       setState(() {
  //         sortBy = value.toString();
  //       });
  //     },
  //   );
  // }

  Expanded checkOut(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Check-Out', style: Styles.textStyle16W400),
          const SizedBox(height: 10), // مسافة بين النص والحقل
          InkWell(
            onTap: () => _selectDate(context, false),
            child: InputDecorator(
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xff636363)
                    : CustomColors.kWhite[3], // لون الخلفية للحقل
                prefixIcon: Icon(
                  Iconsax.calendar_1,
                  color: CustomColors.kMove[4],
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(32), // زاوية مستديرة للحواف
                  borderSide: BorderSide.none, // إزالة الخط المحيط
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8), // التحكم بالطول
              ),
              child: Text(DateFormat('d MMM').format(checkOutDate)),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isCheckIn ? checkInDate : checkOutDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null && picked != (isCheckIn ? checkInDate : checkOutDate)) {
      setState(() {
        if (isCheckIn) {
          checkInDate = picked;
        } else {
          checkOutDate = picked;
        }
      });
    }
  }
}

class RadiosTitle extends StatelessWidget {
  const RadiosTitle({super.key, required this.titel, required this.value});

  final String sortBy = 'Price (low to high)';
  final Text titel;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
      contentPadding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      activeColor: CustomColors.kMove[5],

      tileColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff636363)
          : CustomColors.kWhite[3],
      title: titel,
      //Text('Price (low to high)',
      //     style: Styles.textStyle13W400.copyWith(fontSize: 14)),
      value: titel,
//'Price (low to high)',
      groupValue: sortBy,
      onChanged: (value) {
        // setState(() {
        //   sortBy = value.toString();
        // });
      },
    );
  }
}
