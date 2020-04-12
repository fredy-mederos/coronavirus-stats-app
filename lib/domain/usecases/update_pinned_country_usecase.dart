abstract class UpdatePinnedCountryUseCase {
  ///Update a country given it's [countryCode] and set if it is pinned with: [isPinned]
  Future updatePinnedCountry({String countryCode, bool isPinned});
}
