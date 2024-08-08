import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domian/entites/user_entity.dart';
import 'package:e_commerce/features/auth/domian/repos/auth_repo.dart';


part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.authRepo) : super(CreateUserInitial());
  final AuthRepo authRepo;
  Future<void> creatUser(String email,String password,String name)async{
    emit(CreateUserLoading());
    final result = await authRepo.createUser(email, password, name);
    result.fold((l) {
      emit(CreateUserFailure(errorMessage: l.errMessage));
    }, (r) {
      emit(CreateUserSuccess(userEntity: r));
    });
  }
}
