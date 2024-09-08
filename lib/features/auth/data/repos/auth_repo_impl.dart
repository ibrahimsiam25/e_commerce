import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../domian/repos/auth_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../domian/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthService. signInWithEmailAndPassword(email: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      return Right(
        userEntity,
);
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
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
        User? user;
    try {
       user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(userEntity: userEntity);
      return Right(
        userEntity,
      );
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('exception in auth repo impl with create user ${e.toString()}');
      return Left(
          ServerFailure(errMessage: 'حدث خطأ ما رجاء المحاولة مرة اخرى'));
    }
  }


  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
       user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(userEntity: userEntity);
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      await deleteUser(user);
      log('exception in auth repo impl with sign in ${e.toString()}');
      return Left(

        ServerFailure(errMessage: 'حدث خطأ ما رجاء المحاولة مرة اخرى'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
       user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(userEntity: userEntity);
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      await deleteUser(user);
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
  Future addUserData({required UserEntity userEntity}) async {

    await databaseService.addData(
        path: BackendEndpoints.addUserData, data: userEntity.toMap(),
        documentId: userEntity.uId
        );
  }

 @override
  Future<UserEntity> getUserData({required String uId})async{
    var userData = await databaseService.getData(
        path: BackendEndpoints.getUserData, documentId: uId);
    return UserModel.fromJson(userData);
  }



    Future<void> deleteUser(User? user) async {
       if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }
  
 
  

}
