import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object?> get props => [];
}

final class GetUserOrderEvent extends HistoryEvent {
  final String userId;

  const GetUserOrderEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}
