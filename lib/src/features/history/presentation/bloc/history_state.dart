import 'package:equatable/equatable.dart';

import '../../domain/entities/core_order.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object?> get props => [];
}

final class HistoryInit extends HistoryState {
  const HistoryInit();
}

final class HistoryLoading extends HistoryState {
  const HistoryLoading();
}

final class GetUserOrdersSuccess extends HistoryState {
  final List<CoreOrder> orders;

  const GetUserOrdersSuccess(this.orders);

  @override
  List<Object?> get props => [orders];
}

final class GetUserOrdersLoading extends HistoryState {
  const GetUserOrdersLoading();
}

final class GetUserOrdersError extends HistoryState {
  final String errorMessage;

  const GetUserOrdersError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
