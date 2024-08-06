import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/services_locater.dart';
import '../../../../data/repo/destination_repo_impl.dart';
import '../../../manager/destination_cubit/destination_cubit.dart';
import 'destination_list.dart';

class DestinationsView extends StatelessWidget {
  final String? url;
  final Key viewKey; // Add a unique key for each DestinationsView
  final bool? isFavorite;
  const DestinationsView({
    super.key,
     this.url,
    required this.viewKey, this.isFavorite, // Require the unique key
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: viewKey, // Pass the key to BlocProvider
      create: (context) => DestinationCubit(getIt.get<DestinationRepoImp>()),
      child: DestinationListView(url: url),
    );
  }
}
