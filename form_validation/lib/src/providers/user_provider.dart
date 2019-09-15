import 'dart:convert';
import 'package:http/http.dart' as http;


// https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]

class UserProvider {

  final _firebaseKey = 'AIzaSyD-UdtmvHvgakripTKCoTwvCH-Q1RYvMF4';

  Future createUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseKey',
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      // Guardar token
      return { 'ok': true, 'token': decodedResp['idToken'] };
    } else {
      return { 'ok': false, 'message': decodedResp['error']['message'] };
    }
  }

}