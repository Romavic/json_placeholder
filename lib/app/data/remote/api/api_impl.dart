import 'package:dio/dio.dart';
import 'package:json_placeholder/app/data/remote/api/api.dart';

class ApiImpl implements Api {
  final Dio dio;

  ApiImpl({required this.dio});

  @override
  Future<Response> getEndpoint(
    String endpoint, {
    Map<String, dynamic>? query,
  }) {
    return dio.get(
      endpoint,
      queryParameters: query,
    );
  }
}
