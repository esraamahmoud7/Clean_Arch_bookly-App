import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:clean_arc_bokkly_app/core/errors/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0});
  Future<Either<Failure,List<BookEntity>>> fetchNewestBooks({int pageNumber = 0});

}