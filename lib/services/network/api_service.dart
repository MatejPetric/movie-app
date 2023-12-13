import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/services/network/env_config.dart';

enum HttpMethod { get, post, put, patch, delete }

class ApiService {
  Dio dio = Dio(BaseOptions(
    receiveDataWhenStatusError: true,
    validateStatus: (status) => status! < 400,
    baseUrl: envConfig.baseUrl,
    queryParameters: {
      'api_key': envConfig.apiKey,
      'language': Platform.localeName
    },
    connectTimeout: const Duration(milliseconds: 5000),
  ));

  Options defaultOptions =
      Options(headers: {'Authorization': 'Bearer ${envConfig.bearer} '});

  Future request({
    required String endpoint,
    required HttpMethod httpMethod,
    required Function(dynamic responseData) onSuccess,
    Function(String error)? onError,
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
  }) async {
    try {
      Response response = await dio.request(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: options ?? defaultOptions,
      );

      return onSuccess(response.data);
    } on DioException catch (e) {
      if (onError != null) {
        onError('$e');
      }
    }
    return null;
  }
}

final apiServiceProvider = Provider((ref) {
  return ApiService();
});
