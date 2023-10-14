// Creado por Crystian Enrique Suarez Cuevas <200527>
// 06-10-2023
// Asignatura: Desarrollo Movil Integral
// Grado: 10° Grupo: A
// Profesor MTI. Marco Antorio Ramirez Hernandez
import 'package:dmi_moviedb_practica11_200527_flutter/media_detail.dart';
import 'package:flutter/material.dart';
import 'package:dmi_moviedb_practica11_200527_flutter/model/Media.dart';
import 'package:dmi_moviedb_practica11_200527_flutter/media_list_item.dart';
import 'package:dmi_moviedb_practica11_200527_flutter/common/MediaProvider.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  MediaList(this.provider);
  @override
  _MediaListState createState() =>
      _MediaListState(); // Define una clase que extiende StatefulWidget y proporciona un método para crear su estado interno.
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];
  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  @override
  void didUpdateWidget(MediaList oldWidget) {
    if (oldWidget.provider.runtimeType != widget.provider.runtimeType) {
      _media = [];
      loadMedia();
    }
    super.didUpdateWidget(oldWidget);
  }

  void loadMedia() async {
    var media = await widget.provider.fetchMedia();
    setState(() {
      _media.addAll(media);
    });
  }

  // Define una clase que extiende State y representa el estado interno de MediaList.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            child: MediaListItem(_media[index]),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MediaDetail(_media[index]);
              }));
            },
          );
        },
      ),
    );
  }
}
