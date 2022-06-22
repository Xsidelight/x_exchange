part of 'coins_cubit.dart';

@freezed
class CoinsState with _$CoinsState {
  const factory CoinsState.initial() = _Initial;
  const factory CoinsState.loading() = _Loading;
  const factory CoinsState.loaded(List<Coin> coinList) = _Loaded;
  const factory CoinsState.error() = _Error;
}
