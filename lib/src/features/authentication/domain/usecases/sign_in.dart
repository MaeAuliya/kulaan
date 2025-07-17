import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/sign_in_params.dart';
import '../entities/core_user.dart';
import '../repositories/authentication_repository.dart';

class SignIn implements UseCaseWithParams<CoreUser?, SignInParams> {
  final AuthenticationRepository _repository;

  const SignIn({required AuthenticationRepository repository})
      : _repository = repository;

  @override
  ResultFuture<CoreUser?> call(SignInParams params) =>
      _repository.signIn(params);
}
