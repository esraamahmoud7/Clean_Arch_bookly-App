import 'package:clean_arc_bokkly_app/Features/Home/data/models/book_model/book_model.dart';

abstract class HomeRemoteDataSource
{
  Future<List<BookModel>> fetchFeaturedBooks();
  Future<List<BookModel>> fetchNewestBooks();

}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource
{
  @override
  Future<List<BookModel>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookModel>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}