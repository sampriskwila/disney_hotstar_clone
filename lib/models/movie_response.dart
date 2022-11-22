import 'models.dart';

class MovieResponse {
  final List<Movie> movies;
  final int page;

  const MovieResponse({
    required this.movies,
    required this.page,
  });

  MovieResponse copyWith({
    List<Movie>? movies,
    int? page,
  }) {
    return MovieResponse(
      movies: movies ?? this.movies,
      page: page ?? this.page,
    );
  }

  factory MovieResponse.withSuccess(Map<String, dynamic> json) {
    return MovieResponse(
      movies: (json['results'] as List).map((x) => Movie.fromJson(x)).toList(),
      page: json['page'] as int,
    );
  }
}
