import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/AppRouters.dart';
import '../../../../../core/utils/assets.dart';
import 'bestSeller_BookDataCard.dart';


class BestSellerCard extends StatelessWidget {
  const BestSellerCard({super.key});

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
                  aspectRatio: 2.5/4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(AssetsData.testImage)
                        )
                    ),
                  ),
              ),
              SizedBox(width: 30,),
              BookDataCard()
            ],
          ),
      ),
    );
  }
}
