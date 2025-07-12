import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'BookRate.dart';

class BookDataCard extends StatelessWidget {
  const BookDataCard({
    super.key, required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*.5,
              child: Text(book.title,
                style: Styles.textStyle20.copyWith(fontFamily: kPT,fontSize: 22),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
          ),
          const SizedBox(height: 3,),
          Opacity(opacity: 0.7,child: Text(book.authorName ?? "No Name",style: Styles.textStyle16.copyWith(fontStyle: FontStyle.italic),)),
          SizedBox(height: 4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${book.price}\$",style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),),
              BookRate(mainAxisAlignment: MainAxisAlignment.end,rate: book.rating.toString(),)
            ],
          )
        ],
      ),
    );
  }
}
