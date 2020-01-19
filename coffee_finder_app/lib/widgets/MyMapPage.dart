import 'package:coffee_finder_app/api/CoffeeShopsApi.dart';
import 'package:coffee_finder_app/api/MyLocationApi.dart';
import 'package:coffee_finder_app/model/CoffeeShopsData.dart';
import 'package:coffee_finder_app/model/LocationData.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapPage extends StatefulWidget {
  MyMapPage ({Key key, this.title}) : super(key:key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyMapPageState();
  }

}

class _MyMapPageState extends State<MyMapPage> {

  GoogleMapController mapController;
  MyLocationData _myLocationData;
  CoffeeShopsData _shops;

  _addMarkers(CoffeeShopsData places){
    places.shopList.forEach((shop){
      mapController.addMarker(
        MarkerOptions(
          position: LatLng(
            shop.lat, 
            shop.lon
            ),
            infoWindowText: InfoWindowText(
              shop.name,
              ''
            )
        )
      );
     }
    );
  }

  Future<CoffeeShopsData> _getCoffeeShops() async {
    final shopsApi = CoffeeShopsApi.getInstance();
    return await shopsApi.getCoffeeShops(this._myLocationData);
  }

  Future<MyLocationData>_getLocation() async {
    final locationApi = MyLocationApi.getInstance();
    return await locationApi.getLocation();
  }

  @override
  void initState() {
    super.initState();

    _getLocation().then((location) {
      setState(() {
        _myLocationData = location;
      });
     }
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    _shops = await _getCoffeeShops();
    setState(() {
      mapController = controller;
      _addMarkers(_shops);
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        ),
        body: new Center(
          child: _myLocationData != null ? SizedBox(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              options: GoogleMapOptions(
                cameraPosition: CameraPosition(
                  target: LatLng(
                    _myLocationData.lat, 
                    _myLocationData.lon,
                    ),
                    zoom: 14.0
                )
                ),
            ),
          ): CircularProgressIndicator(
            strokeWidth: 4.0,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          )
        ),
      );
    }
  }