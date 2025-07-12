import 'package:clean_arc_bokkly_app/Features/Home/Presentation/manager/newest%20cubit/newest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BestSellerListView.dart';


class newestListViewBlocBuilder extends StatelessWidget {
  const newestListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestCubit, NewestState>(
      builder: (context, state) {
        if(state is NewestSuccessful)
        {
          return BestSellerListView(books: state.books,);

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
}
