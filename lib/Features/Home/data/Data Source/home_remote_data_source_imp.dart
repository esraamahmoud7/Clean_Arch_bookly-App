import '../../../../core/utils/APIServices.dart';
import '../../domain/Entities/BookEntity.dart';
import '../models/book_model/book_model.dart';
import 'home_remote_data_source.dart';

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

  @override
  Future<List<BookEntity>> fetchNewestBooks() async{
    var data = await apiServices.get(endPoint: "volumes?Filtering=free&Sorting=newest&q=subject:programming");

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

}