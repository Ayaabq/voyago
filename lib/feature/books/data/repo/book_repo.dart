import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../../presentation/manger/books_cubit/books_cubit_state.dart';
import '../../presentation/manger/detiles_book/cubit/detiles_book_cubit_state.dart';

abstract class BooksRepo {
Future<Either<Failure,BooksSuccess>> getBooks();
Future<Either<Failure,BookDetilesSuccess>> getBooksDetiles(String url);
}
