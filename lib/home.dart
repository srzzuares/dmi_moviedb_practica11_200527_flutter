// Creado por Crystian Enrique Suarez Cuevas <200527>
// 06-10-2023
// Asignatura: Desarrollo Movil Integral
// Grado: 10° Grupo: A
// Profesor MTI. Marco Antorio Ramirez Hernandez
import 'package:dmi_moviedb_practica11_200527_flutter/model/Media.dart';
import 'package:flutter/material.dart';
import 'package:dmi_moviedb_practica11_200527_flutter/media_list.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dmi_moviedb_practica11_200527_flutter/common/MediaProvider.dart';

class Home extends StatefulWidget {
  const Home(
      {super.key}); // Constructor de Home con un parámetro opcional llamado key.
  @override
  State<Home> createState() =>
      _HomeState(); // Define una clase que extiende StatefulWidget y proporciona un método para crear su estado interno.
}

class _HomeState extends State<Home> {
  final MediaProvider movieProvider = MovieProvider();
  final MediaProvider showProvider = ShowProvider();
  MediaType mediaType = MediaType.movie;
  // Define una clase que extiende State y representa el estado interno de Home.

  @override
  Widget build(BuildContext context) {
    // Crear una página Scaffold que contiene la estructura principal de la aplicación
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Barra de navegación superior (AppBar) con un título y un botón de búsqueda
        title: Text(
          '200527 - Peliquiando',
          style: TextStyle(fontFamily: 'Bebas', fontSize: 24),
          selectionColor: Colors.white,
        ), // Título de la aplicación
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // Acción a ejecutar cuando se presiona el botón de búsqueda
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(
                  child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('asset/icon/MovieTube_Logo.png'))),
                ),
              )),
              ListTile(
                leading: Icon(Icons.local_movies),
                title: Text('Peliculas',
                    style: TextStyle(fontFamily: 'Bebas', fontSize: 24)),
                //selected: mediaType == MediaType.movie,
                onTap: () {
                  _changeMediaType(MediaType.movie);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.live_tv),
                title: Text('Television',
                    style: TextStyle(fontFamily: 'Bebas', fontSize: 24)),
                //selected: mediaType == MediaType.movie,
                onTap: () {
                  _changeMediaType(MediaType.show);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.close),
                title: Text('Cerrar',
                    style: TextStyle(fontFamily: 'Bebas', fontSize: 24)),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        children: _getMediaList(),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.all(10),
        child: GNav(
          padding: EdgeInsets.only(right: 12, left: 12, bottom: 25, top: 25),
          gap: 5,
          tabBackgroundColor: Colors.grey.shade800,
          tabMargin: EdgeInsets.all(3),
          textStyle: TextStyle(
              fontFamily: 'Bebas', fontSize: 20, color: Colors.tealAccent),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Inicio',
            ),
            GButton(
              icon: Icons.trending_up,
              text: 'Populares',
            ),
            GButton(
              icon: Icons.flip_camera_android,
              text: 'Proximamente',
            ),
            GButton(
              icon: Icons.favorite_border_outlined,
              text: 'Mejor Valoradas',
            ),
          ],
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.tealAccent,
        ),
      ),
    );
  }

  // Método para obtener los elementos de la barra de navegación inferior

  void _changeMediaType(MediaType type) {
    if (mediaType != type) {
      setState(() {
        mediaType = type;
      });
    }
  }

  List<Widget> _getMediaList() {
    return (mediaType == MediaType.movie)
        ? <Widget>[MediaList(movieProvider)]
        : <Widget>[MediaList(showProvider)];
  }
}
