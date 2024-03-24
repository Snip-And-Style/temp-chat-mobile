import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:snip_and_style/assembly/model/room/room_dto_from_json.dart';
import 'package:snip_and_style/data/datasources/graphql_client.dart';
import 'package:snip_and_style/data/datasources/queries/room_queries.dart';
import 'package:snip_and_style/data/model/room/room_dto.dart';
import 'package:snip_and_style/domain/gateway/room_gateway.dart';
import 'package:snip_and_style/domain/entity/room/room.dart';

class RoomGatewayImpl implements RoomGateway {
  RoomGatewayImpl(
    this._graphQLClientManager,
    this.roomDtoFromJson,
  );

  final GraphQLClientManager _graphQLClientManager;
  final RoomDtoFromJson roomDtoFromJson;

  @override
  Future<List<RoomDto>> getRooms() async {
    final options = QueryOptions(
      document: gql(RoomQueries.getRooms),
    );

    final result = await _graphQLClientManager.callGraphQLQuery(options);

    return (result.data?['rooms'] as List)
        .map((e) => roomDtoFromJson.create(e as Map<String, dynamic>))
        .toList();
  }
}
