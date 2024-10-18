part of 'country_bloc.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

class GetCountriesByLangEvent extends CountryEvent {
  final String lang;

  const GetCountriesByLangEvent({required this.lang});

  @override
  List<Object> get props => [lang];
}

class RefreshCountriesEvent extends CountryEvent {
  final String lang;

  const RefreshCountriesEvent({required this.lang});

  @override
  List<Object> get props => [lang];
}

class GetCountriesBiggerAreaEvent extends CountryEvent {
  final int area;

  const GetCountriesBiggerAreaEvent({required this.area});

  @override
  List<Object> get props => [area];
}
