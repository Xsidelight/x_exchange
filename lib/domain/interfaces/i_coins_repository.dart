import 'package:x_exchange/data/models/coin.dart';

abstract class ICoinsRepository {
  Future<List<Coin>> getCoinInfo();
}
