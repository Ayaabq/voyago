import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/services_locater.dart';
import '../../../../data/repo/destination_repo_impl.dart';

import '../../../manager/destination_cubit/destination_cubit.dart';
import 'destination_list.dart';

class DestinationsView extends StatelessWidget {
  const DestinationsView({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => DestinationCubit(getIt.get<DestinationRepoImp>()),
      child: DestinationListView(url: url),
    );
  }
}
