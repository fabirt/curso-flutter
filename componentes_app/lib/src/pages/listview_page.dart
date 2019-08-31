
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:componentes_app/src/utils/colors.dart';


class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}


class _ListViewPageState extends State<ListViewPage> {
  
  List<int> _listaNumeros = new List();
  int _lastItem = 0;
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchMoreImages();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: Text('Listas'),
      ),
      body: Container(
        color: Palette.surface,
        child: Stack(
          children: <Widget>[
            _crearLista(),
            _crearLoading(),
          ],
        )
      ),
      
    );
  }


  Widget _crearLista() {

    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );

  }


  void _fetchMoreImages() {
    for (int i = 1; i < 10; i++) {
      _lastItem++;
      _listaNumeros.add(_lastItem);
    }
    setState(() {
      
    });
  }

  Future fetchData() async {
    setState(() {
      _isLoading = true;
    });
    final duration = new Duration(seconds: 2);
    return new Timer(duration, _respuestaHTTP);
  }

  void _respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 300)
    );
    _fetchMoreImages();
  }


  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Palette.accent,
                strokeWidth: 6.0,
              )
            ],
          ),
          SizedBox(height: 30.0,)
        ],
      );
    } else {
      return Container();
    }
  }


  Future<Null> refresh() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _lastItem++;
      _fetchMoreImages();
    });
    return Future.delayed(duration);
  }

}
