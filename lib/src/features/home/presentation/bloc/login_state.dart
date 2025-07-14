import 'package:equatable/equatable.dart';

import '../../domain/entities/example.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

final class LoginError extends LoginState {
  final String errorMessage;

  const LoginError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class LoginInit extends LoginState {
  const LoginInit();
}

final class LoginLoading extends LoginState {
  const LoginLoading();
}

final class ExampleError extends LoginState {
  final String errorMessage;

  const ExampleError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class ExampleSuccess extends LoginState {
  final Example example;

  const ExampleSuccess(this.example);

  @override
  List<Object?> get props => [example];
}

final class ExampleLoading extends LoginState {
  const ExampleLoading();
}

final class ShowDialogSuccess extends LoginState {
  const ShowDialogSuccess();
}