import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/pages/settings_page.dart';
import 'package:user_preferences_app/src/shared_prefs/user_preferences.dart';
import 'package:user_preferences_app/src/widgets/drawer_menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
      ),
      drawer: DrawerMenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Notificaciones: ${prefs.notificacionPermissions}'),
          Divider(),
          Text('Género: ${prefs.gender}'),
          Divider(),
          Text('Nombre usuario: ${prefs.userName}'),
          Divider(),
        ],
      ),
    );
  }

 
}