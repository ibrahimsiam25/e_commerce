import 'package:get_it/get_it.dart';
import 'package:e_commerce/core/services/data_service.dart';
import 'package:e_commerce/core/services/firestore_service.dart';
import 'package:e_commerce/core/services/firebase_auth_Service.dart';
import 'package:e_commerce/features/auth/domian/repos/auth_repo.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
}
