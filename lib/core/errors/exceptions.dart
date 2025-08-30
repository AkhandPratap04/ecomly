import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final int statusCode;
  final String message;

  const ServerException({required this.statusCode, required this.message});

  @override
  List<Object?> get props => [statusCode, message];
}

class CacheException extends Equatable implements Exception {
  final String message;

  const CacheException({required this.message});

  @override
  List<Object?> get props => [message];
}
