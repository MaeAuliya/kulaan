import 'package:equatable/equatable.dart';

class Example extends Equatable {
  final String message;

  const Example({required this.message});

  @override
  List<Object?> get props => [
    message,
  ];
}