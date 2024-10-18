import 'package:basketball_training/core/NetWorking/API.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Dio getDio() {
    Duration time = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();

      // تعيين baseUrl ووقت الاتصال
      dio!
        ..options.baseUrl = APIConstants.apiBaseUrl // تعيين رابط الأساس
        ..options.connectTimeout = time
        ..options.receiveTimeout = time;

      // إضافة Interceptor
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static addDioInterceptor() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
    );
  }
}
