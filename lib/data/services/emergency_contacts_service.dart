abstract class EmergencyContactsService{
  Future<Map<String, dynamic>> getEmergencyContacts({int page = 0, int size = 5,});
}