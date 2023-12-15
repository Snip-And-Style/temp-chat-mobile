abstract class AuthorizationGateway {
  Future<void> login(
    String email,
    String password,
  );
}
