import 'package:bloc/bloc.dart';

import 'package:voyago/feature/books/data/repo/book_repo.dart';
import 'package:voyago/feature/books/presentation/manger/books_cubit/books_cubit_state.dart';



class BooksCubit extends Cubit<BooksState> {
  final BooksRepo repoBooks;

  BooksCubit( this.repoBooks) : super(BooksInitial());

  Future<void> fetchBooks() async {

    emit(BooksLoading());

    var result = await repoBooks.getBooks();
    result.fold(
          (failure)
      {

        emit( BooksFailure(failure.errMessage));
      
      },
          (success) async {
        emit(BooksSuccess(success.model));

      },
    );
  }


}
