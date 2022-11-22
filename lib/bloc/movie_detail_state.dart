part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailLoading extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movie;

  const MovieDetailLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieDetailError extends MovieDetailState {
  final String error;

  const MovieDetailError(this.error);

  @override
  List<Object> get props => [error];
}
