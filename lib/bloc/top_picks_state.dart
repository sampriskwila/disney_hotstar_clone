part of 'top_picks_bloc.dart';

abstract class TopPicksState extends Equatable {
  const TopPicksState();

  @override
  List<Object> get props => [];
}

class TopPicksLoading extends TopPicksState {
  @override
  List<Object> get props => [];
}

class TopPicksLoaded extends TopPicksState {
  final List<Movie> movies;

  const TopPicksLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class TopPicksError extends TopPicksState {
  final String error;

  const TopPicksError(this.error);

  @override
  List<Object> get props => [error];
}
