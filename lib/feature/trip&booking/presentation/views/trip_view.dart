import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trip_view_body.dart';

import 'widgets/transparent_app_bar.dart';

class TripView extends StatelessWidget {
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(),
      body: TripViewBody(

      ),
    );
  }
}
