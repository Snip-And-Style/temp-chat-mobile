part of 'messages_bloc.dart';

@freezed
class MessagesState with _$MessagesState {
  const factory MessagesState.loading() = _Loading;
  const factory MessagesState.success(
    List<Room> rooms,
  ) = _Success;
}
