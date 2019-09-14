
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:form_validation/src/models/product_model.dart';

class ProductsProvider {

  final String _url = 'https://flutter-general.firebaseio.com';

  // Crear producto
  Future<bool> createProduct(ProductModel product) async {
    try {
      final url = '$_url/products.json';
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
      final url = '$_url/products.json';
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
      final url = '$_url/products/$id.json';
      final resp = await http.delete(url);
      print(json.decode(resp.body));
      return true;
    } catch (e) {
      return false;
    }
  }

}