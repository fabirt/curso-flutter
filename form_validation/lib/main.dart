import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validation/src/pages/home_page.dart';
import 'package:form_validation/src/pages/login_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarBrightness: Brightness.dark
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Validation',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage()
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}