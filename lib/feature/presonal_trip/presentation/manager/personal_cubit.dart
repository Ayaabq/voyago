import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voyago/feature/presonal_trip/presentation/manager/personal_state.dart';

import '../../../attraction/data/models/attraction_model.dart';
import '../../../destination/data/models/destination_model.dart';
import '../../data/personal_trip_model.dart';
import '../../data/repo/personatl_trip_repo.dart';


class PersonalTripCubit extends Cubit<PersonalTripState> {
  PersonalTripModel personalTrip;

  PersonalTripCubit()
      : personalTrip = PersonalTripModel(
    name: '',
    notes: '',
    duration: 0,
    startDate: DateTime.now(),
    destination: DestinationModel(id: 0, name: '',  image: '', isFavourite: false),
    attractions: [],
  ),
        super(PersonalTripInitial());

  void updateName(String name) {
    personalTrip.name = name;
    emit(PersonalTripUpdated(personalTrip));
  }

  void updateNotes(String notes) {
    personalTrip.notes = notes;
    emit(PersonalTripUpdated(personalTrip));
  }

  void updateDuration(int duration) {
    personalTrip.duration = duration;
    emit(PersonalTripUpdated(personalTrip));
  }

  void updateStartDate(DateTime startDate) {
    personalTrip.startDate = startDate;
    emit(PersonalTripUpdated(personalTrip));
  }

  void updateDestination(DestinationModel destination) {
    personalTrip.destination = destination;
    emit(PersonalTripUpdated(personalTrip));
  }

  void updateAttractions(List<AttractionModel> attractions) {
    personalTrip.attractions = attractions;
    emit(PersonalTripUpdated(personalTrip));
  }
  Future<String> addTrip()async{
   var res= await PersonatlTripRepo().submitCheckout(personalTrip);
   String e="Unknown";
   res.fold((f){
     e= f.errMessage;
   }, (t){
     e= t;
   });
   return e;
  }
  }
