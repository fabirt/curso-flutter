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

  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName    : ( BuildContext context ) => HomePage(),
        SettingsPage.routeName: ( BuildContext context ) => SettingsPage()
      },
    );
  }
}