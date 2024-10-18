import 'package:dartz/dartz.dart';
import 'package:flutter_country_app/core/error/exception.dart';
import 'package:flutter_country_app/core/error/failure_error.dart';
import 'package:flutter_country_app/features/country/domain/repositories/country_repository.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/country_remote_datasource.dart';
import '../models/country_model.dart';

class CountryRepositoryImp implements CountryRepository {
  final CountryRemoteDataSource countryRemoteDataSource;
  final NetworkInfo networkInfo;

  CountryRepositoryImp({
    required this.countryRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CountryModel>>> getCountryByLang({
    required String lang,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts =
            await countryRemoteDataSource.getCountryByLang(lang);

        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OffLineFailure());
    }
  }
}
