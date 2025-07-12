


import 'package:clean_arc_bokkly_app/Features/Home/data/Data%20Source/home_local_data_source.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:clean_arc_bokkly_app/constants.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImp extends HomeLocalDataSource
{
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(KFeaturedBox);
    
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber+1) * 10 ;
    int length = box.values.length;
    if(startIndex >= length || endIndex > length)
      {
        return [];
      }

    return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(KNewestBox);
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber+1) * 10 ;
    int length = box.values.length;
    if(startIndex >= length || endIndex > length)
    {
      return [];
    }

    return box.values.toList().sublist(startIndex,endIndex);
  }

}