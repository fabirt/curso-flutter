
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final textStyle = new TextStyle( fontSize: 25 );
  
  final conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de taps:', style: textStyle,),
            Text('$conteo', style: textStyle,)
          ]
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // conteo++;
          },
          child: Icon( Icons.add ),
        ),
    );
  }

}
