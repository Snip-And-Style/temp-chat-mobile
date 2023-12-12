import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        login: (email, password) async {
          emit(const LoginState.loading());
          try {
            emit(const LoginState.success());
          } catch (e) {
            emit(LoginState.failure(e.toString()));
          }
        },
      );
    });
  }
}
