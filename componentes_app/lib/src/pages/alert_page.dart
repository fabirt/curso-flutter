import 'package:flutter/material.dart';

import 'package:componentes_app/src/utils/colors.dart';


class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: Text('Alertas'),
      ),
      body: Container(
        color: Palette.surface,
        child: Center(
          child: RaisedButton(
            color: Palette.accent,
            shape: StadiumBorder(),
            child: Text('Mostrar Alert', style: TextStyle(color: Colors.white),),
            onPressed: () => _mostrarAlert(context),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.accent,
        child: Icon( Icons.power_settings_new ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }


  void _mostrarAlert( BuildContext context ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {

        return AlertDialog(
          backgroundColor: Palette.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Gravida arcu ac', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', style: TextStyle(color: Colors.white)),
              // FlutterLogo( size: 100.0, )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar', style: TextStyle(color: Palette.accent)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('OK', style: TextStyle(color: Palette.accent)),
              onPressed: () => Navigator.of(context).pop(),              
            )
          ],
        );

      }
    );
  }


}