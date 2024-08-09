import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../domian/repos/auth_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../domian/entites/user_entity.dart';
import 'package:e_commerce/core/errors/excptions.dart';
import 'package:e_commerce/core/services/firebase_auth_Service.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl(this.firebaseAuthService);
  @override
  Future<Either<Failure, UserEntity>> createUser(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUser(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      log('exception in auth repo impl with create user ${e.toString()}');
      return Left(
          ServerFailure(errMessage: 'حدث خطأ ما رجاء المحاولة مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthService.signIn(email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      log('exception in auth repo impl with sign in ${e.toString()}');
      return Left(
        ServerFailure(errMessage: 'حدث خطأ ما رجاء المحاولة مرة اخرى'),
      );
    }
  }
}
