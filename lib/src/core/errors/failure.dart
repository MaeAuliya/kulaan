import 'package:equatable/equatable.dart';

import 'exception.dart';

abstract class Failure extends Equatable {
  final String message;
  final int statusCode;

  const Failure({
    required this.message,
    required this.statusCode,
  });

  String get errorMessage => '$statusCode: $message';

  @override
  List<Object?> get props => [
        message,
        statusCode,
      ];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    required super.statusCode,
  });

  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class LocalFailure extends Failure {
  const LocalFailure({
    required super.message,
    required super.statusCode,
  });

  LocalFailure.fromException(LocalException exception)
      : this(message: exception.message, statusCode: 500);
}
