import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../arguments/arguments.dart';
import '../constants/constants.dart';
import '../bloc/bloc.dart';
import '../repositories/repositories.dart';
import 'widgets.dart';

class TopPicksForYou extends StatelessWidget {
  final String title;

  const TopPicksForYou({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopPicksBloc(
        repository: TMDBRepository(),
      )..add(LoadTopPicksEvent()),
      child: BlocBuilder<TopPicksBloc, TopPicksState>(
        builder: (context, state) {
          if (state is TopPicksLoaded) {
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
                  height: Const.screenWidth(context) / 2.5,
                  width: Const.screenWidth(context) / 3.5,
                  images: state.movies,
                ),
              ],
            );
          }
          if (state is TopPicksError) {
            return Column(
              children: [
                ContentTitle(
                  title: title,
                  onTap: () {},
                ),
                ImagePortraitListError(
                  error: state.error,
                  height: Const.screenWidth(context) / 2.5,
                  width: Const.screenWidth(context) / 3.5,
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
                height: Const.screenWidth(context) / 2.5,
                width: Const.screenWidth(context) / 3.5,
              ),
            ],
          );
        },
      ),
    );
  }
}
