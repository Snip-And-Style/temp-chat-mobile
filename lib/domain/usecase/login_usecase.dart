import 'package:snip_and_style/domain/service/authorization_service.dart';

abstract class LoginUseCase {
  Future<String> login(
    String email,
    String password,
  );
}

class LoginUseCaseImpl implements LoginUseCase {
  LoginUseCaseImpl(this._service);

  final AuthorizationService _service;

  @override
  Future<String> login(
    String email,
    String password,
  ) async {
    return _service.login(email, password);
  }
}
