import 'package:hive/hive.dart';

part 'coin_model.g.dart'; // Generated file

@HiveType(typeId: 0) // Unique ID for the type
class CoinModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String country;

  @HiveField(3)
  final String years;

  @HiveField(4)
  final String coinType;

  @HiveField(5)
  final String shape;

  @HiveField(6)
  final String category;

  @HiveField(7)
  final String orientation;

  @HiveField(8)
  final String composition;

  @HiveField(9)
  final String obverse;

  @HiveField(10)
  final String reverse;

  @HiveField(11)
  final String minting;

  @HiveField(12)
  final String marketValue;

  @HiveField(13)
  final String rarity;

  @HiveField(14)
  final String size;

  @HiveField(15)
  final String picture;

  CoinModel({
    required this.id,
    required this.title,
    required this.country,
    required this.years,
    required this.coinType,
    required this.shape,
    required this.category,
    required this.orientation,
    required this.composition,
    required this.obverse,
    required this.reverse,
    required this.minting,
    required this.marketValue,
    required this.rarity,
    required this.size,
    required this.picture,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'],
      title: json['title'],
      country: json['country'],
      years: json['years'],
      coinType: json['coin_type'],
      shape: json['shape'],
      category: json['category'],
      orientation: json['orientation'],
      composition: json['composition'],
      obverse: json['obverse'],
      reverse: json['reverse'],
      minting: json['minting'],
      marketValue: json['market_value'],
      rarity: json['rarity'],
      size: json['size'],
      picture: json['picture'],
    );
  }
}
