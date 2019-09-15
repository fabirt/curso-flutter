import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/models/product_model.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final formKey     = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ProductsBloc productsBloc;
  ProductModel product = new ProductModel();
  bool _isLoading = false;
  File photo;


  @override
  Widget build(BuildContext context) {
    productsBloc = Provider.productsBloc(context);
    final ProductModel prodArg = ModalRoute.of(context).settings.arguments;
    if (prodArg != null) {
      product = prodArg;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _pickImage,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _openCamera,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _builImage(),
                _buildName(),
                _buildPrice(),
                _buildSwitch(),
                _buildButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value) => product.title = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildPrice() {
    return TextFormField(
      initialValue: product.price.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      onSaved: (value) => product.price = double.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Sólo números';
        }
      },
    );
  }

  Widget _buildButton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _isLoading ? null : _submit,
    );
  }

  Widget _buildSwitch() {
    return SwitchListTile(
      value: product.available,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(() {
        product.available = value;
      }),
    );
  }

  void _submit() async {
    if( !formKey.currentState.validate() ) return;
    formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    if (photo != null) {
      product.photoUrl = await productsBloc.uploadImage(photo);
    }

    if (product.id == null) {
      productsBloc.createProduct(product);
    } else {
      productsBloc.updateProduct(product);
    }
    _showSnackbar('Registro guardado');
    Navigator.pop(context);
  }

  void _showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2)
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  Widget _builImage() {
    if (product.photoUrl != null) {
      return FadeInImage(
        image: NetworkImage(product.photoUrl),
        placeholder: AssetImage('assets/no-image.png'),
        height: 250.0,
        fit: BoxFit.cover
      );
    } else {
      return Image(
        image: AssetImage( photo?.path ?? 'assets/no-image.png'),
        height: 250.0,
        fit: BoxFit.cover
      );
    }
  }

  void _pickImage() async {
    _processImage(ImageSource.gallery);    
  }
  
  void _openCamera() async {
    _processImage(ImageSource.camera);
  }

  _processImage( ImageSource source) async {
    try {
      final data = await ImagePicker.pickImage(
        source: source
      );
      if (data != null) {
        product.photoUrl = null;
        setState(() {
          photo = data;
        });
      }
    } catch (e) {
    }
  }

}