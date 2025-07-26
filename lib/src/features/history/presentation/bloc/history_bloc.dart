import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_user_orders.dart';
import 'history_event.dart';
import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetUserOrders _getUserOrders;

  HistoryBloc({
    required GetUserOrders getUserOrders,
  })  : _getUserOrders = getUserOrders,
        super(const HistoryInit()) {
    on<HistoryEvent>((event, emit) {
      emit(const HistoryLoading());
    });
    on<GetUserOrderEvent>(_getUserOrdersHandler);
  }

  Future<void> _getUserOrdersHandler(
    GetUserOrderEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const GetUserOrdersLoading());
    final result = await _getUserOrders.call(event.userId);
    result.fold(
      (failure) => emit(GetUserOrdersError(failure.message)),
      (orders) => emit(GetUserOrdersSuccess(orders)),
    );
  }
}
