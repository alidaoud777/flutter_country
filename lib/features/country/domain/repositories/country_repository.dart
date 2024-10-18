import 'package:dartz/dartz.dart';
import '../../../../core/error/failure_error.dart';
import '../entities/country_entity.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<CountryEntity>>> getCountryByLang({
    required String lang,
  });
}
