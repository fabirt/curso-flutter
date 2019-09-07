import 'package:latlong/latlong.dart';

class ScanModel {

    int id;
    String type;
    String value;

    ScanModel({
        this.id,
        this.type,
        this.value,
    }) {
      if ( this.value.contains('http') ) {
        this.type = 'http';
      } else {
        this.type = 'geo';
      }
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => new ScanModel(
        id    : json["id"],
        type  : json["type"],
        value : json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id"    : id,
        "type"  : type,
        "value" : value,
    };

    LatLng getLatLng() {
      final data = value.substring(4).split(',');
      final lat = double.parse(data[0]);
      final lng = double.parse(data[1]);
      return LatLng(lat, lng);
    }
}