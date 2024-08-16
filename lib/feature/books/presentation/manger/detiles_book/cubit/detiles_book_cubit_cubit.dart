
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repo/book_repo.dart';
import 'detiles_book_cubit_state.dart';

class DetilesBooksCubit extends Cubit<DetilesBookState> {
  final BooksRepo repoBooks;

  DetilesBooksCubit( this.repoBooks) : super(BookDetilesInitial());

  Future<void> fetchDetilesBooks() async {

    emit(BookDetilesLoading());

    var result = await repoBooks.getBooksDetiles();
    result.fold(
          (failure)
      {

        emit( BookDetilesFailure(failure.errMessage));
      
      },
          (success) async {
        emit(BookDetilesSuccess(success.model));

      },
    );
  }


}
