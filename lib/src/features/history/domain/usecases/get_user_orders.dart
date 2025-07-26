import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/core_order.dart';
import '../repositories/history_repository.dart';

class GetUserOrders implements UseCaseWithParams<List<CoreOrder>, String> {
  final HistoryRepository _repository;

  const GetUserOrders({required HistoryRepository repository})
      : _repository = repository;

  @override
  ResultFuture<List<CoreOrder>> call(String userId) =>
      _repository.getUserOrders(userId);
}
