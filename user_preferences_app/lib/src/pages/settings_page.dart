import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/shared_prefs/user_preferences.dart';

import 'package:user_preferences_app/src/widgets/drawer_menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _notificacionPermissions;
  int _gender;
  String _name = '';
  TextEditingController _textEditingController;
  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    _gender = prefs.gender;
    prefs.lastPage = SettingsPage.routeName;
    _notificacionPermissions = prefs.notificacionPermissions;
    _textEditingController = new TextEditingController(text: prefs.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: DrawerMenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),

          Divider(),

          SwitchListTile(
            value: _notificacionPermissions,
            title: Text('Notificaciones'),
            onChanged: (value) {
              setState(() {
                _notificacionPermissions = value;
                prefs.notificacionPermissions = value;
              });
            },
          ),

          Divider(),

          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _gender,
            onChanged: _setSelectedGender
          ),
          
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _gender,
            onChanged: _setSelectedGender,
          ),

          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de usuario'
              ),
              onChanged: (value) {
                prefs.userName = value;
              },
            ),
          )
        ],
      )
    );
  }


  _setSelectedGender(int value) {
    prefs.gender = value;
    _gender = value;
    setState(() {});
  }

}