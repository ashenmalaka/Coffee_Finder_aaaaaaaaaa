import 'package:coffee_finder_app/config/config.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {

  CoffeeCard({this.shopImage, this.shopName});

  final String shopImage;
  final String shopName;
  static const _endpoint = 'https://maps.googleapis.com/maps/api/place/photo';

  String _placesPhotoApi(){
    return _endpoint + '?maxHeight=150&photoreference=' + shopImage + '&key=' + apiKey;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }}