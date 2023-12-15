import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  final String bearerToken;

  CustomInterceptor({required this.bearerToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $bearerToken';
    super.onRequest(options, handler);
  }
}
