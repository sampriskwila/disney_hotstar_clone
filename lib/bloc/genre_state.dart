part of 'genre_bloc.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

class GenreLoading extends GenreState {
  @override
  List<Object> get props => [];
}

class GenreLoaded extends GenreState {
  final List<Genre> genres;

  const GenreLoaded(this.genres);

  @override
  List<Object> get props => [genres];
}

class GenreError extends GenreState {
  final String error;

  const GenreError(this.error);

  @override
  List<Object> get props => [error];
}
