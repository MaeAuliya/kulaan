import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

final class ExampleEvent extends LoginEvent {
  final String example;

  const ExampleEvent(this.example);

  @override
  List<Object?> get props => [example];
}

final class ShowDialogEvent extends LoginEvent {
  const ShowDialogEvent();
}