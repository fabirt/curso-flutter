import 'package:flutter/material.dart';

import 'package:componentes_app/src/providers/menu_provider.dart';
import 'package:componentes_app/src/utils/colors.dart';
import 'package:componentes_app/src/utils/icono_string_util.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: Text('Componentes'),
      ),
      body: _lista(),

    );
  }

  Widget _lista() {
    // menuProvider.cargarData()
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Container(
          color: Palette.surface,
          child: ListView(
            children: _listaItems(context, snapshot.data),
          ),
        );
      },
    );
  }

  List<Widget> _listaItems( BuildContext context, List<dynamic> data) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto'], style: TextStyle(color: Colors.white),),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Palette.accent),
        onTap: () {
          // final route = MaterialPageRoute(
          //   builder: ( context ) => AlertPage()
          // );
          // Navigator.push(context, route);
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones..add(widgetTemp)..add(Divider(color: Palette.grey,));
    });
    return opciones;
  }
}
