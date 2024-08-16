import 'package:flutter/material.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import 'package:voyago/feature/attraction/presentation/views/widgets/attractions/attraction_card.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';

import '../../../../../core/utils/custom_colors.dart';

class Step2AddingTrip extends StatelessWidget {
  const Step2AddingTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonAuth(
          title: 'Add',
          onTap: () { 
            // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Step3AddingTrip()));
          },),
      ),
      appBar: AppBar(
        backgroundColor: CustomColors.kMove[3],
        title: const Text("Chose destinations in Damascus"),),
      body:GridView.builder(
        padding: const EdgeInsets.only(left:  8,right:8, top: 30,bottom: 70 ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16.0, // Space between columns
            mainAxisSpacing: 16.0, // Space between rows
            // childAspectRatio: .8
        ),
        itemBuilder: (context, index) {
          return  Stack(
            children: [

              AttractionCard(attractionModel: AttractionModel(id: 1, name: 'asfd', isFavourite: true, rate: 0.0)),
              Container(
                decoration: BoxDecoration(
                    color: Color(0x76111111),

                    borderRadius: BorderRadius.circular(16)),
              ),
              Align(
                alignment: Alignment.center,
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.add,
                size: 100,),
                ),
              )
            ],
          );
        },
        itemCount: 10,
      )
    );
  }
}
