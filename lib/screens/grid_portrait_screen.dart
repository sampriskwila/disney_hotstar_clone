import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class GridPortraitScreen extends StatefulWidget {
  final List<Movie> movies;
  final String title;

  const GridPortraitScreen({
    super.key,
    required this.movies,
    required this.title,
  });

  @override
  State<GridPortraitScreen> createState() => _GridPortraitScreenState();
}

class _GridPortraitScreenState extends State<GridPortraitScreen> {
  bool _showAppBar = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _showAppBar = true;
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _showAppBar = false;
        });
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
    return ImagePortraitGrid(
      scrollController: _scrollController,
      movies: widget.movies,
      showAppBar: _showAppBar,
      title: widget.title,
    );
  }
}
