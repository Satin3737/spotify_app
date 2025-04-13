import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/create_user_request.dart';
import 'package:spotify_app/data/models/auth/login_user_request.dart';

abstract class AuthRepository {
  Future<Either> register(CreateUserRequest params);
  Future<Either> login(LoginUserRequest params);
  Future<void> logout();
}
