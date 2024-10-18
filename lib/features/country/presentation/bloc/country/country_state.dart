part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryInitialState extends CountryState {}

class LoadingCountreisState extends CountryState {}

class LoadedCountreisState extends CountryState {
  final List<CountryEntity> countries;

  const LoadedCountreisState({required this.countries});

  @override
  List<Object> get props => [countries];
}

class ErrorCountreisState extends CountryState {
  final String message;

  const ErrorCountreisState({required this.message});

  @override
  List<Object> get props => [message];
}
