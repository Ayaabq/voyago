import 'package:flutter/material.dart';
import 'package:voyago/feature/search/presentation/views/widgets/search_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SearchBodyView());
  }
}
