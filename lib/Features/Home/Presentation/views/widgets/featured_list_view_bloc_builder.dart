import 'package:clean_arc_bokkly_app/Features/Home/Presentation/views/widgets/featured_list_view_loading_indicator.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/featured cubit/featured_books_cubit.dart';
import 'BooksListView.dart';

class FeaturedListViewBlocConsumer extends StatefulWidget {
  const FeaturedListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedListViewBlocConsumer> createState() => _FeaturedListViewBlocConsumerState();
}

class _FeaturedListViewBlocConsumerState extends State<FeaturedListViewBlocConsumer> {

  List<BookEntity> books =[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context,state)
      {
        if(state is FeaturedBooksSuccessful)
        {
          books.addAll(state.books);
        }
        if(state is FeaturedBooksPaginationFailure)
          {
            ScaffoldMessenger.of(context).showSnackBar(
                BuildErrorWidget(state)
            );
          }
      },
      builder: (context, state) {
        if(state is FeaturedBooksSuccessful ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure
        )
          {
            return CardListView(books: books);
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
            return FeaturedListViewLoadingIndicator();
          }
      },
    );
  }

  SnackBar BuildErrorWidget(FeaturedBooksPaginationFailure state) {
    return SnackBar(
                content: Text(
                    state.message,
                  style:const TextStyle(
                    color: Colors.black
                  ),
                ),
                duration: const Duration(seconds: 3),
              );
  }
}