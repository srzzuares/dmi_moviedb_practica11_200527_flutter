// Creado por Crystian Enrique Suarez Cuevas <200527>
// 06-10-2023
// Asignatura: Desarrollo Movil Integral
// Grado: 10° Grupo: A
// Profesor MTI. Marco Antorio Ramirez Hernandez
import 'package:flutter/material.dart';
import 'package:dmi_moviedb_practica11_200527_flutter/home.dart';

void main() {
  // Función principal del programa
  runApp(MaterialApp(
    // Inicializa la aplicación Flutter
    debugShowCheckedModeBanner:
        false, // Desactiva la etiqueta de depuración en la esquina superior derecha de la aplicación
    home:
        Home(), // Define la pantalla de inicio de la aplicación como una instancia de la clase Home
    theme: ThemeData
        .dark(), // Establece el tema de la aplicación como un tema oscuro
  ));
}
