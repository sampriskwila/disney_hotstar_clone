part of 'movie_video_bloc.dart';

abstract class MovieVideoState extends Equatable {
  const MovieVideoState();

  @override
  List<Object> get props => [];
}

class MovieVideoLoading extends MovieVideoState {
  @override
  List<Object> get props => [];
}

class MovieVideoLoaded extends MovieVideoState {
  final List<MovieVideo> videos;

  const MovieVideoLoaded(this.videos);

  @override
  List<Object> get props => [videos];
}

class MovieVideoError extends MovieVideoState {
  final String error;

  const MovieVideoError(this.error);

  @override
  List<Object> get props => [error];
}
