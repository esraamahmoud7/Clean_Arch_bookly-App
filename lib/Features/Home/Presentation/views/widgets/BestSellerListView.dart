import 'package:clean_arc_bokkly_app/Features/Home/Presentation/manager/newest%20cubit/newest_cubit.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BestSellerCard.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {

  var nextPage = 1;
  late final ScrollController _scrollController;
  bool isLoading = false;

  @override
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
        await BlocProvider.of<NewestCubit>(context).fetchNewestBooks(pageNumber: nextPage);
        nextPage ++;
        isLoading = false;
      }

    }
  }

  @override
  void dispose()
  {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
        padding: EdgeInsets.zero,
        itemCount:widget.books.length ,
        itemBuilder: (context,index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: BestSellerCard(book: widget.books[index],),
          );
        });
  }
}