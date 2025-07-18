import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/core_product.dart';
import '../repositories/cart_repository.dart';

class GetAllProduct implements UseCaseWithoutParams<List<CoreProduct>> {
  final CartRepository _repository;

  const GetAllProduct({required CartRepository repository})
      : _repository = repository;

  @override
  ResultFuture<List<CoreProduct>> call() => _repository.getAllProduct();
}
