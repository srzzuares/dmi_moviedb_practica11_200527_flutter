// Creado por Crystian Enrique Suarez Cuevas <200527>
// 04-10-2023
// Asignatura: Desarrollo Movil Integral
// Grado: 10° Grupo: A
// Profesor MTI. Marco Antorio Ramirez Hernandez
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dmi_moviedb_practica11_200527_flutter/common/Constants.dart';
import 'package:dmi_moviedb_practica11_200527_flutter/model/Media.dart';

class HttpHandler {
  static final _HttpHandler = new HttpHandler();
  final String _baseUrl = "api.themoviedb.org"; // Define la URL base de la API.
  final String _lenguaje = "es-MX";

  static HttpHandler get() {
    return _HttpHandler;
  }

  // Define una función asincrónica para obtener datos JSON desde una URI.
  Future<dynamic> getJson(Uri uri) async {
    http.Response response =
        await http.get(uri); // Realiza una solicitud GET HTTP.
    return json.decode(response.body); // Decodifica la respuesta JSON.
  }

  // Define una función para recuperar una lista de películas.
  Future<List<Media>> fetchMovies() {
    var uri = Uri.https(
        _baseUrl,
        "3/movie/popular", // Crea una URI para obtener películas populares.
        {
          'api_key': API_KEY,
          'page': "1",
          'languaje': _lenguaje
        }); // Parámetros de la solicitud.
    // Llama a la función getJson para obtener datos y mapearlos en objetos de tipo Media.
    return getJson(uri).then(((data) => data['results']
        .map<Media>((item) => Media(item, MediaType.movie))
        .toList()));
  }

  Future<List<Media>> fetchShow() {
    var uri = Uri.https(_baseUrl, "3/tv/popular",
        {'api_key': API_KEY, 'page': "1", 'languaje': _lenguaje});

    return getJson(uri).then(((data) => data['results']
        .map<Media>((item) => Media(item, MediaType.show))
        .toList()));
  }
}
