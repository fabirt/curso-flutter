import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_reader_app/src/bloc/scans_bloc.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

import 'package:qr_reader_app/src/pages/addresses_page.dart';
import 'package:qr_reader_app/src/pages/maps_page.dart';
import 'package:qr_reader_app/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  final scansBloc = ScansBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scansBloc.deleteAll,
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _buildBottomBavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus, color: Colors.white,),
        onPressed: () => _scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR(BuildContext context) async {
    // https://flaticon.com
    // geo:40.74296409443502,-74.12541761835939
    // String futureString = '';
    String futureString = '';
    try {
      futureString = await new QRCodeReader().scan();
      if (futureString != null) {
        if (futureString.contains(RegExp(r'http|geo'))) {
          final scan = ScanModel(value: futureString);
          scansBloc.addScan(scan);

          if (Platform.isIOS) {
            Future.delayed( Duration( milliseconds: 800 ), () {
              utils.launchScan(context, scan);
            });
          } else {
              utils.launchScan(context, scan);
          }
        } else {
          throw 'QR no compatible';
        }
      }
    } catch (e) {
      _showSnackBar(context, e.toString());
    }

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
          title: Text('Ubicaciones', style: TextStyle(fontSize: 12),)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cloud_queue),
          title: Text('Enlaces', style: TextStyle(fontSize: 12))
        ),
      ],
    );
  }

  _showSnackBar(BuildContext context, String content) {
    final snackBar = SnackBar(
      content: Text(content),
      action: SnackBarAction(
        label: 'OK',
        onPressed: (){},
        textColor: Theme.of(context).primaryColor,
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }
}
