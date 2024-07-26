import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/location&map/presentation/map_screen.dart';
import '../../manager/location_cubit.dart';
import '../../manager/location_state.dart';



class LocationInput extends StatelessWidget {
  const LocationInput({super.key});

  @override
  Widget build(BuildContext context) {
    return  MapScreen();
    //   Scaffold(
    //   body: Column(
    //     children: [
    //
    //       Container(
    //         height: 170,
    //         width: double.infinity,
    //         alignment: Alignment.center,
    //         decoration: BoxDecoration(
    //             border: Border.all(
    //                 width: 1,
    //                 color: Theme.of(context).colorScheme.primary.withOpacity(0.2))),
    //         child: BlocBuilder<LocationCubit, LocationState>(
    //           builder: (context, state) {
    //             if (state is LocationLoading) {
    //               return const CircularProgressIndicator();
    //             } else if (state is LocationLoaded) {
    //               return Text(
    //                 'Location: (${state.locationData.latitude}, ${state.locationData.longitude})',
    //                 textAlign: TextAlign.center,
    //                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
    //                     color: Theme.of(context).colorScheme.onSurface),
    //               );
    //             } else if (state is LocationError) {
    //               return Text(
    //                 state.message,
    //                 textAlign: TextAlign.center,
    //                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
    //                     color: Theme.of(context).colorScheme.onSurface),
    //               );
    //             } else {
    //               return Text(
    //                 "No location chosen",
    //                 textAlign: TextAlign.center,
    //                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
    //                     color: Theme.of(context).colorScheme.onSurface),
    //               );
    //             }
    //           },
    //         ),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           TextButton.icon(
    //             onPressed: () {
    //             },
    //             icon: const Icon(Icons.location_on),
    //             label: const Text("Get current location"),
    //           ),
    //           TextButton.icon(
    //             onPressed: () {},
    //             icon: const Icon(Icons.map),
    //             label: const Text("Select on map"),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
