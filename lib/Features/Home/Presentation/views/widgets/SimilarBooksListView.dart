import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:flutter/material.dart';

import 'CustomBookImage.dart';

class similarBooksListView extends StatelessWidget {
  const similarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context,index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BookImageItem(book: BookEntity(bookId: "bookId", image: "image", title: "title", authorName: "authorName", price: 50, rating: 3.5),),
          );
        },

      ),
    );
  }
}
