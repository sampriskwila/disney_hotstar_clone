import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final TMDBRepository repository;

  MovieDetailBloc({required this.repository}) : super(MovieDetailLoading()) {
    on<LoadMovieDetailEvent>((event, emit) async {
      emit(MovieDetailLoading());

      try {
        final response = await repository.getMovieDetails(event.id);
        emit(MovieDetailLoaded(response.movie));
      } catch (error) {
        emit(MovieDetailError(error.toString()));
      }
    });
  }
}
