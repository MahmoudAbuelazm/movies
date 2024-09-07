

import '../../domain/entities/more_like_this.dart';

class MoreLikeThisModel extends MoreLikeThis{
  const MoreLikeThisModel({required super.id,  super.backdropPath});


  factory MoreLikeThisModel.fromJson(Map<String, dynamic> json) {
    return MoreLikeThisModel(
      id: json['id'],
      backdropPath: json['backdrop_path']??'/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
    );
  }


}