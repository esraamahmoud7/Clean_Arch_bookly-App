import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class BookImageItem extends StatelessWidget {
  const BookImageItem({super.key});


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6/4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            fit: BoxFit.fill,
              image: AssetImage(AssetsData.testImage)
          )
        ),
      ),
    );
  }
}
