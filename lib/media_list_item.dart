// Creado por Crystian Enrique Suarez Cuevas <200527>
// 06-10-2023
// Asignatura: Desarrollo Movil Integral
// Grado: 10° Grupo: A
// Profesor MTI. Marco Antorio Ramirez Hernandez
import 'package:flutter/material.dart';
import 'package:dmi_moviedb_practica11_200527_flutter/model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;
  MediaListItem(this.media);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      child: Column(children: [
        Container(
            child: Stack(
          children: [
            FadeInImage.assetNetwork(
              placeholder: "asset/img/waitting2.gif",
              image: media.getBackDropUrl(),
              fit: BoxFit.cover,
              height: 230,
              fadeInDuration: Duration(milliseconds: 40),
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 20, 5, 52).withOpacity(.6)),
                constraints: BoxConstraints.expand(height: 55),
              ),
              left: 0,
              bottom: 0,
              right: 0,
            ),
            Positioned(
                left: 10,
                bottom: 5,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        media.title,
                        style: TextStyle(
                            fontFamily: "Bebas",
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 250.0,
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        media.getGenres(),
                        style: TextStyle(
                            fontFamily: "Bebas",
                            fontSize: 20,
                            color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )),
            Positioned(
                right: 5.0,
                bottom: 7.0,
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        media.voteAverage.toString(),
                        style: TextStyle(
                            fontFamily: "Bebas",
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Container(
                        width: 4.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  ),
                  Container(
                    height: 4.0,
                  ),
                  Row(children: <Widget>[
                    Text(
                      media.releaseDate.toString(),
                      style: TextStyle(
                          fontFamily: "Bebas",
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Container(
                      width: 4.0,
                    ),
                    Icon(
                      Icons.date_range,
                      color: Colors.white,
                      size: 16,
                    )
                  ])
                ]))
          ],
        ))
      ]),
    );
  }
}
