import 'package:location/location.dart';

class MyLocationApi{

  Location _location = Location();
  String error;

  static MyLocationApi _instance;
  static MyLocationApi getInstance() => _instance ??= MyLocationApi();
  
}