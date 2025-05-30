import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/example_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // example usecase
  final ExampleUseCase _exampleUseCase;

  HomeBloc({
    required ExampleUseCase exampleUseCase,
  })  : _exampleUseCase = exampleUseCase,
        super(const HomeInit()) {
    on<HomeEvent>((event, emit) {
      emit(HomeLoading());
    });
    on<ExampleEvent>(_exampleUseCaseHandler);
    on<ShowDialogEvent>(_showDialogHandler);
  }

  Future<void> _exampleUseCaseHandler(
    ExampleEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _exampleUseCase.call(event.example);
    result.fold(
      (failure) => emit(ExampleError(failure.message)),
      (example) => emit(ExampleSuccess(example)),
    );
  }

  Future<void> _showDialogHandler(
    ShowDialogEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(ShowDialogSuccess());
  }
}
