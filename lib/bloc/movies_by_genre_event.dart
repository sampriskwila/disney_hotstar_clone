part of 'movies_by_genre_bloc.dart';

abstract class MoviesByGenreEvent extends Equatable {
  const MoviesByGenreEvent();

  @override
  List<Object> get props => [];
}

class LoadMoviesByGenreEvent extends MoviesByGenreEvent {
  final int id;

  const LoadMoviesByGenreEvent(this.id);

  @override
  List<Object> get props => [id];
}
