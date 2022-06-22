import 'package:x_exchange/data/api/coins_api.dart';
import 'package:x_exchange/data/models/coin.dart';
import 'package:x_exchange/domain/interfaces/i_coins_repository.dart';

class CoinsRepositoryImpl extends ICoinsRepository {
  final CoinsApi _coinsApi;

  CoinsRepositoryImpl(this._coinsApi);

  @override
  Future<List<Coin>> getCoinInfo() async {
    final coinList = <Coin>[];
    try {
      final response = await _coinsApi.fetchCoinsList();
      response.data.forEach((json) {
        final coin = Coin.fromJson(json);
        coinList.add(coin);
      });
      return coinList;
    } catch (e) {
      throw Exception();
    }
  }
}
