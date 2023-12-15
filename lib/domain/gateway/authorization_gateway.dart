abstract class AuthorizationGateway {
  Future<String> login(
    String email,
    String password,
  );
}
