import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/authentication_repository.dart';

class SignOut implements UseCaseWithoutParams<void> {
  final AuthenticationRepository _repository;

  const SignOut({required AuthenticationRepository repository})
      : _repository = repository;

  @override
  ResultFuture<void> call() => _repository.signOut();
}
