import 'package:flutter/material.dart';

class Const {
  static const String apiKey = 'a2065a7d5634d52a60c9b5e2aa60604e';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String backdropImageUrl = 'https://image.tmdb.org/t/p/w780';
  static const String posterImageUrl = 'https://image.tmdb.org/t/p/w185';

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
