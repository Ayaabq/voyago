import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/place/presentaion/views/widgets/place_info_section.dart';

import '../../../../../core/utils/services_locater.dart';
import '../../../data/repo/place_reop.dart';
import '../../manager/place_info_section_cubit/place_info_cubit.dart';

class PlaceInfoView extends StatelessWidget {
  const PlaceInfoView({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaceInfoCubit(getIt.get<PlaceRepoImp>()),
        child: PlaceInfoSection(url: url,),
    );
  }
}
