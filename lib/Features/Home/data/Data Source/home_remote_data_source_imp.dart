import 'package:clean_arc_bokkly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../../../core/functions/save_data_source.dart';
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

    SaveData(books,KFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async{
    var data = await apiServices.get(endPoint: "volumes?Filtering=free&Sorting=newest&q=subject:programming");

    List<BookEntity> books = ExtractBooksList(data);

    SaveData(books,KNewestBox);

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