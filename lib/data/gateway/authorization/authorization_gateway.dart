import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:snip_and_style/data/datasources/graphql_client.dart';
import 'package:snip_and_style/data/gateway/authorization/authorization_mutations.dart';
import 'package:snip_and_style/domain/gateway/authorization_gateway.dart';

class AuthorizationGatewayImpl implements AuthorizationGateway {
  // Constructor injecting GraphQLClientManager for GraphQL operations.
  AuthorizationGatewayImpl(this._graphQLClientManager);

  final GraphQLClientManager _graphQLClientManager;

  // Getter to simplify access to the GraphQL client.
  GraphQLClient get _graphQLClient => _graphQLClientManager.client.value;

  // Implementation of the login functionality.
  @override
  Future<String> login(String email, String password) async {
    // Define the mutation options with variables.
    final options = MutationOptions(
      document: gql(AuthorizationMutations.loginMutation),
      variables: {
        'email': email,
        'password': password,
      },
    );

    // Execute the mutation and await the result.
    final result = await _graphQLClient.mutate(options);

    // Check for and handle any exceptions that occurred during the mutation.
    if (result.hasException) {
      // Throwing a more specific error can help with error handling upstream.
      throw Exception('GraphQL Error: ${result.exception}');
    }

    // Extracting the cookie from the response for session management.
    final cookie = result.context
        .entry<HttpLinkResponseContext>()
        ?.headers?['set-cookie']
        .toString();
    if (cookie != null) {
      _graphQLClientManager.updateClient(
        HttpLink(
          '${dotenv.get('BACKEND_URL')}/graphql',
          defaultHeaders: {'Cookie': cookie},
        ),
      );
    }

    // Returning the user ID from the response.
    return result.data?['loginUser']['id'].toString() ?? '';
  }
}
