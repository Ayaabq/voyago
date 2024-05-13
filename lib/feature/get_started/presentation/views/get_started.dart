import 'package:flutter/material.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/get_started_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

<<<<<<< HEAD
=======
import '../maneger/on_boarding_cubit/on_boarding_cubit_cubit.dart';
>>>>>>> bb671e073b847e8225a30a4eea713f948cdc9ed8
class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const Scaffold(
      body: GetStartedBody(),
=======
    return   BlocProvider(

      create: (context) => OnBoardingCubitCubit(),
      child: const Scaffold(
         body:  GetStartedBody(),
    
        ),
>>>>>>> bb671e073b847e8225a30a4eea713f948cdc9ed8
    );
  }
}
