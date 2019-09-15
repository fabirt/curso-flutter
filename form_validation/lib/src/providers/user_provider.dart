import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:form_validation/src/environment/endpoints.dart';
import 'package:form_validation/src/preferences/user_preferences.dart';



class UserProvider {

  final _prefs = new UserPreferences();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      Endpoints.firebaseSignIn,
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      // Guardar token
      _prefs.token = decodedResp['idToken'];
      return { 'ok': true, 'token': decodedResp['idToken'] };
    } else {
      return { 'ok': false, 'message': decodedResp['error']['message'] };
    }
  }


  Future<Map<String, dynamic>> createUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      Endpoints.firebaseSignUp,
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      // Guardar token
      _prefs.token = decodedResp['idToken'];
      return { 'ok': true, 'token': decodedResp['idToken'] };
    } else {
      return { 'ok': false, 'message': decodedResp['error']['message'] };
    }
  }

  void setLastPage(String route) {
    _prefs.lastPage = route;
  }

}