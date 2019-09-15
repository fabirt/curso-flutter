import 'package:flutter/material.dart';

import 'package:form_validation/src/widgets/product_widget.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/models/product_model.dart';
import 'package:form_validation/src/preferences/user_preferences.dart';
import 'package:form_validation/src/utils/selloria_icon_icons.dart';

class HomePage extends StatelessWidget {

  final _prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {

    final productsBloc = Provider.productsBloc(context);
    productsBloc.getProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Selloria', style: TextStyle(fontFamily: 'DancingScript', fontSize: 26.0)),
        actions: <Widget>[
          IconButton(
            icon: Icon(SelloriaIcon.logout, color: Colors.white, size: 20.0),
            onPressed: () {
              _logout(context);
            },
          )
        ],
      ),
      body: _productsList(productsBloc),
      floatingActionButton: _buildFAB(context),
    );
  }

  Widget _productsList(ProductsBloc productsBloc) {

    return StreamBuilder(
      stream: productsBloc.productsStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data;
          return RefreshIndicator(
            color: Colors.deepPurple,
            onRefresh: () async {
              productsBloc.getProducts();
            },
            child: products.isEmpty 
            ? Center(
                child: Image(
                  image: AssetImage('assets/empty_state.jpg'),
                )
              )
            : ListView.builder(
                padding: EdgeInsets.only(bottom: 100.0),
                itemCount: products.length,
                itemBuilder: (context, i) => _productItem(context, productsBloc, products[i])
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _productItem(BuildContext context, ProductsBloc productsBloc, ProductModel product) {   
    return ProductWidget(
      product: product,
      onDelete: () {
        productsBloc.deleteProduct(product.id);
      },
      onTap: () => Navigator.pushNamed(context, 'product', arguments: product),     
    );
    // Dismissible(
    //   key: UniqueKey(),
    //   direction: DismissDirection.endToStart,
    //   background: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 20.0),
    //     color: Colors.red,
    //     child: Icon(Icons.delete, color: Colors.white),
    //     alignment: Alignment.centerRight,
    //   ),
    //   onDismissed: (direction) {
    //     productsBloc.deleteProduct(product.id);
    //   },
    //   confirmDismiss: (direction) async {
    //     return true;
    //   },
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

  void _logout(BuildContext context) {
    _prefs.lastPage = 'login';
    Navigator.pushReplacementNamed(context, 'login');
  }
}
