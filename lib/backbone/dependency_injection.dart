import 'package:get_it/get_it.dart';
import 'package:snip_and_style/data/gateway/authorization_gateway.dart';
import 'package:snip_and_style/data/service/authorization_service.dart';
import 'package:snip_and_style/domain/gateway/authorization_gateway.dart';
import 'package:snip_and_style/domain/service/authorization_service.dart';
import 'package:snip_and_style/presentation/page/login/bloc/login_bloc.dart';

final GetIt getIt = GetIt.instance;

void registerDependencies() {
  getIt
    //BLoC
    ..registerLazySingleton<LoginBloc>(LoginBloc.new)
    //Service
    ..registerLazySingleton<AuthorizationService>(AuthorizationServiceImpl.new)
    //Gateway
    ..registerLazySingleton<AuthorizationGateway>(AuthorizationGatewayImpl.new);
}
