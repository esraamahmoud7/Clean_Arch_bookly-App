import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';

abstract class HomeRemoteDataSource
{
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});

}