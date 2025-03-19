import 'package:get_it/get_it.dart';
import 'package:spotify_app/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_app/data/sources/auth_firebase_service.dart';
import 'package:spotify_app/domain/repository/auth.dart';
import 'package:spotify_app/domain/usecases/auth/login.dart';
import 'package:spotify_app/domain/usecases/auth/register.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase());
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase());
}
