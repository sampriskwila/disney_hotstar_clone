import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part 'movie_video_event.dart';
part 'movie_video_state.dart';

class MovieVideoBloc extends Bloc<MovieVideoEvent, MovieVideoState> {
  final TMDBRepository repository;

  MovieVideoBloc({required this.repository}) : super(MovieVideoLoading()) {
    on<LoadMovieVideoEvent>((event, emit) async {
      emit(MovieVideoLoading());

      try {
        final response = await repository.getMovieVideos(event.id);
        emit(MovieVideoLoaded(response.videos));
      } catch (error) {
        emit(MovieVideoError(error.toString()));
      }
    });
  }
}
