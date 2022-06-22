import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_exchange/data/models/coin.dart';
import 'package:x_exchange/data/repository/coins_repository_impl.dart';

part 'coins_state.dart';
part 'coins_cubit.freezed.dart';

class CoinsCubit extends Cubit<CoinsState> {
  final CoinsRepositoryImpl coinsRepository;

  CoinsCubit({required this.coinsRepository}) : super(const CoinsState.initial()) {
    loadCoins();
  }

  Future<void> loadCoins() async {
    emit(const CoinsState.loading());
    try {
      final coinList = await coinsRepository.getCoinInfo();
      emit(CoinsState.loaded(coinList));
    } catch (e) {
      emit(const CoinsState.error());
    }
  }
}
