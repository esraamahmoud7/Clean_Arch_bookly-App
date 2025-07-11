import 'package:bloc/bloc.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Repos/HomeRepo.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/fetch_Featured_Books_usecase.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {

  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks()async
  {
    emit(FeaturedBooksLoading());


    var result = await featuredBooksUseCase.call();


    result.fold(
            (failure)=>{
              emit(FeaturedBooksFailure(failure.message))
            },
            (books)=>{
              emit(FeaturedBooksSuccessful(books))
            });
  }
}
