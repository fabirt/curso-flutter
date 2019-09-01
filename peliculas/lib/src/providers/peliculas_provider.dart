import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apiKey = '0589092e1d50fe3d06e8bfc630a67eab';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> getNowPlaying() async {
    try {
      final url = Uri.https(_url, '3/movie/now_playing',
          {'api_key': _apiKey, 'language': _language});

      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      final peliculas = new Peliculas.fromJsonList(decodedData['results']);

      return peliculas.items;
    } catch (e) {
      print(':::::: ERR ::::');
      print(e);
      return [];
    }
  }
}
