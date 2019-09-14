import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/models/product_model.dart';
import 'package:form_validation/src/providers/products_provider.dart';

class HomePage extends StatelessWidget {

  final productsProvider = new ProductsProvider();

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: _productsList(),
      floatingActionButton: _buildFAB(context),
    );
  }

  Widget _productsList() {
    return FutureBuilder(
      future: productsProvider.getProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) => _productItem(context, products[i])
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _productItem(BuildContext context, ProductModel product) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red,),
      onDismissed: (direction) {

      },
      child: ListTile(
        title: Text('${product.title} - ${product.price}'),
        subtitle: Text('${product.id}'),
        onTap: () => Navigator.pushNamed(context, 'product')
      ),
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () {
        Navigator.pushNamed(context, 'product');
      },
    );
  }
}
