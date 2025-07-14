import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/example_use_case.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // example usecase
  final ExampleUseCase _exampleUseCase;

  LoginBloc({
    required ExampleUseCase exampleUseCase,
  })  : _exampleUseCase = exampleUseCase,
        super(const LoginInit()) {
    on<LoginEvent>((event, emit) {
      emit(LoginLoading());
    });
    on<ExampleEvent>(_exampleUseCaseHandler);
    on<ShowDialogEvent>(_showDialogHandler);
  }

  Future<void> _exampleUseCaseHandler(
    ExampleEvent event,
    Emitter<LoginState> emit,
  ) async {
    final result = await _exampleUseCase.call(event.example);
    result.fold(
      (failure) => emit(ExampleError(failure.message)),
      (example) => emit(ExampleSuccess(example)),
    );
  }

  Future<void> _showDialogHandler(
    ShowDialogEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(ShowDialogSuccess());
  }
}
