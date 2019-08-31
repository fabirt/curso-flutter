import 'package:flutter/material.dart';
import 'dart:math';

import 'package:componentes_app/src/utils/colors.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
        backgroundColor: Palette.primary,
      ),
      body: Container(
        color: Palette.surface,
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(borderRadius: _borderRadius, color: _color),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.accent,
        child: Icon(Icons.play_arrow),
        onPressed: _animateContainer,
      ),
    );
  }

  void _animateContainer() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(400).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1
      );
      _borderRadius = BorderRadius.circular( random.nextInt(100).toDouble() );
    });
  }
}
