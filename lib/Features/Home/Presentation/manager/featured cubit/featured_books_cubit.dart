import 'package:bloc/bloc.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Repos/HomeRepo.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/fetch_Featured_Books_usecase.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {

  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0})async
  {
    emit(FeaturedBooksLoading());
    if(pageNumber == 0)
    {
      emit(FeaturedBooksLoading());
    }
    else
    {
      emit(FeaturedBooksPaginationLoading());
    }


    var result = await featuredBooksUseCase.call(pageNumber);


    result.fold(
            (failure)=>{
              if(pageNumber == 0)
                {
                  emit(FeaturedBooksFailure(failure.message))

                }
              else
                {
                  emit(FeaturedBooksPaginationFailure(failure.message))

                }
            },
            (books)=>{
              emit(FeaturedBooksSuccessful(books))
            });
  }
}
