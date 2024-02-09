import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientManager {
  /// A ValueNotifier that holds the instance of GraphQLClient.
  /// This allows for reactive updates to the client across the app.
  late ValueNotifier<GraphQLClient> client;

  /// Initializes the GraphQLClient with default settings.
  /// This should be called at the start of the app.
  void init() {
    // Create an HTTP link with the backend URL from environment variables.
    final httpLink = HttpLink(
      '${dotenv.env['BACKEND_URL']}/graphql',
    );

    // Initialize the GraphQLClient and wrap it in a ValueNotifier
    client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache:
            GraphQLCache(store: HiveStore()), // HiveStore is used for caching.
      ),
    );
  }

  /// Updates the GraphQLClient with a new HTTP link.
  /// This can be used to change the endpoint or headers dynamically.
  ///
  /// [newHttpLink]: The new HttpLink to be used by the GraphQLClient.
  void updateClient(HttpLink newHttpLink) {
    // Update the client while preserving the existing cache.
    client.value = GraphQLClient(
      link: newHttpLink,
      cache: client.value.cache,
    );
  }
}
