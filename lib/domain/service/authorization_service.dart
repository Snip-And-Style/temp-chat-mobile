abstract class AuthorizationService {
  Future<String> login(
    String email,
    String password,
  );

  Future<String> register(
    String email,
    String password,
    String username,
  );
}
