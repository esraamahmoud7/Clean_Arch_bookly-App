import 'package:clean_arc_bokkly_app/Features/Home/Presentation/manager/featured%20cubit/featured_books_cubit.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CustomBookImage.dart';

class CardListView extends StatefulWidget {
  const CardListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<CardListView> createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  var nextPage = 1;
  late final ScrollController _scrollController;
  bool isLoading = false;

  void initState()
  {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async
  {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if(currentPosition >= 0.7 * maxScrollLength)
      {
        if(!isLoading)
          {
            isLoading = true;
            await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(pageNumber: nextPage);
            nextPage ++;
            isLoading = false;
          }

      }
  }

  void dispose()
  {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context,index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BookImageItem(book: widget.books[index],),
          );
        },

      ),
    );
  }
}
