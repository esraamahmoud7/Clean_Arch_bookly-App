import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:flutter/material.dart';

import 'CustomBookImage.dart';

class CardListView extends StatelessWidget {
  const CardListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context,index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BookImageItem(book: books[index],),
          );
        },

      ),
    );
  }
}
