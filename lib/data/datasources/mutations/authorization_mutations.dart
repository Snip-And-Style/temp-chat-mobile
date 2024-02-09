class AuthorizationMutations {
  AuthorizationMutations._();

  static const loginMutation = r'''
      mutation LoginUser($email: String!, $password: String!) {
        loginUser(email: $email, password: $password) {
          id
        }
      }
    ''';

  static const registerMutation = r'''
      mutation RegisterUser($user_data: UserInput!) {
        registerUser(userData: $user_data) {
          id
        }
      }
    ''';
}
