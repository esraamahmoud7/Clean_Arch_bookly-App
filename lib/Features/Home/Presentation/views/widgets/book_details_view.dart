import 'package:flutter/material.dart';

import 'bookDetails_view_body.dart';

class bookDetailsView extends StatelessWidget {
  const bookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: bookDetailsViewBody(),
    );
  }
}
