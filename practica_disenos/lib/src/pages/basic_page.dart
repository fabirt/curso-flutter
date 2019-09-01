import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  final titleStyle = TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold);
  final subtitleStyle = TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildImage(),
            _buildTitle(),
            _buildActions(),
            _buildTextContent(),
            _buildTextContent(),
            _buildTextContent(),
          ],
        ),
      )
    );
  }

  Widget _buildImage() {
    return Image(
      width: double.infinity,
      image: NetworkImage(
        'https://sotoak.com/wallpapers/dark-anime-scenery-wallpapers-desktop-As-Wallpaper-HD.jpg'
      ),
      height: 220.0,
      fit: BoxFit.cover,
    );
  }

  Widget _buildTitle() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Feugiat in fermentum', style: titleStyle),
                  SizedBox(height: 10.0),
                  Text('Tincidunt, Ornare', style: subtitleStyle)
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.red, size: 24.0),
            Text('41', style: TextStyle(fontSize: 15.0))
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildAction(
          icon: Icons.call,
          text: 'CALL'
        ),
        _buildAction(
          icon: Icons.near_me,
          text: 'ROUTE'
        ),
        _buildAction(
          icon: Icons.share,
          text: 'SHARE'
        )
      ]
    );
  }

  Widget _buildAction({ IconData icon, String text }) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.blue, size: 20.0),
        SizedBox(height: 6.0),
        Text(text, style: TextStyle(fontSize: 13.0, color: Colors.blue),)
      ]
    );
  }

  Widget _buildTextContent() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tortor vitae purus faucibus ornare suspendisse sed. Eleifend mi in nulla posuere sollicitudin aliquam ultrices. Sollicitudin ac orci phasellus egestas tellus rutrum tellus. Sed augue lacus viverra vitae congue eu consequat. A scelerisque purus semper eget duis at tellus at. Amet volutpat consequat mauris nunc congue nisi vitae. Pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet. Imperdiet sed euismod nisi porta lorem mollis aliquam ut porttitor. Vestibulum lectus mauris ultrices eros in. In hac habitasse platea dictumst vestibulum.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

}
