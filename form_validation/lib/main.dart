import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/pages/home_page.dart';
import 'package:form_validation/src/pages/login_page.dart';
import 'package:form_validation/src/pages/product_page.dart';
import 'package:form_validation/src/pages/register_page.dart';
import 'package:form_validation/src/preferences/user_preferences.dart';
 
void main() async {
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {

  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarBrightness: Brightness.dark
    ));

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Selloria',
        initialRoute: prefs.lastPage,
        routes: {
          'login'   : (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'home'    : (BuildContext context) => HomePage(),
          'product' : (BuildContext context) => ProductPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          accentColor: Colors.deepPurple[400],
          fontFamily: 'Lato'
        ),
      )
    );
    
  }
}