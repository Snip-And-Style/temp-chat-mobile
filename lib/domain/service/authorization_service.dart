abstract class AuthorizationService {
  Future<String> login(
    String email,
    String password,
  );
}
