import 'package:dio/dio.dart';
import 'package:x_exchange/domain/constants/constants.dart';

abstract class DioApi {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: DioUrls.baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    ),
  );
}
