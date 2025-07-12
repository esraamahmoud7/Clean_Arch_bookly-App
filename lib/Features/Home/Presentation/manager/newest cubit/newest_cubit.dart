import 'package:bloc/bloc.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/fetech_newest_Books_usecase.dart';

part 'newest_state.dart';

class NewestCubit extends Cubit<NewestState> {

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  NewestCubit(this.fetchNewestBooksUseCase) : super(NewestInitial());

  Future<void> fetchNewestBooks({int pageNumber = 0})async
  {
    if(pageNumber == 0)
      {
        emit(NewestLoading());
      }
    else
      {
        emit(NewestPaginationLoading());
      }
    var result = await fetchNewestBooksUseCase.call(pageNumber);

    result.fold(
            (failure)=>{
              if(pageNumber==0)
                {
                  emit(NewestFailure(failure.message))
                }
              else
                {
                  emit(NewestPaginationFailure(failure.message))
                }
            },
            (books)=>{
              emit(NewestSuccessful(books))
            });
  }
}
