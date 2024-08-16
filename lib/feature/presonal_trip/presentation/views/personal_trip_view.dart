import 'package:flutter/material.dart';
import 'package:voyago/feature/presonal_trip/presentation/views/widgets/add_personal_trip.dart';
import 'package:voyago/feature/presonal_trip/presentation/views/widgets/personal_trip_body.dart';

class PersonalTrip extends StatelessWidget {
  const PersonalTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Personal trip"),
      actions: [
        ElevatedButton.icon(onPressed: (){
          // TODO make go router
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddPersonalTrip()));
        }, label: Text("New"), icon: Icon(Icons.add),)
      ],),
      body: const PersonalTripBody(),
    );
  }
}
