part of 'similar_movie_bloc.dart';

abstract class SimilarMovieState extends Equatable {
  const SimilarMovieState();

  @override
  List<Object> get props => [];
}

class SimilarMovieLoading extends SimilarMovieState {
  @override
  List<Object> get props => [];
}

class SimilarMovieLoaded extends SimilarMovieState {
  final List<Movie> movies;

  const SimilarMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class SimilarMovieError extends SimilarMovieState {
  final String error;

  const SimilarMovieError(this.error);

  @override
  List<Object> get props => [error];
}
