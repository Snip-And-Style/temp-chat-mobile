import 'package:snip_and_style/domain/entity/room/room.dart';
import 'package:snip_and_style/domain/service/room_service.dart';

abstract class GetRoomsUseCase {
  Future<List<Room>> getRooms();
}

class GetRoomsUseCaseImpl implements GetRoomsUseCase {
  GetRoomsUseCaseImpl(this._service);

  final RoomService _service;

  @override
  Future<List<Room>> getRooms() async => _service.getRooms();
}
