import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/attraction/presentation/views/attractions/top_attraction_list_view.dart';

import '../../../../../core/utils/services_locater.dart';
import '../../../data/repo/attraction_repo_impl.dart';
import '../../manager/attractoin_cubit.dart'; // Fixed the typo in the import statement

class AttractionView extends StatelessWidget {
  final String url;
  final Key viewKey; // Add a unique key for each AttractionView

  const AttractionView({
    super.key,
    required this.url,
    required this.viewKey, // Require the unique key
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: viewKey, // Pass the key to BlocProvider
      create: (context) => AttractionCubit(getIt.get<AttractionRepoImp>()),
      child: AttractionListView(url: url),
    );
  }
}
