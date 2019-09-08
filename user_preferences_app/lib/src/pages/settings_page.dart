import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/widgets/drawer_menu_widget.dart';

class SettingsPage extends StatelessWidget {

  static final String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: DrawerMenuWidget(),
      body: Center(
        child: Text('Ajustes'),
      )
    );
  }
}