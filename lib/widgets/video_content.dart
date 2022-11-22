import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../repositories/repositories.dart';
import 'widgets.dart';

class VideoContent extends StatelessWidget {
  final int movieId;

  const VideoContent({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieVideoBloc(
        repository: TMDBRepository(),
      )..add(LoadMovieVideoEvent(movieId)),
      child: BlocBuilder<MovieVideoBloc, MovieVideoState>(
        builder: (context, state) {
          if (state is MovieVideoLoaded) {
            return VideoPreview(
              videos: state.videos,
            );
          }
          if (state is MovieVideoError) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
              ),
              child: Center(
                child: Text(state.error),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
