import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/constants/remote_constants.dart';

class BaseDio {
  Dio init() {
    Dio _dio = new Dio();
    _dio.options.baseUrl = RemoteConstants.baseURL;
    _dio.options.connectTimeout = Duration(seconds: 15);
    _dio.options.receiveTimeout = Duration(seconds: 15);
    _dio.options.sendTimeout = Duration(seconds: 15);

    _dio.interceptors.add(PrettyDioLogger());

    return _dio;
  }
}
