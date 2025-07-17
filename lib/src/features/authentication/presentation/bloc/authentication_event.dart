part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

final class SignInEvent extends AuthenticationEvent {
  final SignInParams params;

  const SignInEvent(this.params);

  @override
  List<Object?> get props => [params];
}

final class SignInWithCredentialEvent extends AuthenticationEvent {
  const SignInWithCredentialEvent();
}

final class SignOutEvent extends AuthenticationEvent {
  const SignOutEvent();
}