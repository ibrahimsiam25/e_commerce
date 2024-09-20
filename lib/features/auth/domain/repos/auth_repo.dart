import 'package:dartz/dartz.dart';
import '../entites/user_entity.dart';
import 'package:e_commerce/core/errors/failures.dart';



abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);
 Future saveUserData({required UserEntity user});
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, UserEntity>> signinWithGoogle();
  Future<Either<Failure, UserEntity>> signinWithFacebook();

  Future addUserData({required UserEntity user});
   Future<UserEntity> getUserData({required String uid});
  Future<Either<Failure, UserEntity>> signinWithApple();
}
