import 'package:clean_arc_bokkly_app/Features/Home/data/Data%20Source/home_local_data_source.dart';
import 'package:clean_arc_bokkly_app/Features/Home/data/Data%20Source/home_remote_data_source.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';

import 'package:clean_arc_bokkly_app/core/errors/Failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/Repos/HomeRepo.dart';

class HomeRepoImp extends HomeRepo
{
  HomeRemoteDataSource homeRemoteDataSource;
  HomeLocalDataSource homeLocalDataSource;

  HomeRepoImp({required this.homeRemoteDataSource,required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async{

    try{
      List<BookEntity> booksList = homeLocalDataSource.fetchFeaturedBooks();

      if (booksList.isNotEmpty)
        {
          return right(booksList);
        }
      List<BookEntity> books = await homeRemoteDataSource.fetchFeaturedBooks();

      return right(books);
    }
    on Exception catch(e)
    {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks()async {
    try{
      List<BookEntity> booksList = homeLocalDataSource.fetchNewestBooks();

      if (booksList.isNotEmpty)
      {
        return right(booksList);
      }
      List<BookEntity> books = await homeRemoteDataSource.fetchNewestBooks();

      return right(books);
    }
    on Exception catch(e)
    {
      return left(Failure());
    }
  }

}