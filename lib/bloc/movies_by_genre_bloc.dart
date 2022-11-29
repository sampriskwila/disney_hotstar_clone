import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part 'movies_by_genre_event.dart';
part 'movies_by_genre_state.dart';

class MoviesByGenreBloc extends Bloc<MoviesByGenreEvent, MoviesByGenreState> {
  final TMDBRepository repository;

  MoviesByGenreBloc({required this.repository}) : super(MoviesByGenreLoading()) {
    on<LoadMoviesByGenreEvent>((event, emit) async {
      try {
        if (state is MoviesByGenreLoading) {
          final response = await repository.getMoviesByGenre(event.id);
          emit(MoviesByGenreLoaded(response.movies, response.page));
        }

        MoviesByGenreLoaded loadedMovies = state as MoviesByGenreLoaded;

        if (loadedMovies.page == 500) {
          emit(MoviesByGenreLoaded(loadedMovies.movies, loadedMovies.page));
        } else {
          final response = await repository.getMoviesByGenre(event.id, loadedMovies.page + 1);
          emit(MoviesByGenreLoaded(loadedMovies.movies + response.movies, response.page));
        }
      } catch (error) {
        emit(MoviesByGenreError(error.toString()));
      }
    });
  }
}
