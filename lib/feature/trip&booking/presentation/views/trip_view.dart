import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/floating_book_button.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trip_view_body.dart';

import 'widgets/transparent_app_bar.dart';

class TripView extends StatefulWidget {
  const TripView({super.key});

  @override
  State<TripView> createState() => _TripViewState();
}

class _TripViewState extends State<TripView> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  // final List<String> _sections = ["Section 1", "Section 2", "Section 3"];
  bool _showTabs = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && !_showTabs) {
        setState(() {
          _showTabs = true;
        });
      } else if (_scrollController.offset == 0 && _showTabs) {
        setState(() {
          _showTabs = false;
        });
        setState(() {

        });
      }
      final sectionHeight = 800.0;
      int sectionIndex =0;
      if(_scrollController.offset <1200)
        sectionIndex=0;
      else if(_scrollController.offset <2400)
        sectionIndex=1;
      else
        sectionIndex=2;
      _tabController.animateTo(sectionIndex);
      if (sectionIndex != _tabController.index) {
        _tabController.animateTo(sectionIndex);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  void _scrollToSection(int index) {
    final sectionHeight = 1200.0;
    final offset = index * sectionHeight;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingBookButton(),
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(
        title:  "Berlin: 3-Hours City Tour by Boat" ,

        showTabs: _showTabs,
        tabController: _tabController,
        onTap: (int index) {
         _scrollToSection(index);
        },),
      body:  TripViewBody(
        controller: _scrollController,

      ),
    );
  }
}
