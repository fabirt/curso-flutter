import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class AdvDesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildAppBackground(context),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildTitle(),
                _buildMenu(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context)
    );
  }

  Widget _buildAppBackground(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.5),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );

    final gradientBox = Transform.rotate(
      angle: pi / 5.0,
      // angle: 0.0,
      child: Container(
        height: 360.0,
        width: size.width * 0.92,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90.0),
          gradient: LinearGradient(
            begin: FractionalOffset(0.44, 0.4),
            end: FractionalOffset(0.9, 0.9),
            colors: [
              Color.fromRGBO(241, 142, 172, 1.0),
              Color(0xFFFF00C4),
            ]
          ) 
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          top: -100.0,
          left: -20.0,
          child: gradientBox
        )
      ],
    );
  }

  Widget _buildTitle() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 60.0, top: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Classify transaction', style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 12.0),
            Text('Classify this transaction into a particular category', style: TextStyle(color: Colors.white70, fontSize: 16.0))
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Color(0xFFFF00C4),
        textTheme:  Theme.of(context).textTheme
          .copyWith(caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range, size: 26.0,),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart, size: 26.0,),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 26.0,),
            title: Container()
          ),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Table(
      children: [
        TableRow(
          children: [
            _buildMenuItem( color: Color(0xFF0096FF), icon: Icons.border_all, title: 'General' ),
            _buildMenuItem( color: Color(0xFF8A14FF), icon: Icons.directions_bus, title: 'Transport' ),
          ]
        ),
        TableRow(
          children: [
            _buildMenuItem( color: Color(0xFFFF00E5), icon: Icons.shop, title: 'Shopping' ),
            _buildMenuItem( color: Color(0xFFFF8631), icon: Icons.pages, title: 'Bills' ),
          ]
        ),
        TableRow(
          children: [
            _buildMenuItem( color: Color(0xFF4B60FF), icon: Icons.tv, title: 'Entertainment' ),
            _buildMenuItem( color: Color(0xFF00E257), icon: Icons.fastfood, title: 'Grocery' ),
          ]
        ),
        TableRow(
          children: [
            _buildMenuItem( color: Colors.blue, icon: Icons.border_all, title: 'General' ),
            _buildMenuItem( color: Colors.blue, icon: Icons.border_all, title: 'General' ),
          ]
        ),
      ],
    );
  }

  Widget _buildMenuItem({ Color color, IconData icon, String title }) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
          child: Container(
            height: 166.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 5.0,),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    gradient: LinearGradient(
                      begin: FractionalOffset(-0.4, 0.1),
                      end: FractionalOffset(1.0, 1.0),
                      colors: [
                        Colors.white,
                        color
                      ]
                    ),
                  ),
                  child: Center(
                    child: Icon(icon, color: Colors.white, size: 30.0),
                  ),
                ),
                // CircleAvatar(
                //   radius: 35.0,
                //   backgroundColor: color,
                //   child: Icon(icon, color: Colors.white, size: 30.0),
                // ),
                Text(title, style: TextStyle(color: color),),
                SizedBox(height: 5.0,)
              ],
            ),
          ),
        ),
      ),
    );
  }

}