import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';

abstract class HomeRemoteDataSource
{
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();

}