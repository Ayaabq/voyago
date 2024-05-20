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
    _tabController = TabController(length: 5, vsync: this);

    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && !_showTabs) {
        setState(() {
          _showTabs = true;
        });
      } else if (_scrollController.offset == 0 && _showTabs) {
        setState(() {
          _showTabs = false;
        });
      }
      final sectionHeight = 200.0 + (50.0 * 20);
      int sectionIndex = (_scrollController.offset / sectionHeight).round();
      // if(_scrollController.offset==500)
      //   sectionIndex=2;
      // Update the TabController's index
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
    final sectionHeight = 200.0 + (50.0 * 20); // Header height + content height per section
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
      appBar: TransparentAppBar(showTabs: _showTabs,
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
