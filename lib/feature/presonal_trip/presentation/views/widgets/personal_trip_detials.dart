import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/helper/date_time_helper.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/presonal_trip/data/prev_model.dart';
import 'package:voyago/feature/presonal_trip/data/prev_overview_model.dart';
import 'package:voyago/feature/presonal_trip/presentation/views/widgets/add_event.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/itinerary_cubit/itinerary_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/over_view_card/icon_text_view.dart';

import '../../../../../core/utils/services_locater.dart';
import '../../../../trip&booking/data/repo/trip_details_repo/trip_details_repo_impl.dart';
import '../../../../trip&booking/presentation/views/maneger/itinerary_cubit/itinerary_cubit.dart';
import '../../../../trip&booking/presentation/views/maneger/trip_info_3_places_cubit/trip_info_3_places_cubit.dart';
import '../../../../trip&booking/presentation/views/widgets/itinerary/Itinerary_card.dart';
import '../../../../trip&booking/presentation/views/widgets/places_card.dart';

class PersonalTripDetails extends StatefulWidget {
  const PersonalTripDetails({super.key, required this.trip, required this.overview});
  final PrevTrip trip;
  final PrevOverview overview;
  @override
  State<PersonalTripDetails> createState() => _PersonalTripDetailsState();
}

class _PersonalTripDetailsState extends State<PersonalTripDetails> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Name '),
        backgroundColor: CustomColors.kMove[3],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonAuth(title: 'Add Event', onTap: () async{
          var manager=ItineraryCubit(getIt.get<TripDetailsRepoImp>());
          await manager.fetchTripsInitial(widget.trip.id,Confg.prevInfo2);
          showModalBottomSheet(context: context, builder: (context){

            if(manager.state is ItinerarySuccess) {
              return AddEvent(itineraryDays: (manager.state as ItinerarySuccess).itineraryDays);
            } else {
              return const Text("No Enternet");
            }
          });
        },),
      ),
      body: ListView(
        children:  [
           CustomCard(
            title: "Trip Name",
              content: Column(
            children: [

              IconText(icon: Iconsax.clock, title: "duration: ${widget.overview.duration}"),
              IconText(icon: Iconsax.calendar_tick, title: "Start date: ${DateTimeHelper.formatDateMMMDY(widget.overview.startDate)}"),
              IconText(icon: FontAwesomeIcons.pencil, title: "Note: ${widget.overview.notes}",
              isLast: true,)
            ],
          )),
          BlocProvider(
            create: (_) => ItineraryCubit(getIt.get<TripDetailsRepoImp>()),
            child: const ItineraryCard(id: 1,url: Confg.prevInfo2,),
          ),

          BlocProvider(
              create: (_) => TripInfo3PlacesCubit(getIt.get<TripDetailsRepoImp>()),
              child:  PlacesCard(id: 1,url: Confg.prevInfo1,)
          ),
          const SizedBox(height: 70,)
        ],
      ),
    );
  }
}
