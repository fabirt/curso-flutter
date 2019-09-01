import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';


class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function onEndReached;
  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );

  MovieHorizontal({ @required this.peliculas, @required this.onEndReached });

  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200) {
        onEndReached();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        // children: _tarjetas(context),
        controller: _pageController,
        itemCount: peliculas.length,
        itemBuilder: (context, i) {
          return _movieCard(
            context,
            pelicula: peliculas[i]
          );
        },
      ),
    );
  }


  Widget _movieCard(BuildContext context, { Pelicula pelicula }) {
    pelicula.uniqueId = '${pelicula.id}-populars';
    
    final card = Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: pelicula.uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterUrl()),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 130.0,
                ),
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );

      return GestureDetector(
        child: card,
        onTap: (){
          Navigator.pushNamed(context, 'detail', arguments: pelicula);
        }
      );
  }


  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterUrl()),
                placeholder: AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
                height: 130.0,
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }

}
