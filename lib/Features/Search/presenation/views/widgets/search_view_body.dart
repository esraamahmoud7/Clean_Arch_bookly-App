import 'package:clean_arc_bokkly_app/Features/Search/presenation/views/widgets/search_bar.dart';
import 'package:clean_arc_bokkly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../Home/Presentation/views/widgets/BestSellerListView.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore",
          style: TextStyle(
              // color: AppColors.primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        child: Column(
          children: [
            Search(),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Search Results ...",
                style: Styles.textStyle18,
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: BestSellerListView(books: [],),
            )

          ],
        ),
      ),
    );
  }
}
