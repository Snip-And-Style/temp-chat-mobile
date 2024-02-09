import 'package:snip_and_style/domain/gateway/authorization_gateway.dart';
import 'package:snip_and_style/domain/service/authorization_service.dart';

class AuthorizationServiceImpl implements AuthorizationService {
  const AuthorizationServiceImpl(
    this._gateway,
  );
  final AuthorizationGateway _gateway;

  @override
  Future<void> login(String email, String password) async =>
      _gateway.login(email, password);

  @override
  Future<void> register(String email, String password, String username) =>
      _gateway.register(email, password, username);
}
