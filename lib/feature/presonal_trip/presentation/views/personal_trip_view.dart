import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/presonal_trip/presentation/manager/personal_cubit.dart';
import 'package:voyago/feature/presonal_trip/presentation/views/widgets/add_personal_trip.dart';
import 'package:voyago/feature/presonal_trip/presentation/views/widgets/personal_trip_body.dart';

import '../../../../core/utils/confg.dart';
import '../../../../core/utils/services_locater.dart';
import '../../../destination/data/models/destination_model.dart';
import '../../../destination/data/repo/destination_repo_impl.dart';
import '../../../destination/presentation/manager/destination_cubit/destination_cubit.dart';
import '../../../destination/presentation/manager/destination_cubit/destination_state.dart';

class PersonalTrip extends StatelessWidget {
  const PersonalTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Personal trip"),
      actions: [
        ElevatedButton.icon(onPressed: ()async{
           List<DestinationModel> destinations=[];
          DestinationCubit desM=DestinationCubit(getIt.get<DestinationRepoImp>());

          await desM.fetchDestinationInitial(Confg.allDestination);
          print(desM.state.runtimeType);
          if(desM.state is DestinationSuccess) {
            destinations =(desM.state as DestinationSuccess).destinationModels;
          }else{
            print((desM.state as DestinationFailure).errorMessage);
          }

          // TODO make go router
          Navigator.of(context).push(MaterialPageRoute
            (builder: (context)=>
             BlocProvider (
               create: (_)=>PersonalTripCubit(),
                 child:AddPersonalTrip(destinations:destinations,))
          ));
        }, label: Text("New"), icon: Icon(Icons.add),)
      ],),
      body: const PersonalTripBody(),
    );
  }
}
