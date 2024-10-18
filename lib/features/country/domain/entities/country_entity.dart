import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String name;
  final Map<String, CurrencyEntity> currencies;
  final List<String> capital;
  final int area;
  final String flag;

  const CountryEntity({
    required this.name,
    required this.currencies,
    required this.capital,
    required this.area,
    required this.flag,
  });

  @override
  List<Object?> get props => [name, currencies, capital, area, flag];
}

class CurrencyEntity extends Equatable {
  final String name;
  final String symbol;

  const CurrencyEntity({
    required this.name,
    required this.symbol,
  });

  @override
  List<Object?> get props => [name, symbol];
}


// class CountryModel {
//   final String name;
//   final Map<String, Currency> currencies;
//   final List<String> capital;
//   final int area;
//   final String flag;

//   CountryModel({
//     required this.name,
//     required this.currencies,
//     required this.capital,
//     required this.area,
//     required this.flag,
//   });

//   factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
//         name: json["name"],
//         currencies: Map.from(json["currencies"])
//             .map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
//         capital: List<String>.from(json["capital"].map((x) => x)),
//         area: json["area"],
//         flag: json["flag"],
//       );
// }

// class Currency {
//   final String name;
//   final String symbol;

//   Currency({
//     required this.name,
//     required this.symbol,
//   });

//   factory Currency.fromJson(Map<String, dynamic> json) => Currency(
//         name: json["name"],
//         symbol: json["symbol"],
//       );
// }
