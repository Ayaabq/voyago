import 'package:flutter/material.dart';
import 'package:voyago/feature/get_started/data/maneger/on_boarding_cubit/on_boarding_cubit_cubit.dart';

import 'package:voyago/feature/get_started/presentation/views/widgets/get_started_body.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocProvider<OnBoardingCubitCubit(

      create: (context) => SubjectBloc(),
      child: Scaffold(
         body: GetStartedBody(),
    
        ),
    );
  }
}

