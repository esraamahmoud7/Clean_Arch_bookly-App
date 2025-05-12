import 'package:clean_arc_bokkly_app/Features/Home/domain/Repos/HomeRepo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';
import '../Entities/BookEntity.dart';

class FetchFeaturedBooksUseCase
{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks(){

    return homeRepo.fetchFeaturedBooks();

  }

}