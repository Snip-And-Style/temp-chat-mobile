import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snip_and_style/domain/entity/room/room.dart';
import 'package:snip_and_style/domain/usecase/get_rooms_usecase.dart';

part 'messages_event.dart';
part 'messages_state.dart';
part 'messages_bloc.freezed.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc(
    this._getRoomsUseCase,
  ) : super(const _Loading()) {
    on<MessagesEvent>((event, emit) async {
      await event.when(
        getInitialData: () => getInitialData(emit: emit),
      );
    });
  }

  Future<void> getInitialData({
    required Emitter<MessagesState> emit,
  }) async {
    emit(const MessagesState.loading());
    final rooms = await _getRoomsUseCase.getRooms();
    emit(MessagesState.success(rooms));
  }

  final GetRoomsUseCase _getRoomsUseCase;
}
