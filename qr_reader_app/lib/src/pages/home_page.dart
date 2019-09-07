import 'package:flutter/material.dart';
import 'package:qr_reader_app/src/pages/addresses_page.dart';
import 'package:qr_reader_app/src/pages/maps_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      bottomNavigationBar: _buildBottomBavigationBar(),
    );
  }

  Widget _callPage(int currentPage) {
    switch (currentPage) {
      case 0: return MapsPage();
      case 1: return AddressesPage();
      default: return MapsPage();
    }
  }

  Widget _buildBottomBavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.collections_bookmark),
          title: Text('Direcciones')
        ),
      ],
    );
  }
}