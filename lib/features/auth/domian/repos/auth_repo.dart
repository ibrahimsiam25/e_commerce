import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domian/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUser(String email, String password,String name);

  Future<Either<Failure, UserEntity>> signIn(String email, String password);
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, UserEntity>> signInWithApple();

  Future addUserData({required UserEntity userEntity});
}