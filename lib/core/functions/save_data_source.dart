import 'package:hive/hive.dart';

import '../../Features/Home/domain/Entities/BookEntity.dart';

void SaveData(List<BookEntity> books, String boxName) {
  var box = Hive.box(boxName);
  box.addAll(books);
}