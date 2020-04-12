import 'package:coronavirus_stats_app/domain/models/country_model.dart';

abstract class GetCountryByCodeUseCase {
  ///Returns a country with stats given a [countryCode]. Use [allowCachedData] to force load the latest information from the external API.
  Future<CountryModel> getCountryByCode({String countryCode, bool allowCachedData = true});
}
