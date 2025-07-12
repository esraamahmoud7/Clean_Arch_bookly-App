import '../../domain/Entities/BookEntity.dart';

abstract class HomeLocalDataSource
{
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});

}