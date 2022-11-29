import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part 'carousel_slider_event.dart';
part 'carousel_slider_state.dart';

class CarouselSliderBloc extends Bloc<CarouselSliderEvent, CarouselSliderState> {
  final TMDBRepository repository;

  CarouselSliderBloc({required this.repository}) : super(CarouselLoading()) {
    on<LoadCarouselSliderEvent>((event, emit) async {
      emit(CarouselLoading());

      try {
        final response = await repository.getMoviesCarousel();
        emit(CarouselLoaded(response.movies));
      } catch (error) {
        emit(CarouselError(error.toString()));
      }
    });
  }
}
