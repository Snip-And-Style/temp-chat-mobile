class AuthorizationMutations {
  AuthorizationMutations._();

  static const loginMutation = r'''
      mutation LoginUser($email: String!, $password: String!) {
        loginUser(email: $email, password: $password) {
          id
        }
      }
    ''';
}
