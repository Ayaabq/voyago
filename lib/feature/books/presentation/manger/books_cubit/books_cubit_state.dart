import 'package:voyago/feature/books/data/models/books_model.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}



class BooksSuccess extends BooksState {
  final List<BooksModel> model;

  BooksSuccess(this.model);
  @override
  List<Object?> get props => [model];
  static BooksSuccess fromJson(Map<String, dynamic> response) {
    final bookss = (response['data'] as List)
    .map((e) => BooksModel.fromJson(e))
    .toList();
    return BooksSuccess(bookss);
  }
}


class BooksFailure extends BooksState {
  final String errorMessage;
  BooksFailure(this.errorMessage);

static BooksFailure fromJson(Map<String, dynamic> response) {
    return BooksFailure(response['err'],);
  }
}
