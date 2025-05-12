
import 'package:flutter/material.dart';
import 'BookDetailsSection.dart';
import 'SimilarBooksSection.dart';

class bookDetailsViewBody extends StatelessWidget {
  const bookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25 ),
            child: Column(
              children: [
                BookDetailsSection(),
                Expanded(child: const SizedBox(height: 40)),
                SimilarBooksSection(),
                const SizedBox(height: 40,)
              ],
            ),
          );
  }
}