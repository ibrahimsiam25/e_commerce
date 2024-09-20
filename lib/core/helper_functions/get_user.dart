import 'dart:convert';
import '../../constants.dart';
import '../services/shared_preferences_singleton.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/domain/entites/user_entity.dart';



UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
