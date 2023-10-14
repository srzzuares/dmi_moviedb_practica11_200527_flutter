import 'dart:async';
import 'package:dmi_moviedb_practica11_200527_flutter/common/HttpHandler.dart';
import 'package:dmi_moviedb_practica11_200527_flutter/model/Media.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia();
}

class MovieProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchMovies();
  }
}

class ShowProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchShow();
  }
}
