import 'package:dio/dio.dart';
import 'package:json_placeholder/app/data/datasource/user_data_source.dart';
import 'package:json_placeholder/app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl({required this.dataSource});

  @override
  Future<Response> users() async {
    return await dataSource.getUser();
  }
}
