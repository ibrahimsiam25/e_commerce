import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:e_commerce/core/errors/excptions.dart';

class FirebaseAuthService {
  Future<User> createUser(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("exception in firebase auth service in create user  ${e.toString()} and message is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفةجداً');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'ذلك البريد الالكتروني مستخدم من قبل');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الالكتروني غير صالح');
      }
       else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'فشل الاتصال بالانترنت');
      } else {
        throw CustomException(message: 'حدث خطأ ما رجاء المحاولة مرة اخرى');
      }
    } catch (e) {
      log("exception in firebase auth service create user ${e.toString()} ");
      throw CustomException(message: e.toString());
    }
  }

  Future<User> signIn({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("exception in firebase auth service in sign in ${e.toString()} and message is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'البريد الالكتروني او كلمة المرور غير صحيح '); 
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'البريد الالكتروني او كلمة المرور غير صحيح ');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'فشل الاتصال بالانترنت');
      } else {
        throw CustomException(message: 'حدث خطأ ما رجاء المحاولة مرة اخرى');
      }
    } catch (e) {
      log("exception in firebase auth service sign in ${e.toString()} ");
      throw CustomException(message: e.toString());
    }
  }

Future<User> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
}
}
