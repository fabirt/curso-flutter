import 'package:flutter/material.dart';

import 'package:componentes_app/src/utils/colors.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/7a/ea/a9/7aeaa90835bf91dd31eaf9bfac9bb77a.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text(
                'KN',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Palette.accent,
            ),
          )
        ],
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        color: Palette.surface,
        child: Column(
          children: <Widget>[
            Expanded(
              child: FadeInImage(
                image: NetworkImage(
                    'https://66.media.tumblr.com/75702e6fe4ae86904664340f570eea51/tumblr_ppuo4th7Sj1qg53joo1_1280.jpg'),
                placeholder: AssetImage('assets/jar-loading.gif'),
                fadeInDuration: Duration(milliseconds: 300),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
