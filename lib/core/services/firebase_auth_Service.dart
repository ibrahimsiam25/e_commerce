import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/core/errors/excptions.dart';



class FirebaseAuthService{
  Future<User>createUser({required String email,required String password})async{  
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  return credential.user!;
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    throw CustomException(message: 'كلمة المرور ضعيفةجداً');
  } else if (e.code == 'email-already-in-use') {
    throw CustomException(message: 'ذلك البريد الالكتروني مستخدم من قبل');
  } else{
    throw CustomException(message: 'حدث خطأ ما رجاء المحاولة مرة اخرى');
  }
} catch (e) {
  throw CustomException(message: e.toString());
}
    }
}