import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientManager {
  GraphQLClientManager() {
    _initClient();
  }
  final _secureStorage = const FlutterSecureStorage();

  late final ValueNotifier<GraphQLClient> clientNotifier;

  /// Initializes the GraphQL client with an HTTP link
  Future<void> _initClient() async {
    final backendUrl = dotenv.env['BACKEND_URL']!;

    // Retrieve the auth token from secure storage
    final authToken = await _secureStorage.read(key: 'authToken');

    final httpLink = HttpLink(
      '$backendUrl/graphql',
      defaultHeaders: {'Cookie': authToken ?? ''},
    );

    clientNotifier = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
  }

  /// Updates the session with a new cookie for subsequent requests.
  Future<void> updateSession(QueryResult<Object?> result) async {
    // Extracting the cookie from the response for session management.
    final cookie = result.context
        .entry<HttpLinkResponseContext>()
        ?.headers?['set-cookie']
        .toString();

    if (cookie != null) {
      await _secureStorage.write(key: 'authToken', value: cookie);

      final backendUrl = dotenv.env['BACKEND_URL']!;
      final httpLink = HttpLink(
        '$backendUrl/graphql',
        defaultHeaders: {'Cookie': cookie},
      );

      clientNotifier.value = GraphQLClient(
        link: httpLink,
        cache: clientNotifier.value.cache,
      );
    }
  }

  /// Handles GraphQL mutation calls including error handling.
  Future<QueryResult> callGraphQLMutation(MutationOptions options) async {
    final result = await clientNotifier.value.mutate(options);
    if (result.hasException) {
      _handleErrors(result);
    }
    return result;
  }

  Future<QueryResult> callGraphQLQuery(QueryOptions options) async {
    final result = await clientNotifier.value.query(options);
    if (result.hasException) {
      _handleErrors(result);
    }
    return result;
  }

  /// Centralizes error handling for GraphQL operations.
  void _handleErrors(QueryResult result) {
    if (result.exception!.graphqlErrors.isNotEmpty) {
      final errors =
          result.exception!.graphqlErrors.map((e) => e.message).join(', ');
      throw Exception(errors);
    }
    if (result.exception!.linkException != null) {
      throw Exception(result.exception!.linkException!.toString());
    }

    throw Exception('An unknown error occurred');
  }
}
