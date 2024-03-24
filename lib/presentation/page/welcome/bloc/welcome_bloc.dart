import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snip_and_style/domain/usecase/check_if_authorized_usecase.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';
part 'welcome_bloc.freezed.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc(
    this.checkIfAuthorizedUseCase,
  ) : super(
          const _Initial(isAuthorized: false),
        ) {
    on<WelcomeEvent>((event, emit) async {
      await event.when(
        started: () => _started(emit: emit),
      );
    });
  }

  Future<void> _started({
    required Emitter<WelcomeState> emit,
  }) async {
    final isAuthorized = await checkIfAuthorizedUseCase.checkIfAuthorized();
    emit(
      state.copyWith(
        isAuthorized: isAuthorized,
      ),
    );
  }

  final CheckIfAuthorizedUseCase checkIfAuthorizedUseCase;
}
