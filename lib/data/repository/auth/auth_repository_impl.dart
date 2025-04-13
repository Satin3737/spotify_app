import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/create_user_request.dart';
import 'package:spotify_app/data/models/auth/login_user_request.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';
import 'package:spotify_app/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> register(CreateUserRequest params) async {
    return await sl<AuthFirebaseService>().register(params);
  }

  @override
  Future<Either> login(LoginUserRequest params) async {
    return await sl<AuthFirebaseService>().login(params);
  }

  @override
  Future<void> logout() async {}
}
