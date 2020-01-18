import 'package:coffee_finder_app/config/config.dart';
import 'package:coffee_finder_app/model/CoffeeShopsData.dart';
import 'package:coffee_finder_app/model/LocationData.dart';
import 'package:google_maps_webservice/places.dart';

class CoffeeShopsApi {
  
  static CoffeeShopsApi _instance;
  static CoffeeShopsApi getInstance() => _instance ??= CoffeeShopsApi();

  Future<CoffeeShopsData> getCoffeeShops(MyLocationData location) async {

    final googlePlaces = GoogleMapsPlaces(apiKey);
    final response = await googlePlaces.searchNearbyWithRadius(
      Location(location.lat, location.lon),
      2000, 
        type: 'Cafe',
        keyword: 'coffee',
      );
      return CoffeeShopsData.convertToShops(response.results);
  }


}