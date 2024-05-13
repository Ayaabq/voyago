import 'package:flutter/material.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/get_started_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../maneger/on_boarding_cubit/on_boarding_cubit_cubit.dart';
class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(

      create: (context) => OnBoardingCubitCubit(),
      child: const Scaffold(
         body:  GetStartedBody(),
    
        ),
    );
  }
}

