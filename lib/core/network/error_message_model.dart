import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String message;
  final bool success;

  const ErrorMessageModel(
      {required this.statusCode, required this.message, required this.success});
}
