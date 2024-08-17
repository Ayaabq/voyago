import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/widgets/toast/toast.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import 'package:voyago/feature/attraction/presentation/views/widgets/attractions/attraction_card.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import '../../../../../core/utils/custom_colors.dart';
import '../../manager/personal_cubit.dart';

class Step2AddingTrip extends StatefulWidget {
  const Step2AddingTrip({super.key, required this.manager, required this.attractions});
  final PersonalTripCubit manager;
  final List<AttractionModel> attractions;
  @override
  State<Step2AddingTrip> createState() => _Step2AddingTripState();
}

class _Step2AddingTripState extends State<Step2AddingTrip> {
  List<AttractionModel> selectedAttractions = [];

  @override
  Widget build(BuildContext context) {
    // Sample data for the grid, replace with actual data
    List<AttractionModel> attractions =widget.attractions;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonAuth(
          title: 'Add',
          onTap: () async{
            // Call updateAttractions with the selected list of attractions
            widget.manager.updateAttractions(selectedAttractions);
            print(widget.manager.personalTrip.name);
            print(widget.manager.personalTrip.attractions[0].name);
           var s=await widget.manager.addTrip();
           showTopToast(s);
           Future.delayed(Duration(seconds: 1));
           GoRouter.of(context).push(AppRouter.kHomeView);
            // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Step3AddingTrip()));
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: CustomColors.kMove[3],
        title: const Text("Choose Attractions in Damascus"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 30, bottom: 70),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 16.0, // Space between columns
          mainAxisSpacing: 16.0, // Space between rows
        ),
        itemBuilder: (context, index) {
          // Get the current attraction
          AttractionModel currentAttraction = attractions[index];

          return Stack(
            children: [
              // Display the attraction card
              AttractionCard(attractionModel: currentAttraction),

              // Add a semi-transparent overlay
              Container(
                decoration: BoxDecoration(
                  color: const Color(0x76111111),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),

              // Display the add icon button in the center
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    // Add the current attraction to the selected list
                    setState(() {
                      selectedAttractions.add(currentAttraction);
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: attractions.length,
      ),
    );
  }
}
