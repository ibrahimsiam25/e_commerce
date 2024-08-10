import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domian/repos/auth_repo.dart';
import '../../../domian/entites/user_entity.dart';


part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._authRepo) : super(SignInInitial());
  final AuthRepo _authRepo ; 

  Future<void> signIn(String email, String password)async{
    emit(SignInLoading());
    var result = await _authRepo.signIn(email, password);
    result.fold((l) {
      emit(SignInFailure(errorMessage: l.errMessage));
    }, (r) {
      emit(SignInSuccess(userEntity: r));
    });
  }
  Future<void> signInWithGoogle()async{
    emit(SignInLoading());
    var result = await _authRepo.signInWithGoogle();
    result.fold((l) {
      emit(SignInFailure(errorMessage: l.errMessage));
    }, (r) {
      emit(SignInSuccess(userEntity: r));
    });
  }
  Future<void> signInWithFacebook()async{
    emit(SignInLoading());
    var result = await _authRepo.signInWithFacebook();
    result.fold((l) {
      emit(SignInFailure(errorMessage: l.errMessage));
    }, (r) {
      emit(SignInSuccess(userEntity: r));
    });
  }
}
