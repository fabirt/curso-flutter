import 'package:flutter/material.dart';
import 'package:practica_disenos/src/pages/basic_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Práctica diseños',
      initialRoute: 'basic',
      routes: {
        'basic'  : ( BuildContext context ) => BasicPage()
      },
      
    );
  }
}