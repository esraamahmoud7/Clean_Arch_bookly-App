import 'package:clean_arc_bokkly_app/Features/Search/presenation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SearchViewBody()

      ),
    );
  }
}
