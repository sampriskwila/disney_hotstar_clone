import 'models.dart';

class MovieVideoResponse {
  final List<MovieVideo> videos;

  MovieVideoResponse({
    required this.videos,
  });

  MovieVideoResponse copyWith({
    List<MovieVideo>? videos,
  }) {
    return MovieVideoResponse(
      videos: videos ?? this.videos,
    );
  }

  factory MovieVideoResponse.withSuccess(Map<String, dynamic> json) {
    return MovieVideoResponse(
      videos:
          (json['results'] as List).map((x) => MovieVideo.fromJson(x)).toList(),
    );
  }
}
