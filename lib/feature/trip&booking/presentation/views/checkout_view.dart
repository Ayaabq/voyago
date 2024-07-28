import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/pages_cubit/pages_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/checkout_view_body.dart';

import '../../../../core/utils/services_locater.dart';
import '../../data/repo/trip_details_repo/trip_details_repo_impl.dart';
import 'maneger/checkout_cubit/checkout_cubit.dart';
import 'maneger/optional_choices_cubit/optional_choices_cubit.dart';
import 'maneger/trip_info_2_cubit/trip_info_2_cubit.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.tripModel});
  final TripModel tripModel;
  @override
  Widget build(BuildContext context) {
    return
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TripInfo2Cubit(getIt.get<TripDetailsRepoImp>()),
        ),
        BlocProvider(
          create: (_) => CheckoutCubit(getIt.get<TripDetailsRepoImp>()),
        ),
        BlocProvider(
          create: (_) => OptionalEventsCubit(getIt.get<TripDetailsRepoImp>()),
        ),
        BlocProvider(
          create: (_) => PageCubit(), )
      ],
      child: CheckoutViewBody(tripModel: tripModel),
    );
  }
}
