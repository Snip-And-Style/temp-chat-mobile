// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:snip_and_style/data/datasources/graphql_client.dart';
import 'package:snip_and_style/data/datasources/mutations/authorization_mutations.dart';
import 'package:snip_and_style/domain/gateway/authorization_gateway.dart';

class AuthorizationGatewayImpl implements AuthorizationGateway {
  // Constructor injecting GraphQLClientManager for GraphQL operations.
  AuthorizationGatewayImpl(this._graphQLClientManager);

  final GraphQLClientManager _graphQLClientManager;

  // Implementation of the login functionality.
  @override
  Future<void> login(String email, String password) async {
    // Define the mutation options with variables.
    final options = MutationOptions(
      document: gql(AuthorizationMutations.loginMutation),
      variables: {
        'email': email,
        'password': password,
      },
    );

    // Execute the mutation and await the result.
    final result = await _graphQLClientManager.callGraphQLMutation(options);

    _graphQLClientManager.updateSession(result);
  }

  @override
  Future<void> register(String email, String password, String username) async {
    final options = MutationOptions(
      document: gql(AuthorizationMutations.registerMutation),
      variables: {
        'user_data': {
          'email': email,
          'password': password,
          'name': username,
        },
      },
    );

    await _graphQLClientManager.callGraphQLMutation(options);
  }
}
