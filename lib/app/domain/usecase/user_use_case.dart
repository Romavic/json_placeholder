import 'package:dio/dio.dart';
import 'package:json_placeholder/app/domain/repository/user_repository.dart';

class UserUseCase {
  final UserRepository useCase;

  UserUseCase({required this.useCase});

  @override
  Future<Response> users() async {
    return await useCase.users();
  }
}
