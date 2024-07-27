import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/floating_book_button.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trip_view_body.dart';

import 'widgets/transparent_app_bar.dart';

class TripView extends StatefulWidget {
  final TripModel tripModel;
  const TripView({super.key, required this.tripModel});

  @override
  State<TripView> createState() => _TripViewState();
}

class _TripViewState extends State<TripView> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  List <double> endPoints=[0,600,830,1100,1250,1800,2050,2300];
  bool _showTabs = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);

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
      // it: 1800-125=550
      // note: 2050-1800=250
      int sectionIndex =0;
      //overview
      if(_scrollController.offset <600) {
        sectionIndex=0;
      } else if(_scrollController.offset <830)
        sectionIndex=1;
      //what's included
      else if(_scrollController.offset <1100)
        sectionIndex=2;
      //meeting point
      else if(_scrollController.offset <1250)
        sectionIndex=3;
      else if(_scrollController.offset <1500)
        sectionIndex=4;
      else if(_scrollController.offset <2050)
        sectionIndex=5;
      else if(_scrollController.offset <2300)
        sectionIndex=6;

      else
        sectionIndex=7;
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
    const sectionHeight = 1200.0;
    _scrollController.animateTo(
      endPoints[index],
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  FloatingBookButton(trip: widget.tripModel,),
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(
        title:  widget.tripModel.name ,

        showTabs: _showTabs,
        tabController: _tabController,
        onTap: (int index) {
         _scrollToSection(index);
        },),
      body:  TripViewBody(
        id: widget.tripModel.id,
        controller: _scrollController,

      ),
    );
  }
}
