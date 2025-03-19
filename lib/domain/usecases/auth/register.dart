import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecase/usecase.dart';
import 'package:spotify_app/data/models/auth/create_user_request.dart';
import 'package:spotify_app/domain/repository/auth.dart';
import 'package:spotify_app/service_locator.dart';

class RegisterUseCase implements UseCase<Either, CreateUserRequest> {
  @override
  Future<Either> call({required CreateUserRequest params}) {
    return sl<AuthRepository>().register(params);
  }
}
