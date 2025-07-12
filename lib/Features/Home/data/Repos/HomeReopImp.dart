import 'package:clean_arc_bokkly_app/Features/Home/data/Data%20Source/home_local_data_source.dart';
import 'package:clean_arc_bokkly_app/Features/Home/data/Data%20Source/home_remote_data_source.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';

import 'package:clean_arc_bokkly_app/core/errors/Failure.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/Repos/HomeRepo.dart';

class HomeRepoImp extends HomeRepo
{
  HomeRemoteDataSource homeRemoteDataSource;
  HomeLocalDataSource homeLocalDataSource;

  HomeRepoImp({required this.homeRemoteDataSource,required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0}) async{

    try{
      List<BookEntity> booksList = homeLocalDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber
      );

      if (booksList.isNotEmpty)
        {
          return right(booksList);
        }
      List<BookEntity> books = await homeRemoteDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber
      );


      return right(books);
    }
    on Exception catch(e)
    {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber = 0})async {
    try{
      List<BookEntity> booksList = homeLocalDataSource.fetchNewestBooks(
        pageNumber: pageNumber
      );

      if (booksList.isNotEmpty)
      {
        return right(booksList);
      }
      List<BookEntity> books = await homeRemoteDataSource.fetchNewestBooks(
        pageNumber: pageNumber
      );

      return right(books);
    }
    on Exception catch(e)
    {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}