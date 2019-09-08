import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/pages/home_page.dart';
import 'package:user_preferences_app/src/pages/settings_page.dart';
import 'package:user_preferences_app/src/shared_prefs/user_preferences.dart';
 
void main() async {
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName    : ( BuildContext context ) => HomePage(),
        SettingsPage.routeName: ( BuildContext context ) => SettingsPage()
      },
    );
  }
}