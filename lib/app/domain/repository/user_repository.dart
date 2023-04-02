import 'package:dio/dio.dart';

abstract class UserRepository {
  Future<Response> users();
}
