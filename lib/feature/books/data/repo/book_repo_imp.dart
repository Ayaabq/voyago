import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/books/data/repo/book_repo.dart';
import 'package:voyago/feature/books/presentation/manger/books_cubit/books_cubit_state.dart';

import '../../../../core/domain/services/api.dart';
import '../../../../core/utils/confg.dart';
import '../../../wallet/presentation/manger/history_wallet/cubit/history_wallet_state.dart';
import '../../presentation/manger/detiles_book/cubit/detiles_book_cubit_state.dart';

class BooksImpl implements BooksRepo {
  final ApiServices api;

  BooksImpl(this.api);

  ///************      get books             ************* */
  @override
  Future<Either<Failure, BooksSuccess>> getBooks() async {
    try {
      var response = await api.get(Confg.mybooks, hasToken: true);
      return right(BooksSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
  


////***************    books detiles                 *************** */
  @override
  Future<Either<Failure, BookDetilesSuccess>> getBooksDetiles(String url) async{
  
    try {
      var response = await api.get(url, hasToken: true);
      return right(BookDetilesSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
  
  }






