import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/post_order_params.dart';
import '../repositories/cart_repository.dart';

class CreateOrder implements UseCaseWithParams<void, PostOrderParams> {
  final CartRepository _repository;

  const CreateOrder({required CartRepository repository})
      : _repository = repository;

  @override
  ResultFuture<void> call(PostOrderParams params) =>
      _repository.createOrder(params);
}
