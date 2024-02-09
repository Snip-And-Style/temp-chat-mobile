abstract class AuthorizationService {
  Future<void> login(
    String email,
    String password,
  );

  Future<String> register(
    String email,
    String password,
    String username,
  );
}
