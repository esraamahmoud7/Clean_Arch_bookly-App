import '../../domain/Entities/BookEntity.dart';

abstract class HomeLocalDataSource
{
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();

}