abstract class AuthorizationService {
  Future<void> login(
    String email,
    String password,
  );
}
