import 'package:flutter/material.dart';
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class MovieDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _renderAppbar( pelicula ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0),
                _posterTitle(context, pelicula),
                _description(pelicula),
                _description(pelicula),
                _description(pelicula),
                _description(pelicula),
                _description(pelicula),
                _casting(pelicula),
              ]
            ),
          )
        ],
      )
    );
  }

  Widget _renderAppbar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 5.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackdropUrl()),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitle( BuildContext context, Pelicula pelicula ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterUrl()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(pelicula.title, style: Theme.of(context).textTheme.title, overflow: TextOverflow.ellipsis),
                Text(pelicula.originalTitle, style: Theme.of(context).textTheme.subhead, overflow: TextOverflow.ellipsis),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(pelicula.voteAverage.toString(), style: Theme.of(context).textTheme.subhead)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _description(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _casting(Pelicula pelicula) {
    final peliculasProvider = new PeliculasProvider();

    return FutureBuilder(
      future: peliculasProvider.getCast(pelicula.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _castPageView(snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator()
          );
        }
      },
    );
  }

  Widget _castPageView(List<Actor> cast) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        itemCount: cast.length,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1
        ),
        itemBuilder: (context, i) {
          return _actorCard(cast[i]);
        },

      ),
    );
  }

  Widget _actorCard(Actor actor) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(actor.getPhotoUrl()),
              placeholder: AssetImage('assets/no-image.jpg'),
              height: 140.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

}