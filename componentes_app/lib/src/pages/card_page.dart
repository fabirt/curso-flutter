import 'package:flutter/material.dart';

import 'package:componentes_app/src/utils/colors.dart';


class CardPage extends StatelessWidget {

  final items = List(10); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: Text('Cards'),
      ),
      body: Container(
        color: Palette.surface,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: _renderItems(items)
        ),
      ),
    );
  }

  Widget _cardTipo1({ String title, String subtitle }) {

    return Card(
      color: Palette.grey,
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(
              top: 8.0,
              left: 14.0,
              right: 20.0
            ),
            leading: Icon( Icons.photo_album, color: Palette.accent),
            title: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Container(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                  subtitle,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white)
                )
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('egestas', style: TextStyle(color: Palette.accent),),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('morbi', style: TextStyle(color: Palette.accent)),
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );

  }

  Widget _cardTipo2({ String label, String url }) {

    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          Container(
            color: Palette.grey,
            child: FadeInImage(
              image: NetworkImage(url),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 300),
              height: 300.0,
              fit: BoxFit.cover,
            ),
          ),
          // Image(
          //   image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
          // ),
          Container(
            color: Palette.grey,
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 14.0
            ),
            child: Text( label,
              maxLines: 1,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Palette.grey,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );

  }

  List<Widget> _renderItems(List<dynamic> data) {
    return data.map((item) {
      return Column(
        children: <Widget>[
          _cardTipo1(
            title: 'Massa sed elementum tempus egestas',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
          ),
          SizedBox(height: 30.0,),
          _cardTipo2(
            label: 'Nunc scelerisque viverra eget egestas purus viverra accumsan in',
            // url: 'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'
            url: 'https://wallup.net/wp-content/uploads/2015/12/167173-anime-landscape.jpg'
          ),
          SizedBox(height: 30.0,)
        ],
      );
    }).toList();
  }

}