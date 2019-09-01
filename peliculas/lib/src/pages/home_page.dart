import 'package:flutter/material.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';


class HomePage extends StatelessWidget {

  final peliculasProvider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Películas en cine'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperTarjetas()
          ],
        ),
      )
    );
  }


  Widget _swiperTarjetas() {
    // peliculasProvider.getNowPlaying();
    // return CardSwiper(
    //   peliculas: [1, 2, 3, 4, 5],
    // );
    return FutureBuilder(
      future: peliculasProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            peliculas: snapshot.data,
          );
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
      },
    );
  }

}