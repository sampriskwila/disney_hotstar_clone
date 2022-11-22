import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../repositories/repositories.dart';
import 'widgets.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.95);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarouselSliderBloc(
        repository: TMDBRepository(),
      )..add(LoadCarouselSliderEvent()),
      child: BlocBuilder<CarouselSliderBloc, CarouselSliderState>(
        builder: (context, state) {
          if (state is CarouselLoaded) {
            return ImageLandscapeList(
              pageController: _pageController,
              images: state.movies,
              height: 200,
            );
          }
          if (state is CarouselError) {
            return ImageLandscapeListError(
              pageController: _pageController,
              error: state.error,
              height: 200,
            );
          }
          return ImageLandscapeListLoader(
            pageController: _pageController,
            height: 200,
          );
        },
      ),
    );
  }
}
