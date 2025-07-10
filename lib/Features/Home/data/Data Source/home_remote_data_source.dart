import 'package:clean_arc_bokkly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:clean_arc_bokkly_app/core/utils/APIServices.dart';

abstract class HomeRemoteDataSource
{
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();

}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource
{

  final APIServices apiServices;

  HomeRemoteDataSourceImp(this.apiServices);


  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async{
    var data = await apiServices.get(endPoint: "volumes?Filtering=free&q=subject:programming");

    List<BookEntity> books = ExtractBooksList(data);

    return books;
  }

  List<BookEntity> ExtractBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    for(var bookMap in data["items"])
      {
        books.add(BookModel.fromJson(bookMap));
      }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async{
    var data = await apiServices.get(endPoint: "volumes?Filtering=free&q=subject:programming");

    List<BookEntity> books = ExtractBooksList(data);

    return books;
  }

}