import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class ExampleEvent extends HomeEvent {
  final String example;

  const ExampleEvent(this.example);

  @override
  List<Object?> get props => [example];
}

final class ShowDialogEvent extends HomeEvent {
  const ShowDialogEvent();
}