part of 'movie_video_bloc.dart';

abstract class MovieVideoEvent extends Equatable {
  const MovieVideoEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieVideoEvent extends MovieVideoEvent {
  final int id;

  const LoadMovieVideoEvent(this.id);

  @override
  List<Object> get props => [id];
}
