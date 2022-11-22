import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final TMDBRepository repository;

  GenreBloc({required this.repository}) : super(GenreLoading()) {
    on<LoadGenresEvent>((event, emit) async {
      emit(GenreLoading());

      try {
        final response = await repository.getGenres();
        emit(GenreLoaded(response.genres));
      } catch (error) {
        emit(GenreError(error.toString()));
      }
    });
  }
}
