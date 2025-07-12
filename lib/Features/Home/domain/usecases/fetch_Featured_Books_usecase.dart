import 'package:clean_arc_bokkly_app/Features/Home/domain/Repos/HomeRepo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../Entities/BookEntity.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,int>
{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);
  Future<Either<Failure,List<BookEntity>>> call([int param = 0]) async{

    return await homeRepo.fetchFeaturedBooks(
      pageNumber: param
    );

  }

}



