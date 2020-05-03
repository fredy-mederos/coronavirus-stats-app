import 'dart:html';
import 'dart:ui' as ui;

import 'package:coronavirus_stats_app/ui/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' as maps;

class GMapWeb extends StatefulWidget {
  final Stream<CountryDataList> dataStream;

  const GMapWeb({Key key, @required this.dataStream}) : super(key: key);

  @override
  _GMapWebState createState() => _GMapWebState();
}

class _GMapWebState extends State<GMapWeb> {
  final String htmlId = "7";

  maps.GMap map;

  void setUpMap() {
    final mapOptions = maps.MapOptions()
      ..zoom = 2
      ..mapTypeControl = false
      ..maxZoom = 6
      ..minZoom = 2
      ..zoomControl = false
      ..streetViewControl = false
      ..fullscreenControl = false
      ..styles = [
        maps.MapTypeStyle()
          ..elementType = maps.MapTypeStyleElementType.GEOMETRY
          ..stylers = [maps.MapTypeStyler()..color = "#ebe3cd"],
        maps.MapTypeStyle()
          ..elementType = maps.MapTypeStyleElementType.LABELS
          ..stylers = [maps.MapTypeStyler()..visibility = "off"],
        maps.MapTypeStyle()
          ..featureType = maps.MapTypeStyleFeatureType.ADMINISTRATIVE
          ..elementType = maps.MapTypeStyleElementType.GEOMETRY
          ..stylers = [maps.MapTypeStyler()..visibility = "off"],
        maps.MapTypeStyle()
          ..featureType = maps.MapTypeStyleFeatureType.ADMINISTRATIVE_COUNTRY
          ..elementType = maps.MapTypeStyleElementType.LABELS_TEXT_FILL
          ..stylers = [maps.MapTypeStyler()..visibility = "false"],
        maps.MapTypeStyle()
          ..featureType = maps.MapTypeStyleFeatureType.ADMINISTRATIVE_PROVINCE
          ..elementType = maps.MapTypeStyleElementType.LABELS
          ..stylers = [maps.MapTypeStyler()..visibility = "off"],
        maps.MapTypeStyle()
          ..featureType = maps.MapTypeStyleFeatureType.ADMINISTRATIVE_PROVINCE
          ..elementType = maps.MapTypeStyleElementType.GEOMETRY_STROKE
          ..stylers = [maps.MapTypeStyler()..visibility = "off"],
        maps.MapTypeStyle()
          ..featureType = maps.MapTypeStyleFeatureType.ADMINISTRATIVE_LAND_PARCEL
          ..stylers = [maps.MapTypeStyler()..visibility = "off"],
        maps.MapTypeStyle()
          ..featureType = maps.MapTypeStyleFeatureType.ADMINISTRATIVE_LOCALITY
          ..elementType = maps.MapTypeStyleElementType.LABELS_TEXT_FILL
          ..stylers = [maps.MapTypeStyler()..color = "#bdbdbd"],
        maps.MapTypeStyle()
          ..featureType = maps.MapTypeStyleFeatureType.POI_PARK
          ..elementType = maps.MapTypeStyleElementType.LABELS
          ..stylers = [maps.MapTypeStyler()..visibility = "off"],
        maps.MapTypeStyle()
          ..featureType = maps.MapTypeStyleFeatureType.ROAD
          ..elementType = maps.MapTypeStyleElementType.GEOMETRY
          ..stylers = [maps.MapTypeStyler()..visibility = "off"],
        maps.MapTypeStyle()
          ..featureType = maps.MapTypeStyleFeatureType.WATER
          ..elementType = maps.MapTypeStyleElementType.LABELS_TEXT_FILL
          ..stylers = [maps.MapTypeStyler()..visibility = "off"],
        maps.MapTypeStyle()
          ..featureType = maps.MapTypeStyleFeatureType.WATER
          ..elementType = maps.MapTypeStyleElementType.GEOMETRY
          ..stylers = [maps.MapTypeStyler()..color = "#b9d3c2"],
      ]
      ..center = new maps.LatLng(36.663, 22.404);

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    map = new maps.GMap(elem, mapOptions);

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      return elem;
    });
  }

  void setupData(CountryDataList data) {
    if (data != null) map.data.loadGeoJson('countries.geo.json');
  }

  @override
  Widget build(BuildContext context) {
    setUpMap();

    return StreamBuilder<CountryDataList>(
      stream: widget.dataStream,
      builder: (context, snapshot) {
        setupData(snapshot.data);
        return HtmlElementView(viewType: htmlId);
      },
    );
  }
}
