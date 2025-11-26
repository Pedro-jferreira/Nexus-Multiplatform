
 abstract class AuthService{

 Future<Map<String, dynamic>> login({required Map<String,dynamic> loginRequest});
 Future<void> logout();
 Future<void> updatePassword({required String userId, required Map<String, dynamic> request});
 }