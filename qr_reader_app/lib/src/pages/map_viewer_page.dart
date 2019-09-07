import 'package:latlong/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';

class MapViewerPage extends StatefulWidget {
  @override
  _MapViewerPageState createState() => _MapViewerPageState();
}

class _MapViewerPageState extends State<MapViewerPage> {
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {},
          )
        ],
      ),
      body: _buildFlutterMap(scan)
    );
  }

  Widget _buildFlutterMap(ScanModel scan) {
    return FlutterMap(
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 10
      ),
      layers: [
        _buildMap()
      ],
    );
  }

  _buildMap() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoiZmFuZGlnIiwiYSI6ImNrMDl5NHRxcjBjeTIzY21uYTVsdnV4cXIifQ.PnjbisWEZwBrhAJqYi_aPg',
        'id': 'mapbox.streets'
      }
    );
  }
}