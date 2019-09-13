import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';
export 'package:form_validation/src/bloc/login_bloc.dart';


class Provider extends InheritedWidget {

  final loginBloc = LoginBloc();

  Provider({ Key key, Widget child })
    : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static LoginBloc of (BuildContext context) {
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider ).loginBloc;
  }

}