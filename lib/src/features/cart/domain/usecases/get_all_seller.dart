import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/core_seller.dart';
import '../repositories/cart_repository.dart';

class GetAllSeller implements UseCaseWithoutParams<List<CoreSeller>> {
  final CartRepository _repository;

  const GetAllSeller({required CartRepository repository})
      : _repository = repository;

  @override
  ResultFuture<List<CoreSeller>> call() => _repository.getAllSeller();
}
