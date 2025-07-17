part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

final class AuthenticationInit extends AuthenticationState {
  const AuthenticationInit();
}

final class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

final class SignInSuccess extends AuthenticationState {
  final CoreUser currentUser;

  const SignInSuccess(this.currentUser);

  @override
  List<Object?> get props => [currentUser];
}

final class SignInInvalid extends AuthenticationState {
  const SignInInvalid();
}

final class SignInLoading extends AuthenticationState {
  const SignInLoading();
}

final class SignInError extends AuthenticationState {
  final String errorMessage;

  const SignInError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class SignInWithCredentialSuccess extends AuthenticationState {
  final CoreUser currentUser;

  const SignInWithCredentialSuccess(this.currentUser);

  @override
  List<Object?> get props => [currentUser];
}

final class SignInWithCredentialLoading extends AuthenticationState {
  const SignInWithCredentialLoading();
}

final class SignInWithCredentialFailed extends AuthenticationState {
  const SignInWithCredentialFailed();
}

final class SignInWithCredentialError extends AuthenticationState {
  final String errorMessage;

  const SignInWithCredentialError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class SignOutSuccess extends AuthenticationState {
  const SignOutSuccess();
}

final class SignOutLoading extends AuthenticationState {
  const SignOutLoading();
}

final class SignOutError extends AuthenticationState {
  final String errorMessage;

  const SignOutError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

