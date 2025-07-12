import 'package:clean_arc_bokkly_app/Features/Home/Presentation/manager/featured%20cubit/featured_books_cubit.dart';
import 'package:clean_arc_bokkly_app/Features/Home/Presentation/manager/newest%20cubit/newest_cubit.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BestSellerListView.dart';


class newestListViewBlocBuilder extends StatefulWidget {
  const newestListViewBlocBuilder({
    super.key,
  });

  @override
  State<newestListViewBlocBuilder> createState() => _newestListViewBlocBuilderState();
}

class _newestListViewBlocBuilderState extends State<newestListViewBlocBuilder> {

  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestCubit, NewestState>(
      listener: (context,state)
        {
          if(state is NewestSuccessful)
          {
            books.addAll(state.books);
          }
          if(state is NewestPaginationFailure)
          {
            ScaffoldMessenger.of(context).showSnackBar(
                BuildErrorWidget(state)
            );
          }
        },
      builder: (context, state) {
        if(state is NewestSuccessful ||
            state is NewestPaginationLoading||
            state is NewestPaginationFailure
        )
        {
          return BestSellerListView(books: books,);
        }
        else if(state is NewestFailure)
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
  SnackBar BuildErrorWidget(NewestPaginationFailure state) {
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

