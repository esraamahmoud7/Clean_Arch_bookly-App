import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';

abstract class HomeRepo{
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();

}