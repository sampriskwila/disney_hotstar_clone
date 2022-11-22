part of 'similar_movie_bloc.dart';

abstract class SimilarMovieEvent extends Equatable {
  const SimilarMovieEvent();

  @override
  List<Object> get props => [];
}

class LoadSimilarMovieEvent extends SimilarMovieEvent {
  final int id;

  const LoadSimilarMovieEvent(this.id);

  @override
  List<Object> get props => [id];
}
