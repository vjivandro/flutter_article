import 'package:articleapp/core/shared/constant.dart';
import 'package:dio/dio.dart';

class NetworkClient {
  final Dio _dio;
  final Constant constant;

  NetworkClient(this._dio, {required this.constant}) {
    _dio.options = BaseOptions(baseUrl: constant.BASE_API_URL);
  }

  get dio => _dio;
}