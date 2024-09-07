

import '../../domain/entities/tv_genres.dart';

class GenresModel extends TvGenres{
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(id: json['id'], name: json['name']);
  }

}