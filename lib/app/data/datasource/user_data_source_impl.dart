import 'package:dio/dio.dart';
import 'package:json_placeholder/app/data/datasource/user_data_source.dart';
import 'package:json_placeholder/app/data/remote/api/api.dart';

class UserDataSourceImpl implements UserDataSource {
  final Api api;

  UserDataSourceImpl({required this.api});

  @override
  Future<Response> getUser() async {
    return api.getEndpoint("users");
  }
}
