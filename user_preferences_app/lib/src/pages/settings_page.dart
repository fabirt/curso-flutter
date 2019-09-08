import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/widgets/drawer_menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _notificacionPermissions = false;
  int _gender = 1;
  String _name = 'Nezuko';

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController(text: _name);
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
              });
            },
          ),

          Divider(),

          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
          ),
          
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
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
              onChanged: (value){},
            ),
          )
        ],
      )
    );
  }
}