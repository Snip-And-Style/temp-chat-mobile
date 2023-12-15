import 'package:snip_and_style/domain/service/authorization_service.dart';

abstract class LoginUseCase {
  Future<void> login(
    String email,
    String password,
  );
}

class LoginUseCaseImpl implements LoginUseCase {
  LoginUseCaseImpl(this._service);

  final AuthorizationService _service;

  @override
  Future<void> login(
    String email,
    String password,
  ) async {
    await _service.login(email, password);
  }
}
