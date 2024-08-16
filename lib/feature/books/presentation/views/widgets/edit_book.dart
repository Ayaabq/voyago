import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/services_locater.dart';
import '../../../../trip&booking/data/repo/trip_details_repo/trip_details_repo_impl.dart';
import '../../../../trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';
import '../../../../trip&booking/presentation/views/maneger/optional_choices_cubit/optional_choices_cubit.dart';
import '../../../data/models/books_model.dart';
import '../../../data/models/detiles_books.dart';
import 'edit_book_body.dart';

class EditBook extends StatelessWidget {
  const EditBook({super.key, required this.tripData, required this.tripId});
  final TripDataDD tripData;
  final int tripId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => CheckoutCubit(getIt.get<TripDetailsRepoImp>()),
              ),
              BlocProvider(
                create: (_) =>
                    OptionalEventsCubit(getIt.get<TripDetailsRepoImp>()),
              ),
              //TODO غيري الأي دي للأيدي اللي عم يرجع مع الديتيلز
            ],
            child:  EditBookBody(
              tripID: tripId, tripData: tripData,
            )));
  }
}
