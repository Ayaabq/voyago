import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/pages_cubit/pages_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.tripModel});
  final TripModel tripModel;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => PageCubit(),
    child: CheckoutViewBody(tripModel: tripModel),);
  }
}
