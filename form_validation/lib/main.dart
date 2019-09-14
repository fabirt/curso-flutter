import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/pages/home_page.dart';
import 'package:form_validation/src/pages/login_page.dart';
import 'package:form_validation/src/pages/product_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarBrightness: Brightness.dark
    ));

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Form Validation',
        initialRoute: 'home',
        routes: {
          'login'   : (BuildContext context) => LoginPage(),
          'home'    : (BuildContext context) => HomePage(),
          'product' : (BuildContext context) => ProductPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      )
    );
    
  }
}