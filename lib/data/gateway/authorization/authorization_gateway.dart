import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:snip_and_style/data/gateway/authorization/authorization_mutations.dart';
import 'package:snip_and_style/domain/gateway/authorization_gateway.dart';

class AuthorizationGatewayImpl implements AuthorizationGateway {
  AuthorizationGatewayImpl(this._client);

  final ValueNotifier<GraphQLClient> _client;

  @override
  Future<String> login(String email, String password) async {
    final options = MutationOptions(
      document: gql(AuthorizationMutations.loginMutation),
      variables: {
        'email': email,
        'password': password,
      },
    );

    final result = await _client.value.mutate(options);

    if (result.hasException) {
      throw result.exception!;
    }

    return result.data!['loginUser']['id'].toString();
  }
}
