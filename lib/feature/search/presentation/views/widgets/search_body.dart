import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voyago/feature/home/presentation/views/widgets/background/custom_back_ground.dart';
import 'package:voyago/feature/search/presentation/views/widgets/back.dart';
import 'package:voyago/feature/search/presentation/views/widgets/search_elv.dart';

import '../../../../home/presentation/views/widgets/background/beckround_section.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
       
         BackgroundSectionSearch()

      ],
    );
  }
}
