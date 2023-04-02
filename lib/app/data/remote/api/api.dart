import 'package:dio/dio.dart';

abstract class Api {
  Future<Response> getEndpoint(
    String endpoint, {
    Map<String, dynamic>? query,
  });
}
