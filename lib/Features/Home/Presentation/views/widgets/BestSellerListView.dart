import 'package:flutter/material.dart';

import 'BestSellerCard.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount:10 ,
        itemBuilder: (context,index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: BestSellerCard(),
          );
        });
  }
}