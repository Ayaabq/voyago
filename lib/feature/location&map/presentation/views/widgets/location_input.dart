import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/location&map/data/repo/location_repo.dart';
import 'package:voyago/feature/location&map/presentation/manager/addres_cubit.dart';
import 'package:voyago/feature/location&map/presentation/map_screen.dart';
import 'package:voyago/feature/location&map/presentation/views/widgets/google_map_view.dart';
import '../../manager/location_cubit.dart';
import '../../manager/location_state.dart';



class LocationInput extends StatelessWidget {
  const LocationInput({super.key, required this.lat, required this.long, required this.title});
  final double lat;
  final double long;
  final String title;
  @override
  Widget build(BuildContext context) {
    return    WillPopScope(
      onWillPop: () async{
        LocationCubit.placeLat=null;
        LocationCubit.placeLong=null;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text(title),
        backgroundColor:
        CustomColors.kMove[2],
        ),
        body:BlocProvider(
          create: (BuildContext context) => AddressCubit(getIt.get<LocationRepo>()),
        child:  CustomGoogleMap(lat: lat, long: long,),),
      ),
    );
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
