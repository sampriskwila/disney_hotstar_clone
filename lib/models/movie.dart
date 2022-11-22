// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int? id;
  final String? title;
  final String? backdropPath;
  final String? posterPath;

  const Movie({
    this.id,
    this.title,
    this.backdropPath,
    this.posterPath,
  });

  Movie copyWith({
    int? id,
    String? title,
    String? backdropPath,
    String? posterPath,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      backdropPath: backdropPath ?? this.backdropPath,
      posterPath: posterPath ?? this.posterPath,
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int?,
      title: json['title'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, title, backdropPath, posterPath];
}
