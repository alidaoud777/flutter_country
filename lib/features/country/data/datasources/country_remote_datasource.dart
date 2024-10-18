import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';
import '../models/country_model.dart';

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> getCountryByLang(String lang);
}

const baseUrl = "https://countryinfoapi.com";

class CountryRemoteDataSourceImpWithHttp implements CountryRemoteDataSource {
  final http.Client client;

  CountryRemoteDataSourceImpWithHttp({required this.client});

  @override
  Future<List<CountryModel>> getCountryByLang(String lang) async {
    final response = await client.get(
        Uri.parse('$baseUrl/api/languages/$lang/countries'),
        headers: {'Content_Type': 'application/json'});

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body);

      final List<CountryModel> data =
          decodedJson.map((e) => CountryModel.fromJson(e)).toList();

      return data;
    } else {
      throw ServerException();
    }
  }
}
