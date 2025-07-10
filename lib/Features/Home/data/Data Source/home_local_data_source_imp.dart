


import 'package:clean_arc_bokkly_app/Features/Home/data/Data%20Source/home_local_data_source.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:clean_arc_bokkly_app/constants.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImp extends HomeLocalDataSource
{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(KFeaturedBox);

    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(KNewestBox);

    return box.values.toList();
  }

}