import 'package:Nexus/data/repositories/auth_repository.dart';
import 'package:Nexus/domain/models/responses/gen_models.dart';
import 'package:flutter/foundation.dart';

class ProfileViewModel extends ChangeNotifier{
  final AuthRepository repository;

  ProfileViewModel({required this.repository});

  UserResponse? get user => repository.currentUser;



}