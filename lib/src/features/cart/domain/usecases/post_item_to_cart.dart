import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/core_cart.dart';
import '../entities/core_cart_params.dart';
import '../repositories/cart_repository.dart';

class PostItemToCart implements UseCaseWithParams<CoreCart, CoreCartParams> {
  final CartRepository _repository;

  const PostItemToCart({required CartRepository repository})
      : _repository = repository;

  @override
  ResultFuture<CoreCart> call(CoreCartParams params) =>
      _repository.postItemToCart(params);
}
