// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MoreLikeThis extends Equatable {
  final int id;
  final String? backdropPath;
  const MoreLikeThis({
    required this.id,
     this.backdropPath,
  });

  @override
  List<Object?> get props => [id, backdropPath];
}
