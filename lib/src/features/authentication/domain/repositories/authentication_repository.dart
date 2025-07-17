import '../../../../core/utils/typedef.dart';
import '../entities/sign_in_params.dart';
import '../entities/core_user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFuture<CoreUser?> signIn(SignInParams params);

  ResultFuture<CoreUser?> signInWithCredential();

  ResultVoid signOut();
}
