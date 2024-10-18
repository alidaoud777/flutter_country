import 'package:dartz/dartz.dart';
import 'package:flutter_country_app/features/country/domain/entities/country_entity.dart';
import '../../../../core/error/failure_error.dart';
import '../repositories/country_repository.dart';

class GetCountriesByLangUseCase {
  final CountryRepository countryRepository;

  GetCountriesByLangUseCase(this.countryRepository);

  Future<Either<Failure, List<CountryEntity>>> call(String lang) async {
    return await countryRepository.getCountryByLang(lang: lang);
  }
}
