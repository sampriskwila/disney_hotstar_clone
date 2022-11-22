import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../constants/constants.dart';
import '../repositories/repositories.dart';
import '../widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  final int movieId;

  const DetailScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailBloc(
        repository: TMDBRepository(),
      )..add(LoadMovieDetailEvent(movieId)),
      child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoaded) {
            return MovieDetailContent(
              movieId: movieId,
              movie: state.movie,
              width: Const.screenWidth(context) / 3,
              height: Const.screenWidth(context) / 2,
            );
          }
          if (state is MovieDetailError) {
            return MovieDetailErrors(
              error: state.error,
            );
          }
          return MovieDetailLoader(
            movieId: movieId,
            width: Const.screenWidth(context) / 3,
            height: Const.screenWidth(context) / 2,
          );
        },
      ),
    );
  }
}
