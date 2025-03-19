import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecase/usecase.dart';
import 'package:spotify_app/data/models/auth/login_user_request.dart';
import 'package:spotify_app/domain/repository/auth.dart';
import 'package:spotify_app/service_locator.dart';

class LoginUserUseCase implements UseCase<Either, LoginUserRequest> {
  @override
  Future<Either> call({required LoginUserRequest params}) {
    return sl<AuthRepository>().login(params);
  }
}
