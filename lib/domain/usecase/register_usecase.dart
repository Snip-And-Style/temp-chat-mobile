import 'package:snip_and_style/domain/service/authorization_service.dart';

abstract class RegisterUseCase {
  Future<void> register(
    String email,
    String password,
    String username,
  );
}

class RegisterUseCaseImpl implements RegisterUseCase {
  RegisterUseCaseImpl(this._service);

  final AuthorizationService _service;

  @override
  Future<void> register(
    String email,
    String password,
    String username,
  ) async =>
      _service.register(
        email,
        password,
        username,
      );
}
