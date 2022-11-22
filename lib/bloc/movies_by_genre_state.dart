part of 'movies_by_genre_bloc.dart';

abstract class MoviesByGenreState extends Equatable {
  const MoviesByGenreState();

  @override
  List<Object> get props => [];
}

class MoviesByGenreLoading extends MoviesByGenreState {
  @override
  List<Object> get props => [];
}

class MoviesByGenreLoaded extends MoviesByGenreState {
  final List<Movie> movies;
  final int page;

  const MoviesByGenreLoaded(this.movies, this.page);

  @override
  List<Object> get props => [movies, page];
}

class MoviesByGenreError extends MoviesByGenreState {
  final String error;

  const MoviesByGenreError(this.error);

  @override
  List<Object> get props => [error];
}
