import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'BestSellerListView.dart';
import 'CustomAppBar.dart';
import 'featured_list_view_bloc_builder.dart';
import 'newestListViewBlocBuilder.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: customAppBar(),
              ),
              FeaturedListViewBlocConsumer(),
              SizedBox(height: 50,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text("Best Seller", style: Styles.textStyle18,),
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(height: 15,),
              ),
            ],
          ),
        ),
        SliverFillRemaining(child: newestListViewBlocBuilder(),)
      ],
    );
  }
}



