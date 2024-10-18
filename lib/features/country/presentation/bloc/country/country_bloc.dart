import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_country_app/features/country/domain/usecases/get_country_by_lang_usecase.dart';
import '../../../../../core/error/failure_error.dart';
import '../../../../../core/strings/error.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/country_entity.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  List<CountryEntity>? countriesData;

  int countryIndex = 0;
  bool fromDetails = false;

  final GetCountriesByLangUseCase getCountriesByLangUseCase;

  CountryBloc({
    required this.getCountriesByLangUseCase,
  }) : super(CountryInitialState()) {
    on<CountryEvent>(
      (event, emit) async {
        if (event is GetCountriesByLangEvent) {
          emit(LoadingCountreisState());

          final failureOrData =
              await getCountriesByLangUseCase.call(event.lang);

          failureOrData.fold(
            (failure) {
              emit(ErrorCountreisState(message: failureMessage(failure)));
            },
            (data) {
              data.removeWhere(
                (element) => element.name == 'Israel',
              );
              countriesData = data;
              emit(LoadedCountreisState(countries: data));
            },
          );
        }
        ///////////////////////
        if (event is RefreshCountriesEvent) {
          emit(LoadingCountreisState());

          final failureOrData =
              await getCountriesByLangUseCase.call(event.lang);

          failureOrData.fold(
            (failure) {
              emit(ErrorCountreisState(message: failureMessage(failure)));
            },
            (data) {
              data.removeWhere(
                (element) => element.name == 'Israel',
              );
              countriesData = data;
              emit(LoadedCountreisState(countries: data));
            },
          );
        }
        /////////////////////////
        if (event is GetCountriesBiggerAreaEvent) {
          emit(LoadingCountreisState());

          final data = countriesData!.where(
            (element) => element.area > event.area,
          );

          countriesData = data.toList();

          countriesData!.removeWhere(
            (element) => element.name == 'Israel',
          );

          emit(LoadedCountreisState(countries: countriesData!));
        }
      },
    );
  }

  String failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return serverErrorMessage;
      case const (EmptyCachFailure):
        return cachErrorMessage;
      case const (OffLineFailure):
        return noInternetErrorMessage;
      default:
        return 'un Expected error , please try again later';
    }
  }
}
