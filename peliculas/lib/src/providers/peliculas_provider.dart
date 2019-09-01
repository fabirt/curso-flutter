import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/models/actores_model.dart';

class PeliculasProvider {
  String _apiKey      = '0589092e1d50fe3d06e8bfc630a67eab';
  String _url         = 'api.themoviedb.org';
  String _language    = 'es-ES';
  int _popularesPage  = 0;
  bool _isLoading     = false; 

  List<Pelicula> _populares = new List();

  final _popularesStream = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStream.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStream.stream;

  void disposeStreams() {
    _popularesStream?.close();
  }

  Future<List<Pelicula>> _processResponse(Uri url) async {
    try {
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

  Future<List<Pelicula>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});
    return await _processResponse(url);
  }

  Future<List<Pelicula>> getPopulars() async {
    if (_isLoading) return [];
    _isLoading = true;
    _popularesPage++;
    final url = Uri.https( _url, '3/movie/popular', {
      'api_key' : _apiKey,
      'language': _language,
      'page'    : _popularesPage.toString()
    });

    final resp = await _processResponse(url);

    _populares.addAll(resp);
    popularesSink(_populares);
    _isLoading = false;
    return resp;
  }

  Future<List<Actor>> getCast(String movieId) async {
    try {
      final url = Uri.https(_url, '3/movie/$movieId/credits', {
        'api_key' : _apiKey,
        'language': _language
      });
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      final cast = new Cast.fromJsonList(decodedData['cast']);
      return cast.cast;
    } catch (e) {
      print('EROOR');
      print(e);
      return [];
    }
  }

  Future<List<Pelicula>> searchMovies(String query) async {
    final url = Uri.https(_url, '3/search/movie', {
      'api_key' : _apiKey,
      'language': _language,
      'query'   : query
    });
    return await _processResponse(url);
  }

}
