import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/core_product.dart';
import '../repositories/cart_repository.dart';

class GetAllProductBySeller
    implements UseCaseWithParams<List<CoreProduct>, String> {
  final CartRepository _repository;

  const GetAllProductBySeller({required CartRepository repository})
      : _repository = repository;

  @override
  ResultFuture<List<CoreProduct>> call(String sellerId) =>
      _repository.getAllProductBySeller(sellerId);
}
