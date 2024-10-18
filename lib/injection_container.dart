import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/network/network_info.dart';
import 'core/routes/routes.dart';
import 'features/country/data/datasources/country_remote_datasource.dart';
import 'features/country/data/repositories/country_repository_impl.dart';
import 'features/country/domain/repositories/country_repository.dart';
import 'features/country/domain/usecases/get_country_by_lang_usecase.dart';
import 'features/country/presentation/bloc/country/country_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// features

  sl.registerFactory(() => CountryBloc(getCountriesByLangUseCase: sl.call()));

  sl.registerLazySingleton(() => GetCountriesByLangUseCase(sl.call()));

  sl.registerLazySingleton<CountryRepository>(
    () => CountryRepositoryImp(
      countryRemoteDataSource: sl.call(),
      networkInfo: sl.call(),
    ),
  );

  sl.registerLazySingleton<CountryRemoteDataSource>(
    () => CountryRemoteDataSourceImpWithHttp(
      client: sl.call(),
    ),
  );

  //core

  sl.registerLazySingleton<NetworkInfo>(() => NetworlInfoImp(sl.call()));

  sl.registerFactory(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerSingleton<AppRouter>(AppRouter());
}
