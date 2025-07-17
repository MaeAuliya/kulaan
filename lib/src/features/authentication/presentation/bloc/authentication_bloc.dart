import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/core_user.dart';
import '../../domain/entities/sign_in_params.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_in_with_credential.dart';
import '../../domain/usecases/sign_out.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignIn _signIn;
  final SignInWithCredential _signInWithCredential;
  final SignOut _signOut;

  AuthenticationBloc({
    required SignIn signIn,
    required SignInWithCredential signInWithCredential,
    required SignOut signOut,
  })  : _signIn = signIn,
        _signInWithCredential = signInWithCredential,
        _signOut = signOut,
        super(const AuthenticationInit()) {
    on<AuthenticationEvent>((event, emit) {
      emit(const AuthenticationLoading());
    });
    on<SignInEvent>(_signInHandler);
    on<SignInWithCredentialEvent>(_signInWithCredentialHandler);
    on<SignOutEvent>(_signOutHandler);
  }

  Future<void> _signInHandler(
    SignInEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const SignInLoading());
    final result = await _signIn.call(event.params);
    result.fold(
      (failure) => emit(SignInError(failure.errorMessage)),
      (user) {
        if (user != null) {
          return emit(SignInSuccess(user));
        } else {
          return emit(const SignInInvalid());
        }
      },
    );
  }

  Future<void> _signInWithCredentialHandler(
    SignInWithCredentialEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const SignInWithCredentialLoading());
    final result = await _signInWithCredential.call();
    result.fold(
      (failure) => emit(SignInWithCredentialError(failure.errorMessage)),
      (user) {
        if (user != null) {
          return emit(SignInWithCredentialSuccess(user));
        } else {
          return emit(const SignInWithCredentialFailed());
        }
      },
    );
  }

  Future<void> _signOutHandler(
    SignOutEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const SignOutLoading());
    final result = await _signOut.call();
    result.fold(
      (failure) => emit(SignOutError(failure.errorMessage)),
      (_) => emit(const SignOutSuccess()),
    );
  }
}
