part of 'carousel_slider_bloc.dart';

abstract class CarouselSliderState extends Equatable {
  const CarouselSliderState();

  @override
  List<Object> get props => [];
}

class CarouselLoading extends CarouselSliderState {
  @override
  List<Object> get props => [];
}

class CarouselLoaded extends CarouselSliderState {
  final List<Movie> movies;

  const CarouselLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class CarouselError extends CarouselSliderState {
  final String error;

  const CarouselError(this.error);

  @override
  List<Object> get props => [error];
}
