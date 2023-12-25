import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snip_and_style/domain/usecase/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    this._loginUseCase,
  ) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        login: (email, password) async {
          emit(const LoginState.loading());
          try {
            await _loginUseCase.login(email, password);
            emit(const LoginState.success());
          } catch (e) {
            emit(LoginState.failure(e.toString()));
          }
        },
      );
    });
  }
  final LoginUseCase _loginUseCase;
}
