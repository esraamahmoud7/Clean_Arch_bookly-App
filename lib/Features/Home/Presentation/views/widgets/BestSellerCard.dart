import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/AppRouters.dart';
import '../../../../../core/utils/assets.dart';
import 'bestSeller_BookDataCard.dart';


class BestSellerCard extends StatelessWidget {
  const BestSellerCard({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()
      {
        GoRouter.of(context).push(AppRouter.KBookDetails);
      },
      child: SizedBox(
        height:125 ,
          child: Row(
              children: [
              AspectRatio(
                  aspectRatio: 2.9/4,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        fit:BoxFit.fill,
                        imageUrl: book.image ??
                            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww."
                                "freepik.com%2Fpremium-vector%2Fno-photo-available-vector-icon-default-image-symbol-picture-coming-soon-web-site-mobile-app_"
                                "44214017.htm&psig=AOvVaw265gGKMP8FpXBVMze2Cm8A&ust=1752355620115000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMjMy"
                                "MTftY4DFQAAAAAdAAAAABAL",
                      ),
                  ),
              ),
              SizedBox(width: 30,),
              BookDataCard(book: book,)
            ],
          ),
      ),
    );
  }
}
