import 'package:snip_and_style/domain/service/authorization_service.dart';

abstract class CheckIfAuthorizedUseCase {
  Future<bool> checkIfAuthorized();
}

class CheckIfAuthorizedImpl implements CheckIfAuthorizedUseCase {
  CheckIfAuthorizedImpl(this._service);

  final AuthorizationService _service;

  @override
  Future<bool> checkIfAuthorized() async => _service.checkIfAuthorized();
}
