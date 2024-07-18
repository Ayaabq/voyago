import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trips/trips_list_view.dart';
import '../../../../../../core/utils/services_locater.dart';
import '../../../../data/repo/trips_repo/trips_repo_impl.dart';
import '../../maneger/trips_cubit/trips_cubit.dart';

class TripsView extends StatelessWidget {
  final String url;
  final Key viewKey; // Add a unique key for each TripsView

  const TripsView({
    super.key,
    required this.url,
    required this.viewKey, // Require the unique key
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: viewKey, // Pass the key to BlocProvider
      create: (context) => TripsCubit(getIt.get<TripsRepoImp>()),
      child: TripsListView(url: url),
    );
  }
}
