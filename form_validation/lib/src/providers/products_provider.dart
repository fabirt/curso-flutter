
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:form_validation/src/models/product_model.dart';

class ProductsProvider {

  final String _url = 'https://flutter-general.firebaseio.com';

  Future<bool> createProduct(ProductModel product) async {
    final url = '$_url/products.json';
    final resp = await http.post(url, body: productModelToJson(product));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

}