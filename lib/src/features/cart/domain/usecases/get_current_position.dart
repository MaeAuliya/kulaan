import 'package:geolocator/geolocator.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/cart_repository.dart';

class GetCurrentPosition implements UseCaseWithoutParams<Position> {
  final CartRepository _repository;

  const GetCurrentPosition({required CartRepository repository})
      : _repository = repository;

  @override
  ResultFuture<Position> call() => _repository.getCurrentPosition();
}
