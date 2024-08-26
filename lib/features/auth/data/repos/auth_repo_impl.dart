import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../domian/repos/auth_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../domian/entites/user_entity.dart';
import '../../../../core/services/data_service.dart';
import 'package:e_commerce/core/errors/excptions.dart';
import 'package:e_commerce/core/utils/backend_endpoints.dart';
import 'package:e_commerce/core/services/firebase_auth_Service.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl(
      {required this.firebaseAuthService, required this.databaseService});
  @override
  Future<Either<Failure, UserEntity>> createUser(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUser(
          email: email, password: password);
       var userEntity =   UserModel.fromFirebaseUser(user);
      await addUserData(userEntity: userEntity);
      return Right(
        userEntity,
      );
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

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('exception in auth repo impl with sign in ${e.toString()}');
      return Left(
        ServerFailure(errMessage: 'حدث خطأ ما رجاء المحاولة مرة اخرى'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('exception in auth repo impl with sign in ${e.toString()}');
      return Left(
        ServerFailure(errMessage: 'حدث خطأ ما رجاء المحاولة مرة اخرى'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() {
    throw UnimplementedError();
  }

  @override
  Future addUserData({required UserEntity userEntity}) async{
await databaseService.addData(path: BackendEndpoints.addUserData, data: userEntity.toMap());
  }
}
