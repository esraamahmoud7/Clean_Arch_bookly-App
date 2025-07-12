import 'package:clean_arc_bokkly_app/core/widgets/customFading.dart';
import 'package:flutter/material.dart';
import 'custom_Book_Image_Loading_Indecator.dart';

class FeaturedListViewLoadingIndicator extends StatelessWidget {
  const FeaturedListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context,index)
          {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomBookImageLoadingIndecator(),
            );
          },
      
        ),
      ),
    );
  }
}
