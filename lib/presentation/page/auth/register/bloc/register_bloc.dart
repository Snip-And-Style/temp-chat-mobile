import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snip_and_style/domain/usecase/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(
    this._registerUseCase,
  ) : super(const RegisterState.initial()) {
    on<RegisterEvent>((event, emit) async {
      await event.when(
        register: (email, password, userName) async {
          emit(const RegisterState.loading());
          try {
            await _registerUseCase.register(email, password, userName);
            emit(const RegisterState.success());
          } catch (e) {
            emit(RegisterState.failure(e.toString()));
          }
        },
      );
    });
  }
  final RegisterUseCase _registerUseCase;
}
