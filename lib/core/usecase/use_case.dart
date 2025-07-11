import 'package:dartz/dartz.dart';

import '../errors/Failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}
class NoParam{}