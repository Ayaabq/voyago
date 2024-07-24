import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/widgets/shimmer/load_base.dart';
import 'package:voyago/feature/place/presentaion/manager/place_info_section_cubit/place_info_cubit.dart';
import 'package:voyago/feature/place/presentaion/manager/place_info_section_cubit/place_info_section_state.dart';
import 'package:voyago/feature/place/presentaion/views/widgets/place_details.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_card.dart';
import '../../../../../core/widgets/custom_failure_error.dart';

class PlaceInfoSection extends StatelessWidget {
  const PlaceInfoSection({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    context.read<PlaceInfoCubit>().fetchTripDetailsInfo1(url);
    return BlocBuilder<PlaceInfoCubit, PlaceInfoSectionState>(builder: (context, state)
    {
      if(state is PlaceInfoSectionSuccess) {
       final place= state.placeModel;
        return  Column(
        children: [
          CustomCard(content:PlaceDetails(placeModel: place,),
            title: place.name,
            titleStyle: Styles.textStyle24W900,),
          CustomCard(content:
          Text(
              place.description),
            title: "Description",

          ),
        ],
      );
      } else if (state is PlaceInfoSectionFailure) {
        return CustomFailureError(errMessage: state.errorMessage);
      }
      else{
        return const LoadBase(
          child: Column(
            children: [

              CustomCard(content:
              Text("The Top of the Rock "
                  "Observation Deck offers 360-degree views of the iconic Manhattan skyline from 70 floors above Rockefeller Center. Visitors can take in sweeping vistas of Central Park, the Hudson River, and the city's famous landmarks from the expansive outdoor decks. As a popular attraction for both tourists and locals, the observation deck provides an unparalleled elevated perspective to experience the grandeur of New York City."),
                title: "Description",

              ),  CustomCard(content:
              Text("The Top of the Rock "
                  "Observation Deck offers 360-degree views of the iconic Manhattan skyline from 70 floors above Rockefeller Center. Visitors can take in sweeping vistas of Central Park, the Hudson River, and the city's famous landmarks from the expansive outdoor decks. As a popular attraction for both tourists and locals, the observation deck provides an unparalleled elevated perspective to experience the grandeur of New York City."),
                title: "Description",

              ),
            ],
          ),
        );
      }
    }
    );
  }
}
