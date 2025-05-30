import 'package:equatable/equatable.dart';

import '../../domain/entities/example.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeError extends HomeState {
  final String errorMessage;

  const HomeError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class HomeInit extends HomeState {
  const HomeInit();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class ExampleError extends HomeState {
  final String errorMessage;

  const ExampleError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class ExampleSuccess extends HomeState {
  final Example example;

  const ExampleSuccess(this.example);

  @override
  List<Object?> get props => [example];
}

final class ExampleLoading extends HomeState {
  const ExampleLoading();
}

final class ShowDialogSuccess extends HomeState {
  const ShowDialogSuccess();
}