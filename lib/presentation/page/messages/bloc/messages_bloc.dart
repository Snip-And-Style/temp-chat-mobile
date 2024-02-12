import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snip_and_style/domain/model/room/room.dart';

part 'messages_event.dart';
part 'messages_state.dart';
part 'messages_bloc.freezed.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc() : super(const _Loading()) {
    on<MessagesEvent>((event, emit) {
      event.when(
        getInitialData: () => getInitialData(emit: emit),
      );
    });
  }

  Future<void> getInitialData({
    required Emitter<MessagesState> emit,
  }) async {
    emit(const MessagesState.success([]));
  }
}
