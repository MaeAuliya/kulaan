import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/core_user.dart';
import '../repositories/authentication_repository.dart';

class SignInWithCredential implements UseCaseWithoutParams<CoreUser?> {
  final AuthenticationRepository _repository;

  const SignInWithCredential({required AuthenticationRepository repository})
      : _repository = repository;

  @override
  ResultFuture<CoreUser?> call() => _repository.signInWithCredential();
}
