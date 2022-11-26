import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../arguments/arguments.dart';
import '../bloc/bloc.dart';
import '../constants/constants.dart';
import '../repositories/repositories.dart';
import 'widgets.dart';

class SimilarContentList extends StatelessWidget {
  final int movieId;
  final String title;

  const SimilarContentList({
    super.key,
    required this.movieId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMovieBloc(
        repository: TMDBRepository(),
      )..add(LoadSimilarMovieEvent(movieId)),
      child: BlocBuilder<SimilarMovieBloc, SimilarMovieState>(
        builder: (context, state) {
          if (state is SimilarMovieLoaded) {
            return Column(
              children: [
                ContentTitle(
                  title: title,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/grid_portrait',
                      arguments: MovieArguments(state.movies, title),
                    );
                  },
                ),
                ImagePortraitList(
                  height: AppConstants.screenWidth(context) / 2.5,
                  width: AppConstants.screenWidth(context) / 3.5,
                  images: state.movies,
                ),
              ],
            );
          }
          if (state is SimilarMovieError) {
            return Column(
              children: [
                ContentTitle(
                  title: title,
                  onTap: () {},
                ),
                ImagePortraitListError(
                  error: state.error,
                  height: AppConstants.screenWidth(context) / 2.5,
                  width: AppConstants.screenWidth(context) / 3.5,
                ),
              ],
            );
          }
          return Column(
            children: [
              ContentTitle(
                title: title,
                onTap: () {},
              ),
              ImagePortraitListLoader(
                height: AppConstants.screenWidth(context) / 2.5,
                width: AppConstants.screenWidth(context) / 3.5,
              ),
            ],
          );
        },
      ),
    );
  }
}
