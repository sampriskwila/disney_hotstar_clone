import 'package:equatable/equatable.dart';

class MovieVideo extends Equatable {
  final String? type;
  final String? key;

  const MovieVideo({
    this.type,
    this.key,
  });

  MovieVideo copyWith({
    String? type,
    String? key,
  }) {
    return MovieVideo(
      type: type ?? this.type,
      key: key ?? this.key,
    );
  }

  factory MovieVideo.fromJson(Map<String, dynamic> json) {
    return MovieVideo(
      type: json['type'] as String?,
      key: json['key'] as String?,
    );
  }

  @override
  List<Object?> get props => [type, key];
}
