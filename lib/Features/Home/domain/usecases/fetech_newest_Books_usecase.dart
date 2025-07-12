import 'package:clean_arc_bokkly_app/Features/Home/domain/Repos/HomeRepo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../Entities/BookEntity.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>,int>
{
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);
  Future<Either<Failure,List<BookEntity>>> call([int pageNumber = 0]) async{

    return await homeRepo.fetchNewestBooks(
      pageNumber: pageNumber
    );

  }

}

