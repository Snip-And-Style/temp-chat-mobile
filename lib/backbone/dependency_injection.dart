import 'package:get_it/get_it.dart';
import 'package:snip_and_style/assembly/entity/room/room_from_dto.dart';
import 'package:snip_and_style/assembly/entity/user/user_from_dto.dart';
import 'package:snip_and_style/assembly/model/room/room_dto_from_json.dart';
import 'package:snip_and_style/assembly/model/user/user_dto_from_json.dart';
import 'package:snip_and_style/data/datasources/graphql_client.dart';
import 'package:snip_and_style/data/gateway/authorization_gateway.dart';
import 'package:snip_and_style/data/gateway/room_gateway.dart';
import 'package:snip_and_style/data/service/authorization_service.dart';
import 'package:snip_and_style/data/service/room_service.dart';
import 'package:snip_and_style/domain/gateway/authorization_gateway.dart';
import 'package:snip_and_style/domain/gateway/room_gateway.dart';
import 'package:snip_and_style/domain/service/authorization_service.dart';
import 'package:snip_and_style/domain/service/room_service.dart';
import 'package:snip_and_style/domain/usecase/get_rooms_usecase.dart';
import 'package:snip_and_style/domain/usecase/login_usecase.dart';
import 'package:snip_and_style/domain/usecase/register_usecase.dart';
import 'package:snip_and_style/presentation/page/auth/login/bloc/login_bloc.dart';
import 'package:snip_and_style/presentation/page/auth/register/bloc/register_bloc.dart';
import 'package:snip_and_style/presentation/page/messages/bloc/messages_bloc.dart';

final GetIt getIt = GetIt.instance;

/// Registers all the necessary dependencies for the application.
void registerDependencies() {
  getIt
    //Models
    ..registerLazySingleton<RoomDtoFromJson>(
      () => RoomDtoFromJson(
        getIt.get<UserDtoFromJson>(),
      ),
    )
    ..registerLazySingleton<UserDtoFromJson>(
      UserDtoFromJson.new,
    )

    //Entities
    ..registerLazySingleton<RoomFromDto>(
      () => RoomFromDto(
        getIt.get<UserFromDto>(),
      ),
    )
    ..registerLazySingleton<UserFromDto>(
      UserFromDto.new,
    )

    // BLoC

    ..registerLazySingleton<LoginBloc>(
      () => LoginBloc(getIt.get<LoginUseCase>()),
    )
    ..registerLazySingleton<RegisterBloc>(
      () => RegisterBloc(getIt.get<RegisterUseCase>()),
    )
    ..registerLazySingleton<MessagesBloc>(
      () => MessagesBloc(getIt.get<GetRoomsUseCase>()),
    )

    // Service
    ..registerLazySingleton<AuthorizationService>(
      () => AuthorizationServiceImpl(getIt.get<AuthorizationGateway>()),
    )
    ..registerLazySingleton<RoomService>(
      () => RoomServiceImpl(
        getIt.get<RoomGateway>(),
        getIt.get<RoomFromDto>(),
      ),
    )

    // Gateway
    ..registerLazySingleton<AuthorizationGateway>(
      () => AuthorizationGatewayImpl(getIt.get<GraphQLClientManager>()),
    )
    ..registerLazySingleton<RoomGateway>(
      () => RoomGatewayImpl(
        getIt.get<GraphQLClientManager>(),
        getIt.get<RoomDtoFromJson>(),
      ),
    )

    // UseCase
    ..registerLazySingleton<LoginUseCase>(
      () => LoginUseCaseImpl(getIt.get<AuthorizationService>()),
    )
    ..registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCaseImpl(getIt.get<AuthorizationService>()),
    )
    ..registerLazySingleton<GetRoomsUseCase>(
      () => GetRoomsUseCaseImpl(getIt.get<RoomService>()),
    )

    // DataSource
    ..registerSingleton<GraphQLClientManager>(
      GraphQLClientManager(),
    );
}
