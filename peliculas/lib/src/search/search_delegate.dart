import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';


class DataSearch extends SearchDelegate {

  String selection = '';
  final provider = new PeliculasProvider();

  final movies = [
    'Spdimerna',
    'Aqueman',
    'Bataman',
    'Shazam',
    'Capitan america'
  ];

  final recentMovies = [
    'Shazam',
    'Capitan america'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation
      ),
      onPressed: (){
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que se van a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(selection),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: provider.searchMovies(query),
        builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (snapshot.hasData) {
            final movies = snapshot.data;
            return ListView(
              children: movies.map((movie) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(movie.getPosterUrl()),
                    placeholder: AssetImage('assets/no-image.jpg'),
                    fit: BoxFit.contain
                  ),
                  title: Text(movie.title),
                  subtitle: Text(movie.originalTitle),
                  onTap: () {
                    close(context, null);
                    movie.uniqueId = '';
                    Navigator.pushNamed(context, 'detail', arguments: movie);
                  },
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }



  // @override
  // Widget buildSuggestions(BuildContext context) {

  //   final suggestedList = ( query.isEmpty ) 
  //     ? recentMovies 
  //     : movies.where(
  //       (p) => p.toLowerCase().startsWith(query.toLowerCase())
  //     ).toList();

  //   // Son las sugerencias que aparecen cuando la persona escribe
  //   return ListView.builder(
  //     itemCount: suggestedList.length,
  //     itemBuilder: (context, i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(suggestedList[i]),
  //         onTap: (){
  //           selection = suggestedList[i];
  //           showResults(context);
  //         },
  //       );
  //     }
  //   );
  // }


}