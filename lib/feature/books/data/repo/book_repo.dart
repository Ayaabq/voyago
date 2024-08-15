import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../../presentation/manger/books_cubit/books_cubit_state.dart';

abstract class BooksRepo {
Future<Either<Failure,BooksSuccess>> getBooks();

}
