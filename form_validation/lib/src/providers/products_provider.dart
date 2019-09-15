
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

import 'package:form_validation/src/preferences/user_preferences.dart';
import 'package:form_validation/src/models/product_model.dart';

class ProductsProvider {

  final String _url = 'https://flutter-general.firebaseio.com';
  final prefs = new UserPreferences();

  // Crear producto
  Future<bool> createProduct(ProductModel product) async {
    try {
      final url = '$_url/products.json?auth=${ prefs.token }';
      final resp = await http.post(url, body: productModelToJson(product));
      final decodedData = json.decode(resp.body);
      print(decodedData);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Obtener productos
  Future<List<ProductModel>> getProducts() async {
    try {
      final url = '$_url/products.json?auth=${ prefs.token }';
      final resp = await http.get(url);
      final Map<String, dynamic> decodedData = json.decode(resp.body);
      final List<ProductModel> products = new List();
      if (decodedData == null) return [];
      decodedData.forEach((id, prod) {
        final prodTemp = ProductModel.fromJson(prod);
        prodTemp.id = id;
        products.add(prodTemp);
      });
      return products;     
    } catch (e) {
      return [];     
    }
  }

  // Eliminar producto
  Future<bool> deleteProduct(String id) async {
    try {
      final url = '$_url/products/$id.json?auth=${ prefs.token }';
      final resp = await http.delete(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Editar producto
  Future<bool> updateProduct(ProductModel product) async {
    try {
      final url = '$_url/products/${product.id}.json?auth=${ prefs.token }';
      final resp = await http.put(url, body: productModelToJson(product));
      final decodedData = json.decode(resp.body);
      print(decodedData);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> uploadImage(File image) async {
    try {
      final url = Uri.parse('https://api.cloudinary.com/v1_1/dgtsbgju3/image/upload?upload_preset=tp0kckw7');
      final mimeType = mime(image.path).split('/');
      final imageUploadRequest = http.MultipartRequest(
        'POST',
        url
      );
      final file = await http.MultipartFile.fromPath(
        'file',
        image.path,
        contentType: MediaType(mimeType[0], mimeType[1])
      );
      imageUploadRequest.files.add(file);
      final streamResponse = await imageUploadRequest.send();
      final resp = await http.Response.fromStream(streamResponse);
      if (resp.statusCode != 200 && resp.statusCode != 201) {
        return null;
      } else {
        final responseData = json.decode(resp.body);
        return responseData['secure_url'];
      }
    } catch (e) {
      return null;
    }
    
  }

}