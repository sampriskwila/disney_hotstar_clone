import 'genre.dart';

class GenreResponse {
  final List<Genre> genres;

  GenreResponse({
    required this.genres,
  });

  GenreResponse copyWith({
    List<Genre>? genres,
  }) {
    return GenreResponse(
      genres: genres ?? this.genres,
    );
  }

  factory GenreResponse.withSuccess(Map<String, dynamic> json) {
    return GenreResponse(
      genres: (json['genres'] as List).map((x) => Genre.fromJson(x)).toList(),
    );
  }
}
