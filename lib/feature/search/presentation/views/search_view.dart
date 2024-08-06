import 'package:flutter/material.dart';
import 'package:voyago/feature/search/presentation/views/widgets/search_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SearchBodyView(type: type,));
  }
}
