import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/featured cubit/featured_books_cubit.dart';
import 'BooksListView.dart';

class FeaturedListViewBlocBuilder extends StatelessWidget {
  const FeaturedListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccessful)
          {
            return CardListView(books: state.books,);
          }
        else if(state is FeaturedBooksFailure)
          {
            return Text(state.message,style:
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            );
          }
        else
          {
            return CircularProgressIndicator();
          }
      },
    );
  }
}