import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';

class MapViewerPage extends StatefulWidget {
  @override
  _MapViewerPageState createState() => _MapViewerPageState();
}

class _MapViewerPageState extends State<MapViewerPage> {
  
  MapController mapController = new MapController();
  final mapOptions = ['streets', 'dark', 'light', 'outdoors', 'satellite'];
  int currentOptionIndex = 0;
  
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              mapController.move(scan.getLatLng(), 15);
            },
          )
        ],
      ),
      body: _buildFlutterMap(scan),
      floatingActionButton: _buildFAB(context),
    );
  }

  Widget _buildFlutterMap(ScanModel scan) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 15
      ),
      layers: [
        _buildMap(),
        _buildMarkers(scan)
      ],
    );
  }

  _buildMap() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoiZmFuZGlnIiwiYSI6ImNrMDl5NHRxcjBjeTIzY21uYTVsdnV4cXIifQ.PnjbisWEZwBrhAJqYi_aPg',
        'id': 'mapbox.${mapOptions[currentOptionIndex]}'
        // streets, dark, light, outdoors, satellite
      }
    );
  }

  _buildMarkers(ScanModel scan) {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (context) {
            return Container(
              child: Icon(
                Icons.location_on,
                size: 45.0,
                color: Theme.of(context).primaryColor,
              ),
            );
          }
        )
      ]
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.movie_filter),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        currentOptionIndex++;
        if (currentOptionIndex >= mapOptions.length) currentOptionIndex = 0;
        setState((){});
      },
    );
  }
}