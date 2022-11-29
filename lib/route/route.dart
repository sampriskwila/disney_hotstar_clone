import 'package:flutter/material.dart';

import '../arguments/arguments.dart';
import '../screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/root':
        return MaterialPageRoute(
          builder: (_) => const RootScreen(),
        );
      case '/genre':
        return MaterialPageRoute(
          builder: (_) => const GenreScreen(),
        );
      case '/detail':
        return MaterialPageRoute(
          builder: (_) => DetailScreen(
            movieId: settings.arguments as int,
          ),
        );
      case '/selected_genre':
        return MaterialPageRoute(
          builder: (_) => SelectedGenreScreen(
            movieId: (settings.arguments as GenreArguments).id,
            title: (settings.arguments as GenreArguments).name,
          ),
        );
      case '/grid_portrait':
        return MaterialPageRoute(
          builder: (_) => GridPortraitScreen(
            title: (settings.arguments as MovieArguments).title,
            movies: (settings.arguments as MovieArguments).images,
          ),
        );
      case '/no_connection':
        return MaterialPageRoute(
          builder: (_) => const NoConnectionScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Page Error'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('Page not found'),
          ),
        );
      },
    );
  }
}
