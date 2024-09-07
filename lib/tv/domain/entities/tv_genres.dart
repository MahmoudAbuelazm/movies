import 'package:equatable/equatable.dart';

class TvGenres extends Equatable {
  final int id;
  final String name;

  const TvGenres({required this.id, required this.name});

  factory TvGenres.fromJson(Map<String, dynamic> json) {
    return TvGenres(id: json['id'], name: json['name']);
  }


  

@override
List<Object?> get props => [id, name];
}
