import 'package:flutter/material.dart';
import 'package:qr_reader_app/src/pages/home_page.dart';
import 'package:qr_reader_app/src/pages/map_viewer_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR scanner',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => Scaffold(body: HomePage()),
        'map': (BuildContext context) => MapViewerPage()
      },
      theme: ThemeData(
        primaryColor: Color(0xFFE66868),
        accentColor: Color(0xFFEB8686)
      ),
    );
  }
}