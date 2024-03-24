abstract class AuthorizationGateway {
  Future<void> login(
    String email,
    String password,
  );

  Future<void> register(
    String email,
    String password,
    String username,
  );

  Future<bool> checkIfAuthorized();
}
