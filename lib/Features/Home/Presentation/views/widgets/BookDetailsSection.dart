import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../domain/Entities/BookEntity.dart';
import 'BookRate.dart';
import 'BooksAction.dart';
import 'CustomAppBarBookDetails.dart';
import 'CustomBookImage.dart';


class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SafeArea(child: CustomAppBarBookDetails()),
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width *.2),
          child: BookImageItem(book: BookEntity(bookId: '', image: '', title: '', authorName: '', price: 5, rating: 5),),
        ),
        SizedBox(height: 43,),
        Text("The Jungle Book" ,  style:Styles.textStyle30.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height:6 ,),
        Opacity(
          opacity: .7,
          child: Text("Rudyard Kipling" ,
              style:Styles.textStyle20.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500
              )),
        ),
        const SizedBox(height: 5,),
        BookRate(mainAxisAlignment: MainAxisAlignment.center,),
        const SizedBox(height: 20,),
        const BooksAction(),
      ],
    );
  }
}




