import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../repositories/repositories.dart';
import '../widgets/widgets.dart';

class SelectedGenreScreen extends StatelessWidget {
  final int movieId;
  final String title;

  const SelectedGenreScreen({
    super.key,
    required this.movieId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesByGenreBloc(
        repository: TMDBRepository(),
      )..add(LoadMoviesByGenreEvent(movieId)),
      child: SelectedGenreContent(
        title: title,
        movieId: movieId,
      ),
    );
  }
}

class SelectedGenreContent extends StatefulWidget {
  final int movieId;
  final String title;

  const SelectedGenreContent({
    super.key,
    required this.movieId,
    required this.title,
  });

  @override
  State<SelectedGenreContent> createState() => _SelectedGenreContentState();
}

class _SelectedGenreContentState extends State<SelectedGenreContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.offset;

      if (currentScroll >= (maxScroll * 0.9)) {
        BlocProvider.of<MoviesByGenreBloc>(context).add(LoadMoviesByGenreEvent(widget.movieId));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesByGenreBloc, MoviesByGenreState>(
      builder: (context, state) {
        if (state is MoviesByGenreLoaded) {
          return ImagePortraitGrid(
            scrollController: _scrollController,
            movies: state.movies,
            title: widget.title,
          );
        }
        if (state is MoviesByGenreError) {
          return ImagePortraitGridError(
            title: widget.title,
            error: state.error,
          );
        }
        return ImagePortraitGridLoader(
          title: widget.title,
        );
      },
    );
  }
}
