import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class BookImageItem extends StatelessWidget {
  const BookImageItem({super.key, required this.book});

  final BookEntity book;


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6/4,
      child: ClipRRect(
        borderRadius:BorderRadius.circular(16) ,
        child: CachedNetworkImage(
            imageUrl: book.image ?? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Fpremium-vector%2Fno-photo-available-vector-icon-default-image-symbol-picture-coming-soon-web-site-mobile-app_44214017.htm&psig=AOvVaw265gGKMP8FpXBVMze2Cm8A&ust=1752355620115000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMjMyMTftY4DFQAAAAAdAAAAABAL",
            fit: BoxFit.fill,
        ),
      ),
    );
  }
}

// Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(16),
// image: DecorationImage(
// fit: BoxFit.fill,
// image: Image.network(book.image)
// )
// ),
// ),
