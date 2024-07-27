import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/pages_cubit/page_state.dart';


class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageInitial());
  int imageIndex = 0;



  void setPage(int index) {
    imageIndex =index;
        emit(PageChangeState());

  }
}
