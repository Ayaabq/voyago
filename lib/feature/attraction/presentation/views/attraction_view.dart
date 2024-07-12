import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/attraction/presentation/views/top_attraction_list_view.dart';

import '../../../../core/utils/services_locater.dart';
import '../../data/repo/attraction_repo_impl.dart';
import '../manager/attractoin_cubit.dart';

class AttractionView extends StatelessWidget {
  const AttractionView({super.key, required this.url});
    final String url;
  @override
  Widget build(BuildContext context) {
    return BlocProvider( create: (context) => AttractionCubit(getIt.get<AttractionRepoImp>(),
    ),
      child: AttractionListView(url: url,),
    );
  }
}
