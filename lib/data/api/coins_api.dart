import 'package:dio/dio.dart';
import 'package:x_exchange/data/api/dio_api.dart';

class CoinsApi extends DioApi {
  Future<Response> fetchCoinsList() async {
    try {
      final response = await dio.get('');
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
