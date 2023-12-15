import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:snip_and_style/data/datasources/graphql_client.dart';
import 'package:snip_and_style/data/gateway/authorization/authorization_gateway.dart';
import 'package:snip_and_style/data/service/authorization_service.dart';
import 'package:snip_and_style/domain/gateway/authorization_gateway.dart';
import 'package:snip_and_style/domain/service/authorization_service.dart';
import 'package:snip_and_style/domain/usecase/login_usecase.dart';
import 'package:snip_and_style/presentation/page/login/bloc/login_bloc.dart';

final GetIt getIt = GetIt.instance;

void registerDependencies() {
  getIt
    //BLoC
    ..registerLazySingleton<LoginBloc>(
      () => LoginBloc(
        getIt.get(),
      ),
    )
    //Service
    ..registerLazySingleton<AuthorizationService>(
      () => AuthorizationServiceImpl(
        getIt.get(),
      ),
    )
    //Gateway
    ..registerLazySingleton<AuthorizationGateway>(
      () => AuthorizationGatewayImpl(
        getIt.get(),
      ),
    )
    //UseCase
    ..registerLazySingleton<LoginUseCase>(
      () => LoginUseCaseImpl(
        getIt.get(),
      ),
    )
    //Datasource
    ..registerLazySingleton<ValueNotifier<GraphQLClient>>(initGraphQL);
}
