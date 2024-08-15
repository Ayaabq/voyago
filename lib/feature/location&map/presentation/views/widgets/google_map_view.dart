import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/location&map/data/repo/location_repo_impl.dart';
import 'package:voyago/feature/location&map/presentation/manager/addres_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/over_view_card/icon_text_view.dart';

import '../../../data/repo/location_repo.dart';
import '../../manager/location_cubit.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key, required this.lat, required this.long});
  final double lat;
  final double long;

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}
class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;
  late String address;
  Set<Marker>markers={};
  initMarkers(){
    var myMarker= Marker(markerId: MarkerId("1",),
    position: LatLng(widget.lat, widget.long),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet));
    markers.add(myMarker);
  }

  @override
  void initState() {
    initialCameraPosition=CameraPosition(
        target:
        LatLng(widget.lat, widget.long),
        zoom: 9,);
      initMarkers();
    super.initState();
  }
  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    context.read<AddressCubit>().fetchLocation(widget.lat, widget.long);

    return
     Column(

       children: [
         SizedBox(
           height: ScreenSizeUtil.dynamicHeight(0.8),
           child: GoogleMap(
             markers: markers,
             onMapCreated: (controller){
               googleMapController=controller;
             },
              initialCameraPosition: initialCameraPosition
               ),
         ),
              SizedBox(height: 16,),
         BlocBuilder<AddressCubit, String>(builder:
             (context, state){
           return Center(
               child: IconText(
             isLast: true,
             icon: Iconsax.location,
             title: state,
           textStyle: Styles.textStyle14W600,));
             })

       ],
     );
  }
}
//0-> 3
// 4->6
//10->12
//13->17
