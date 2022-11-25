import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class GridPortraitScreen extends StatelessWidget {
  final List<Movie> movies;
  final String title;

  const GridPortraitScreen({
    super.key,
    required this.movies,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ImagePortraitGrid(
      movies: movies,
      title: title,
    );
  }
}
