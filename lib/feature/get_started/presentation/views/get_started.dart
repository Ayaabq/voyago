import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/get_started_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../maneger/on_boarding_cubit/on_boarding_cubit_cubit.dart';
class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {


    return   BlocProvider(

      create: (context) => OnBoardingCubitCubit(),
      child:  Scaffold(
         body:
         // GoogleMap(
         //     initialCameraPosition:
         //     CameraPosition(
         //       target:
         //       LatLng(37.42796133580664, -122.085749655962),))
        GetStartedBody(),

        ),

    );
  }
}
