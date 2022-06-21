import 'package:dio/dio.dart';

import '../models/coin.dart';

class CoinsRepository {
  final _dio = Dio();

  Future<List<Coin>> getCoins() async {
    var coinList = <Coin>[];
    try {
      var response = await _dio.get('https://api2.binance.com/api/v3/ticker/24hr');
      response.data.forEach((json) {
        var coin = Coin.fromJson(json);
        coinList.add(coin);
      });
      return coinList;
    } catch (e) {
      throw Exception();
    }
  }
}
