import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/core_cart.dart';
import '../entities/get_cart_seller_params.dart';
import '../repositories/cart_repository.dart';

class GetUserCartBySeller
    implements UseCaseWithParams<CoreCart?, GetCartSellerParams> {
  final CartRepository _repository;

  const GetUserCartBySeller({required CartRepository repository})
      : _repository = repository;

  @override
  ResultFuture<CoreCart?> call(GetCartSellerParams params) =>
      _repository.getUserCartBySeller(params);
}
