import 'package:flutter/material.dart';
import 'package:dmi_moviedb_practica11_200527_flutter/model/Media.dart';

class MediaDetail extends StatelessWidget {
  final Media media;
  MediaDetail(this.media);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            media.getBackDropUrl(),
            fit: BoxFit.cover,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
