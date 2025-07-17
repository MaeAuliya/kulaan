import '../../domain/entities/sign_in_params.dart';

class SignInParamsModel extends SignInParams {
  const SignInParamsModel({
    required super.email,
    required super.password,
  });

  const SignInParamsModel.empty()
      : super(
          email: '',
          password: '',
        );

  SignInParamsModel.fromEntity(SignInParams entity)
      : super(
          email: entity.email,
          password: entity.password,
        );
}
