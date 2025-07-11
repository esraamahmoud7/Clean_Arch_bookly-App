part of 'newest_cubit.dart';

@immutable
sealed class NewestState {}

final class NewestInitial extends NewestState {}
final class NewestLoading extends NewestState {}
final class NewestSuccessful extends NewestState {
  final List<BookEntity> books;
  NewestSuccessful(this.books);
}
final class NewestFailure extends NewestState {
  final String message;

  NewestFailure(this.message);
}

