part of 'welcome_bloc.dart';

@freezed
class WelcomeState with _$WelcomeState {
  const factory WelcomeState.initial({
    required bool isAuthorized,
  }) = _Initial;
}
