import 'package:flutter/material.dart';

import 'package:form_validation/src/bloc/login_bloc.dart';
import 'package:form_validation/src/bloc/products_bloc.dart';

export 'package:form_validation/src/bloc/products_bloc.dart';
export 'package:form_validation/src/bloc/login_bloc.dart';


class Provider extends InheritedWidget {

  static Provider _instance;

  final loginBloc = new LoginBloc();
  final _productsBloc = new ProductsBloc();

  factory Provider({ Key key, Widget child }) {
    if (_instance == null) {
      _instance = new Provider._internal(key: key, child: child);
    }
    return _instance;
  }

  Provider._internal({ Key key, Widget child })
    : super(key: key, child: child);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static LoginBloc of (BuildContext context) {
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider ).loginBloc;
  }

  static ProductsBloc productsBloc (BuildContext context) {
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider )._productsBloc;
  }

}