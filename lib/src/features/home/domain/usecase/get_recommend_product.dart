import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../../../cart/domain/entities/core_product.dart';
import '../repository/home_repository.dart';

class GetRecommendProduct implements UseCaseWithoutParams<List<CoreProduct>> {
  final HomeRepository _repository;

  const GetRecommendProduct({required HomeRepository repository})
      : _repository = repository;

  @override
  ResultFuture<List<CoreProduct>> call() => _repository.getRecommendProduct();
}
