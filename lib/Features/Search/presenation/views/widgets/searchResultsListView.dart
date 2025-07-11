import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:flutter/material.dart';

import '../../../../Home/Presentation/views/widgets/BestSellerCard.dart';

class Searchresultslistview extends StatelessWidget {
  const Searchresultslistview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount:10 ,
        itemBuilder: (context,index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: BestSellerCard(book: BookEntity(bookId: "bookId", image: "image", title: "title", authorName: "authorName", price: 5, rating: 5),),
          );
        });
  }
}
