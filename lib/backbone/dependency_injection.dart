import 'package:get_it/get_it.dart';
import 'package:snip_and_style/data/datasources/graphql_client.dart';
import 'package:snip_and_style/data/gateway/authorization/authorization_gateway.dart';
import 'package:snip_and_style/data/service/authorization_service.dart';
import 'package:snip_and_style/domain/gateway/authorization_gateway.dart';
import 'package:snip_and_style/domain/service/authorization_service.dart';
import 'package:snip_and_style/domain/usecase/login_usecase.dart';
import 'package:snip_and_style/domain/usecase/register_usecase.dart';
import 'package:snip_and_style/presentation/page/auth/login/bloc/login_bloc.dart';
import 'package:snip_and_style/presentation/page/auth/register/bloc/register_bloc.dart';

final GetIt getIt = GetIt.instance;

/// Registers all the necessary dependencies for the application.
void registerDependencies() {
  // BLoC
  // Registering the LoginBloc with its dependencies.
  getIt
    ..registerLazySingleton<LoginBloc>(
      () => LoginBloc(getIt.get<LoginUseCase>()),
    )
    ..registerLazySingleton<RegisterBloc>(
      () => RegisterBloc(getIt.get<RegisterUseCase>()),
    )

    // Service
    // Registering the AuthorizationService implementation.
    ..registerLazySingleton<AuthorizationService>(
      () => AuthorizationServiceImpl(getIt.get<AuthorizationGateway>()),
    )

    // Gateway
    // Registering the AuthorizationGateway implementation.
    ..registerLazySingleton<AuthorizationGateway>(
      () => AuthorizationGatewayImpl(getIt.get<GraphQLClientManager>()),
    )

    // UseCase
    // Registering the LoginUseCase implementation.
    ..registerLazySingleton<LoginUseCase>(
      () => LoginUseCaseImpl(getIt.get<AuthorizationService>()),
    )
    ..registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCaseImpl(getIt.get<AuthorizationService>()),
    )

    // Datasource
    // Registering a singleton for GraphQLClientManager.
    ..registerSingleton<GraphQLClientManager>(
      GraphQLClientManager(),
    );
}
