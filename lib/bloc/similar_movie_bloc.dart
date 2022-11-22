import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part 'similar_movie_event.dart';
part 'similar_movie_state.dart';

class SimilarMovieBloc extends Bloc<SimilarMovieEvent, SimilarMovieState> {
  final TMDBRepository repository;

  SimilarMovieBloc({required this.repository}) : super(SimilarMovieLoading()) {
    on<LoadSimilarMovieEvent>((event, emit) async {
      emit(SimilarMovieLoading());

      try {
        final response = await repository.getSimilarMovies(event.id);
        emit(SimilarMovieLoaded(response.movies));
      } catch (error) {
        emit(SimilarMovieError(error.toString()));
      }
    });
  }
}
