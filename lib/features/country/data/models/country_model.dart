import '../../domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel({
    required super.name,
    required super.currencies,
    required super.capital,
    required super.area,
    required super.flag,
  });
  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"],
        currencies: Map.from(json["currencies"]).map((k, v) =>
            MapEntry<String, CurrencyModel>(k, CurrencyModel.fromJson(v))),
        capital: List<String>.from(json["capital"].map((x) => x)),
        area: json["area"],
        flag: json["flag"],
      );
}

class CurrencyModel extends CurrencyEntity {
  const CurrencyModel({
    required super.name,
    required super.symbol,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        name: json["name"],
        symbol: json["symbol"],
      );
}
