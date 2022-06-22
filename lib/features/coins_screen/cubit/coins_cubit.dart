import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/coin.dart';
import '../../../../../data/repository/coins_repository.dart';

part 'coins_state.dart';
part 'coins_cubit.freezed.dart';

class CoinsCubit extends Cubit<CoinsState> {
  final CoinsRepository coinsRepository;

  CoinsCubit({required this.coinsRepository}) : super(const CoinsState.initial()) {
    loadCoins();
  }

  Future<void> loadCoins() async {
    emit(const CoinsState.loading());
    try {
      var coinList = await coinsRepository.getCoins();
      emit(CoinsState.loaded(coinList));
    } catch (e) {
      emit(const CoinsState.error());
    }
  }
}
