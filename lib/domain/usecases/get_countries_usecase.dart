import 'package:coronavirus_stats_app/domain/models/country_model.dart';

abstract class GetCountriesUseCase {
  ///Returns the list of countries with stats. Use [allowCachedData] to force load the latest information from the external API.
  Future<List<CountryModel>> getCountries({bool allowCachedData = true});
}
