import '../../../../core/utils/typedef.dart';
import '../entities/core_order.dart';

abstract class HistoryRepository {
  const HistoryRepository();

  ResultFuture<List<CoreOrder>> getUserOrders(String userId);
}
