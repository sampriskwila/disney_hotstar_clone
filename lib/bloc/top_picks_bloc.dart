import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part 'top_picks_event.dart';
part 'top_picks_state.dart';

class TopPicksBloc extends Bloc<TopPicksEvent, TopPicksState> {
  final TMDBRepository repository;

  TopPicksBloc({required this.repository}) : super(TopPicksLoading()) {
    on<LoadTopPicksEvent>((event, emit) async {
      emit(TopPicksLoading());

      try {
        final response = await repository.getTopPicks();
        emit(TopPicksLoaded(response.movies));
      } catch (error) {
        emit(TopPicksError(error.toString()));
      }
    });
  }
}
