import 'package:snip_and_style/domain/gateway/authorization_gateway.dart';
import 'package:snip_and_style/domain/service/authorization_service.dart';

class AuthorizationServiceImpl implements AuthorizationService {
  const AuthorizationServiceImpl(
    this._gateway,
  );
  final AuthorizationGateway _gateway;

  @override
  Future<String> login(String email, String password) async {
    return _gateway.login(email, password);
  }
}
