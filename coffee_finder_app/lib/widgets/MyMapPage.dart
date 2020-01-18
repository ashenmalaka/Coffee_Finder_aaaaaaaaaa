import 'package:coffee_finder_app/api/MyLocationApi.dart';
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

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      mapController = controller;
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
                    )
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