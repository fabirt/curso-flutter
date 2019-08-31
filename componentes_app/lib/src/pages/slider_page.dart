import 'package:flutter/material.dart';

import 'package:componentes_app/src/utils/colors.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.0;
  bool _bloquearSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: Text('Sliders'),
      ),
      body: Container(
        color: Palette.surface,
        padding: EdgeInsets.only(top: 40.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }


  Widget _crearSlider() {

    return Slider(
      activeColor: Palette.accent,
      inactiveColor: Palette.primary,
      label: 'Tamaño de la imagen',
      // divisions: 200,
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: ( _bloquearSlider ) ? null :
        (value) {
          setState(() {
            _sliderValue = value;
          });
        },
    );

  }


  Widget _checkBox() {
    // return Checkbox(
    //   value: _bloquearSlider,
    //   onChanged: (value) {
    //     setState(() {
    //       _bloquearSlider = value;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear', style: TextStyle(color: Colors.white70),),
      value: _bloquearSlider,
      activeColor: Palette.accent,
      onChanged: (value) {
        setState(() {
          _bloquearSlider = value;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear', style: TextStyle(color: Colors.white70),),
      value: _bloquearSlider,
      activeColor: Palette.accent,
      onChanged: (value) {
        setState(() {
          _bloquearSlider = value;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://vignette.wikia.nocookie.net/vocaloid/images/5/57/Miku_v4_bundle_art.png/revision/latest?cb=20190426145652'),
      width: _sliderValue,
      fit: BoxFit.contain
    );
  }

}
