import 'package:flutter/material.dart';

import 'book_details_view.dart';

class customScrollBookDetailView extends StatelessWidget {
  const customScrollBookDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: bookDetailsView(),
        )
      ],
    );
  }
}
