import 'package:dio/dio.dart';

abstract class UserDataSource {
  Future<Response> getUser();
}
