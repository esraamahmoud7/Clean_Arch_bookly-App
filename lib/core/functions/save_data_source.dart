import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../Features/Home/domain/Entities/BookEntity.dart';

void SaveData(List<BookEntity> books, String boxName) {
  try {
    final box = Hive.box<BookEntity>(boxName);
    box.addAll(books);
  } catch (e) {
    debugPrint("Error saving data to $boxName: $e");
  }
}