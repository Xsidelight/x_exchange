import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin.g.dart';

@JsonSerializable()
class Coin {
  final String name;
  final String unit;
  final double value;
  final String type;

  Coin({
    required this.name,
    required this.unit,
    required this.value,
    required this.type,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);
}
