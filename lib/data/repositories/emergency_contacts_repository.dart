import 'package:nexus_multiplatform/domain/models/responses/gen_models.dart';

abstract class EmergencyContactsRepository {
  Future<PaginatedResponse<EmergencyContactsResponse>> getEmergencyContacts({int page = 0, int size = 5,});
}