import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica_disenos/src/pages/adv_design_page.dart';
import 'package:practica_disenos/src/pages/basic_page.dart';
import 'package:practica_disenos/src/pages/scroll_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Práctica diseños',
      initialRoute: 'scroll',
      routes: {
        'basic' : ( BuildContext context ) => BasicPage(),
        'scroll': ( BuildContext context ) => ScrollPage(),
        'adv'   : ( BuildContext context ) => AdvDesignPage()
      },
      
    );
  }
}