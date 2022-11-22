import 'movie_detail.dart';

class MovieDetailResponse {
  final MovieDetail movie;

  MovieDetailResponse({
    required this.movie,
  });

  MovieDetailResponse copyWith({
    MovieDetail? movie,
  }) {
    return MovieDetailResponse(
      movie: movie ?? this.movie,
    );
  }

  factory MovieDetailResponse.withSuccess(dynamic json) {
    return MovieDetailResponse(
      movie: MovieDetail.fromJson(json),
    );
  }
}
