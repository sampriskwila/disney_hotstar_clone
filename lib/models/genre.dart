import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  final int? id;
  final String? name;

  const Genre({
    this.id,
    this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
