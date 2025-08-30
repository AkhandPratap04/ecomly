import 'package:equatable/equatable.dart';
import 'package:prakhya_ecomly/core/errors/exceptions.dart';

sealed class Failure extends Equatable {
  const Failure({required this.statusCode, required this.message});

  final int statusCode;
  final String message;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object?> get props => [statusCode, message];
}

class ServerFailer extends Failure {
  const ServerFailer({required super.statusCode, required super.message});

  ServerFailer.fromException(ServerException e)
    : this(message: e.message, statusCode: e.statusCode);
}

class CacheFailer extends Failure {
  // 3 - Data not found in cache -> custom code I made up.
  const CacheFailer({required super.message, super.statusCode = 3});

  CacheFailer.fromException(CacheException e) : this(message: e.message);
}
