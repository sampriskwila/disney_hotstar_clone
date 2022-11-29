import 'package:equatable/equatable.dart';

import 'genre.dart';

class MovieDetail extends Equatable {
  final String? title;
  final List<Language>? languages;
  final List<Genre>? genres;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAverage;
  final String? overview;

  const MovieDetail({
    this.title,
    this.languages,
    this.genres,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.overview,
  });

  MovieDetail copyWith({
    String? title,
    List<Language>? languages,
    List<Genre>? genres,
    String? posterPath,
    String? releaseDate,
    double? voteAverage,
    String? overview,
  }) {
    return MovieDetail(
      title: title ?? this.title,
      languages: languages ?? this.languages,
      genres: genres ?? this.genres,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      voteAverage: voteAverage ?? this.voteAverage,
      overview: overview ?? this.overview,
    );
  }

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      title: json['title'] as String?,
      languages: (json['spoken_languages'] as List?)?.map((x) => Language.fromJson(x)).toList(),
      genres: (json['genres'] as List?)?.map((x) => Genre.fromJson(x)).toList(),
      posterPath: json['poster_path'] as String?,
      releaseDate: (json['release_date'] as String?)?.split('-')[0],
      voteAverage: json['vote_average'] as double?,
      overview: json['overview'] as String?,
    );
  }

  static const empty = MovieDetail(
    title: '',
    languages: [],
    genres: [],
    posterPath: '',
    releaseDate: '',
    voteAverage: 0,
    overview: '',
  );

  @override
  List<Object?> get props {
    return [
      title,
      languages,
      genres,
      posterPath,
      releaseDate,
      voteAverage,
      overview,
    ];
  }
}

class Language extends Equatable {
  final String? name;

  const Language({
    this.name,
  });

  Language copyWith({
    String? name,
  }) {
    return Language(
      name: name ?? this.name,
    );
  }

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['english_name'] as String?,
    );
  }

  @override
  List<Object?> get props => [name];
}
