import 'package:flutter/material.dart';

import 'package:componentes_app/src/utils/colors.dart';


final _icons = <String, IconData>{
  'add_alert'     : Icons.sim_card_alert,
  'accessibility' : Icons.person_pin,
  'folder_open'   : Icons.credit_card
};

Icon getIcon( String nombreIcono ) {

  return Icon( _icons[nombreIcono], color: Palette.accent );

}

